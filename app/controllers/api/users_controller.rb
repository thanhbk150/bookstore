class Api::UsersController < Api::ApiController

  def index
    keyword = params[:keyword] || ''
    page = params[:page] || 1
    limit = params[:per_page] || 20
    offset = (page.to_i - 1) * limit.to_i

    if keyword.present?
      ##### Search in Solr #####
      user_ids = []
      search = User.search do
        fulltext "#{keyword}" do
          fields(:first_name, :last_name, :email)
        end
        paginate :page => 1, :per_page => 1000
      end
      if search.total != 0
        search.hits.each do |hit|
          user_ids.push(hit.primary_key)
        end
      end
      logger.debug "--- user_ids: #{user_ids.inspect} -- "

      user_ids.push(0) if user_ids.blank?

      @users = User.where(user_id: user_ids).limit(limit).offset(offset).order("user_id DESC")
      @total = User.where(user_id: user_ids).select(:user_id).count
    else
      @users = User.all.limit(limit).offset(offset).order("user_id DESC")
      @total = User.select(:user_id).count
    end

    render json: { data: @users, total: @total }
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: { data: @user, status: :ok, message: 'Success' }
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { status: :ok, message: 'User was successfully deleted.' }
    else
      render json: { errors: @user.errors.full_messages.join(", "), status: :unprocessable_entity }
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :first_name, :last_name, :password, :email, :phone, :address)
  end
end
