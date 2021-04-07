class Api::BooksController < Api::ApiController

  def index
    category_id = params[:category_id] || ''
    keyword = params[:keyword] || ''
    page = params[:page] || 1
    limit = params[:per_page] || 20
    offset = (page.to_i - 1) * limit.to_i

    @conditions = []
    if keyword.present?
      ##### Search in Solr #####
      # Book
      book_ids = []
      search = Book.search do
        fulltext "#{keyword}" do
          fields(:title)
        end
        paginate :page => 1, :per_page => 1000
      end
      if search.total != 0
        search.hits.each do |hit|
          book_ids.push(hit.primary_key)
        end
      end
      logger.debug "--- book_ids: #{book_ids.inspect} -- "

      # Author
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

      @keyword_conditions = []
      @keyword_conditions << "books.book_id IN (#{book_ids.join(',')})" if book_ids.present?
      @keyword_conditions << "books.author_id IN (#{author_ids.join(',')})" if author_ids.present?
      @keyword_conditions << "books.book_id = 0" if @keyword_conditions.blank?

      @conditions << "(#{@keyword_conditions.join(' OR ')})"
    end

    if category_id.present?
      @conditions << "books.book_category_id = #{category_id}"
    end

    @model = Book.joins(:author, :book_category).left_outer_joins(:publisher)
    @model = @model.where("#{@conditions.join(' AND ')}") if @conditions.present?

    @books = @model.select("book_id, title, edition_number, price, CONCAT(first_name, ' ', last_name) AS author_name, publishers.name AS publisher_name, book_categories.name AS category_name")
                   .limit(limit).offset(offset).order("book_id DESC")
    @total = @model.select(:book_id)
                   .count

    render json: { data: @books, total: @total }
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @book.errors, status: :unprocessable_entity }
    end
  end

  def show
    id = params[:id] || nil
    @book = Book.select("book_id, books.author_id, books.book_category_id, books.publisher_id, title, edition_number, copyright, books.description, price, quantity, CONCAT(first_name, ' ', last_name) AS author_name, publishers.name AS publisher_name, book_categories.name AS category_name")
                .joins(:author, :book_category).left_outer_joins(:publisher).where(book_id: id).last
    render json: { data: @book, status: :ok, message: 'Success' }
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { errors: @book.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      render json: { status: :ok, message: 'Book was successfully deleted.' }
    else
      render json: { errors: @book.errors.full_messages.join(", "), status: :unprocessable_entity }
    end
  end

  private

  def book_params
    params.require(:book).permit(:book_id, :author_id, :book_category_id, :publisher_id, :title, :edition_number, :copyright, :description, :price, :quantity)
  end

end
