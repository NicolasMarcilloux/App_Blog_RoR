class PostsController < ApplicationController
  before_action :load_user
	before_action :load_post, only: [:show, :edit, :update, :destroy]

	def index
    if @user
		    @posts = @user.posts
    else
        @posts = Post.all.order('title ASC')
    end
	end

	def show

	end

	def load_post
		@post = Post.find params[:id]
	end

	def load_user
    if params[:user_id].present?
  		@user = User.find params[:user_id]
    end
	end

	def edit

	end

	def update
		if @post.update_attributes post_params
			redirect_to [@user, @post]
		else
			render 'edit'
		end
	end

	def new
		@post = Post.new
	end

	def destroy
		@post.destroy
		if @post.save
			redirect_to @user
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user = @user
		if @post.save
			redirect_to [@user, @post]
		else
			render 'new'
		end
	end

	private

    def post_params
    # Définit les attributs autorisés et les prend en compte
      params.require(:post).permit(
		:title,
		:thumbnail,
		:author_id
		)
    end
end
