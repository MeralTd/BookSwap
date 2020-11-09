class WelcomeController < ApplicationController
  def index
    if current_user
      @books = Book.where(:status_type => 'Share').all
      if params[:search]
        puts params[:search]
        @books = Book.where(:status_type => 'Share').search(params[:search]).order("created_at DESC")
        puts @books
        if @books
          render action: :results
        end
      else
        @books = Book.where(:status_type => 'Share').all.order('created_at DESC')
      end
    else
      @books = Book.where(:status_type => 'Share').all
      time = Time.now
      @date = time.strftime("%Y-%m-%d")
      @time = time.strftime("%H:%M:%S")
    end
  end

  def dashboard
    @books = current_user.books

  end

  
  def wishlist
    @books = current_user.books
    @trades = Trade.where(book_id: @books.each {|book| book.id})
    @not_show_trades = Trade.where(book_id: @books.each {|book| book.id})
  end
  
end
