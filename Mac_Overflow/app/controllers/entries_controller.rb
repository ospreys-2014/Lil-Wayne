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

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		entry = Entry.find(params[:id])
		if entry.update_attributes entry_params
			redirect_to entries_path
		else
			redirect_to :back
		end
	end

	private
	
	def entry_params
		params.require(:entry).permit(:title, :content)
	end

end
