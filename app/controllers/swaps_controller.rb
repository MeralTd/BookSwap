class SwapsController < ApplicationController
  def new
  end
  
  def create
      book = Book.where(id: params[:book_id]).first
      
      if params[:other_book].nil?
          flash[:alert] = "You have to add a book in order to request a swap!"
          redirect_to root_path and return
      end
      if current_user
          user_id = current_user.id
          other_id = book.user_id
          book_id = book.id
          other_book_id = params[:other_book]
          if Swap.where(book_id: book_id, other_book_id: other_book_id, status:"pending").count != 0 
              flash[:notice] = "You already requested a swap for this books combination, wait for the other user to answer! "
              redirect_to root_path
          elsif Swap.where(book_id: other_book_id, other_book_id: book_id, status:"pending").count != 0 
              flash[:notice] = "The swap you just requested has been already proposed to you by the other user, check your notifications! "
              redirect_to root_path
          elsif Swap.where(book_id: book_id, other_book_id: other_book_id, status:"declined").count != 0 
              flash[:notice] = "The swap you just requested has been already refused by the other user, try with another book! "
              redirect_to root_path
          elsif (Swap.where(book_id: book_id, other_book_id: other_book_id, status:"accepted").count != 0 or Swap.where(book_id: other_book_id, other_book_id: book_id, status:"accepted").count != 0)
              flash[:notice] = "The swap between those two books have already been accepted, try to contact the other user! "
              redirect_to root_path
          else
          
              @swap = Swap.new(user_id: user_id, other_id: other_id,book_id: book_id,other_book_id: other_book_id, status:"pending" )
              
              if @swap.save
                  flash[:success] = "You have sent a Book swap request "
                  redirect_to root_path
              end
          end
      end
  end
  
  def accept
      swap = Swap.find(params[:id])
      my_book = Book.find(swap.other_book_id)
      other_book = Book.find(swap.book_id)
      if swap 
          if swap.update(status: "accepted")
              my_book.update(user_id: current_user.id)
              other_book.update(user_id: swap.user_id)
              
              flash[:success] = "You have just accepted a Book swap request, congratulations!"
              redirect_to root_path
          end
      end
  end
  
  def decline
      swap = Swap.find(params[:id])
      if swap 
          if swap.update(status: "declined")
              flash[:success] = "You have refused a Book swap request"
              redirect_to root_path
          end
      end
  end
  
  private
  def swap_params
      params.require(:book).permit(:book_id, :other_book_id)
  end
end
