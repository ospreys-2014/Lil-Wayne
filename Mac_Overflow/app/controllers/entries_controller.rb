class EntriesController < ApplicationController

	before_action :set_comment, only: [:edit, :show, :destroy]

	def index
		@entry = Entry.new
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
		@comment = Comment.new
		@comments = @entry.comments
	end

	def create
		current_user.entries << Entry.create(entry_params)
		redirect_to entries_path
	end

	def edit
	end

	def update
		entry = Entry.find(params[:id])
		if entry.update_attributes entry_params
			redirect_to entries_path
		else
			redirect_to :back
		end
	end

	def destroy
		@entry.destroy
		redirect_to entries_path
	end

	def search
		if params[:term] != nil
			@found = Entry.where(Entry.arel_table[:title].matches("%#{params[:term]}%").or(Entry.arel_table[:content].matches("%#{params[:term]}%"))).order(Entry.arel_table[:updated_at])
		end
	end

	def find
	end

	private

	def entry_params
		params.require(:entry).permit(:title, :content)
	end

	def set_comment
		@entry = Entry.find(params[:id])
	end

end
