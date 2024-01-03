class BookCommentsController < ApplicationController

  def create
  book = Book.find(params[:book_id])
  book_comment = current_user.book_comments.new(book_id: book.id)
  book_comment.book.id = book.id
  book_comment.save
  redirect_to book_path(params[:book_id])
  end

  def destroy
  book_comment = current_user.book_comments.find(params[:id])
  book_comment.destroy
    redirect_to book_path(params[:book_id])
  end

    def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
