class BooksController < ApplicationController

	def new
    	@book = Book.new
    end

	def create
		@book = Book.new(book_params)
		if Book.find_by(title: params[:book][:title])
			redirect_to new_book_path, notice: 'The book already exists. Please create a new one...'	
		elsif @book.valid?
			@book.save
			redirect_to books_path, notice: 'The book was successfully created.'
		else
			render :new
		end
	end

	private

	def book_params
		params.require(:book).permit(:author, :title)
	end

end
