class VisitorController < ApplicationController

	def index 
	  @books = Book.all
	end
end
