class EntriesController < ApplicationController

	before_action :set_comment, only: [:edit, :show, :destroy]

	def index
		@entry = Entry.new
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
	end

	def create
     entry = Entry.create(entry_params) # don't get artistical with the indentation here. keep things lined up
		p session[:user_id] # try not to commit debug data
		redirect_to entries_path
	end

	def edit
	end

	def update
		entry = Entry.find(params[:id])
		if entry.update_attributes entry_params # good!
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
      # OH MY EYES!  What?!
      # This is where you got clever with Entry containing all your other
      # entities, right?  Wow do you feel the hurt here?  I do.  This is
      # precisely where a "clever" design starts making you regret the design
      # decision.
      #
      # At the very least, how about a class method on Entry where you can say
      #
      # Entry.find_matches_on_type("blah") or something so that this code is
      # not housed inside a controller?
      #
      # For a "learner" app, I hope you appreciate the learning you've just
      # had: overengineered cleverness should *emerge* from un-clever designs,
      # don't be clever to start with (you're talking to #1 violator of this
      # rule).
			@found = Entry.where(Entry.arel_table[:title].matches("%#{params[:term]}%").or(Entry.arel_table[:content].matches("%#{params[:term]}%"))).order(Entry.arel_table[:updated_at])
		end
	end

	def find
	end

	private

	def entry_params
		params.require(:entry).permit(:title, :content, :genre, :user_id) #need to add current user
	end

	def set_comment
		@entry = Entry.find(params[:id])
	end

end
