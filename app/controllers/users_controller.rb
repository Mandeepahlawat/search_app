class UsersController < ApplicationController
	before_action :find_user, only: [:show, :update, :edit, :add_friend]   

  def index
  	@users = User.all.includes(:website)
  end

  def show
  	excluded_ids = @user.friend_ids << @user.id
  	@users = User.where.not(id: excluded_ids)
  	@search_results = get_search_result
  end

  def new
  	@user = User.new
  	@user.build_website
  end

  def create
  	@user = User.new user_params
  	if @user.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def update
  	if @user.update user_params
  		redirect_to users_path
  	else
  		render 'edit'
  	end
  end

  def edit
  end

  def add_friend
  	friend = User.find params[:friend_id]
  	@user.friends << friend
  	redirect_to @user
  end

  private

  	def find_user
  		@user = User.find params[:id]
  	end

	  def user_params
	    params.require(:user).permit(:name, website_attributes: [:id, :url])
	  end

	  def get_search_result
	  	seach_results = []
	  	if params[:search_topic]
	  		targeted_user_ids = Heading.get_user_ids(params[:search_topic])
	  		targeted_user_ids.each do |targeted_id|
	  			if targeted_id != @user.id
		  			search = Search.new @user.id, targeted_id
		  			result = search.find 
		  			seach_results << result if result
		  		else
		  			seach_results << @user.name
		  		end
	  		end
	  	end
	  	seach_results
	  end
end
