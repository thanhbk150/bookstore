class Api::BookCategoriesController < Api::ApiController

  def index
    keyword = params[:keyword] || ''
    page = params[:page] || 1
    limit = params[:per_page] || 20
    offset = (page.to_i - 1) * limit.to_i

    book_category_ids = []
    if keyword.present?
      ##### Search in Solr #####
      
      search = BookCategory.search do
        fulltext "#{keyword}" do
          fields(:name)
        end
        paginate :page => 1, :per_page => 1000
      end
      if search.total != 0
        search.hits.each do |hit|
          book_category_ids.push(hit.primary_key)
        end
      end
      logger.debug "--- book_category_ids: #{book_category_ids.inspect} -- "

      book_category_ids.push(0) if book_category_ids.blank?
    end

    @model = BookCategory.joins(:books).group("book_categories.book_category_id")
    @model = @model.where(book_category_id: book_category_ids) if book_category_ids.present?

    @book_categories = @model.select("book_categories.book_category_id, name, COUNT(books.book_id) AS total_book")
                        .limit(limit).offset(offset)
                        .order("book_categories.book_category_id DESC")

    @total = @model.select(:book_category_id).count


    render json: { data: @book_categories, total: @total }
  end

  def create
    @book_category = BookCategory.new(bookcategory_params)
    if @book_category.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @book_category.errors, status: :unprocessable_entity }
    end
  end

  def show
    @book_category = BookCategory.select("book_categories.book_category_id, name, book_categories.description, COUNT(books.book_id) AS total_book")
                                 .joins(:books)
                                 .where(book_category_id: params[:id])
                                 .group("book_categories.book_category_id")
                                 .last
    render json: { data: @book_category, status: :ok, message: 'Success' }
  end

  def update
    @book_category = BookCategory.find(params[:id])
    if @book_category.update(bookcategory_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @book_category.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @book_category = BookCategory.find(params[:id])
    if @book_category.destroy
      render json: { status: :ok, message: 'Book Category was successfully deleted.' }
    else
      render json: { errors: @book_category.errors.full_messages.join(", "), status: :unprocessable_entity }
    end
  end

  def select2
    @book_categories = []
    @rows = BookCategory.all.order("name ASC").select("book_category_id, name")
    @rows.each do |row|
      @book_categories << { id: row.book_category_id, text: row.name }
    end
    render json: @book_categories
  end

  private

  def bookcategory_params
    params.require(:book_category).permit(:book_category_id, :name, :description)
  end
end
