class Api::PublishersController < Api::ApiController

  def index
    keyword = params[:keyword] || ''
    page = params[:page] || 1
    limit = params[:per_page] || 20
    offset = (page.to_i - 1) * limit.to_i

    if keyword.present?
      ##### Search in Solr #####
      publisher_ids = []
      search = Publisher.search do
        fulltext "#{keyword}" do
          fields(:name)
        end
        paginate :page => 1, :per_page => 1000
      end
      if search.total != 0
        search.hits.each do |hit|
          publisher_ids.push(hit.primary_key)
        end
      end
      logger.debug "--- publisher_ids: #{publisher_ids.inspect} -- "

      publisher_ids.push(0) if publisher_ids.blank?

      @publishers = Publisher.where(publisher_id: publisher_ids).limit(limit).offset(offset).order("publisher_id DESC")
      @total = Publisher.where(publisher_id: publisher_ids).select(:publisher_id).count
    else
      @publishers = Publisher.all.limit(limit).offset(offset).order("publisher_id DESC")
      @total = Publisher.select(:publisher_id).count
    end

    render json: { data: @publishers, total: @total }
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @publisher.errors, status: :unprocessable_entity }
    end
  end

  def show
    @publisher = Publisher.find(params[:id])
    render json: { data: @publisher, status: :ok, message: 'Success' }
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @publisher.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    if @publisher.destroy
      Book.where(publisher_id: params[:id]).update_all(publisher_id: nil)
      render json: { status: :ok, message: 'Publisher was successfully deleted.' }
    else
      render json: { status: :unprocessable_entity, errors: @publisher.errors.full_messages.join(", ") }
    end
  end

  def select2
    @publishers = []
    @rows = Publisher.all.order("name ASC").select("publisher_id, name")
    @rows.each do |row|
      @publishers << { id: row.publisher_id, text: row.name }
    end
    render json: @publishers
  end

  private

  def publisher_params
    params.require(:publisher).permit(:publisher_id, :name, :description, :phone, :address)
  end
end
