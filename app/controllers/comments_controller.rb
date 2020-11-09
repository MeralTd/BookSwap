class CommentsController < ApplicationController
    def index
      @book = Book.find(params[:book_id])
      @comments = @book.comments.all
    end

    def new
    end
    
    def create
      @book = Book.find(params[:book_id])
      @comment = @book.comments.new(comment_params)
      @comment.user_id = current_user.id
      @comment.status = "unapproved"

      if @comment.save
        redirect_to book_path(@book), notice: "Your comment was created and is awaiting moderation. Once approved it will appear on this page momentarily."
      else
        render :new
      end
    end
  
    def approve
      @book = Book.find(params[:book_id])
      @book.comments.where(id: params[:comment_ids]).update_all(status: "approved")
      redirect_to book_comments_path
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:title, :content, :book_id, :status, :user_id)
    end
end
