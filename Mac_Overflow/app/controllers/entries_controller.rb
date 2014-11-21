class EntriesController < ActionController::Base

	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
	end

end
