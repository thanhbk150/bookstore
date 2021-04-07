class Api::SummariesController < Api::ApiController

  def index
    user_total = User.select(:user_id).count
    author_total = Author.select(:author_id).count
    book_total = Book.select(:book_id).count
    publisher_total = Publisher.select(:publisher_id).count
    render json: { user: user_total, author: author_total, book: book_total, publisher: publisher_total }
  end

  def login_user
    render json: current_user
  end
end
