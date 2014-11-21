class EntriesController < ApplicationController

	def index
		@entry = Entry.new
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def create
		Entry.create(entry_params)
		redirect_to entries_path
	end

	private
	
	def entry_params
		params.require(:entry).permit(:title, :content)
	end

end
