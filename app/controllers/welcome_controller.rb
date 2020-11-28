class WelcomeController < ApplicationController
  def index
    if current_user
      @books = Book.where(:status_type => 'share').all
      if params[:search]
        puts params[:search]
        @books = Book.where(:status_type => 'share').search(params[:search]).order("created_at DESC")
        puts @books
        if @books
          render action: :results
        end
      else
        @books = Book.where(:status_type => 'share').all.order('created_at DESC')
      end
    else
      @books = Book.where(:status_type => 'share').all
      time = Time.now
      @date = time.strftime("%Y-%m-%d")
      @time = time.strftime("%H:%M:%S")
    end
  end

  def dashboard
    @books = current_user.books

  end
  
end
