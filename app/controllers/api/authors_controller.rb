class Api::AuthorsController < Api::ApiController
  def index
    keyword = params[:keyword] || ''
    page = params[:page] || 1
    limit = params[:per_page] || 20
    offset = (page.to_i - 1) * limit.to_i

    if keyword.present?
      ##### Search in Solr #####
      author_ids = []
      search = Author.search do
        fulltext "#{keyword}" do
          fields(:first_name, :last_name)
        end
        paginate :page => 1, :per_page => 1000
      end
      if search.total != 0
        search.hits.each do |hit|
          author_ids.push(hit.primary_key)
        end
      end
      logger.debug "--- author_ids: #{author_ids.inspect} -- "

      author_ids.push(0) if author_ids.blank?

      @authors = Author.where(author_id: author_ids).limit(limit).offset(offset).order("author_id DESC")
      @total = Author.where(author_id: author_ids).select(:author_id).count
    else
      @authors = Author.all.limit(limit).offset(offset).order("author_id DESC")
      @total = Author.select(:author_id).count
    end

    render json: { data: @authors, total: @total }
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @author.errors, status: :unprocessable_entity }
    end
  end

  def show
    @author = Author.find(params[:id])
    render json: { data: @author, status: :ok, message: 'Success' }
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @author.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      render json: { status: :ok, message: 'Author was successfully deleted.' }
    else
      render json: { errors: @author.errors.full_messages.join(", "), status: :unprocessable_entity }
    end
  end

  def select2
    @authors = []
    @rows = Author.all.order("full_name ASC").select("author_id, CONCAT(first_name, ' ', last_name) AS full_name")
    @rows.each do |row|
      @authors << { id: row.author_id, text: row.full_name }
    end
    render json: @authors
  end

  private

  def author_params
    params.require(:author).permit(:author_id, :first_name, :last_name, :gender, :biography, :email, :phone, :address)
  end

end
