class BookCommentsController < ApplicationController

  def create
   book = Book.find(params[:book_id])
  if book
   comment = current_user.book_comments.new(book_comment_params)
   comment.book = book
   comment.save
  else
    flash[:error] = "関連する本が存在しません。"
  end
   redirect_to request.referer
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end

  private
    def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
