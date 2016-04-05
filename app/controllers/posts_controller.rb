class PostsController < ApplicationController

before_action :require_user, only: [:new, :edit, :update, :destroy, :create]
before_action :set_post, only: [:show, :edit, :update, :destroy]
before_action only: [:edit, :update, :destroy] { require_owner(@post) }

	def index
		@posts = Post.all
	end

	def show	
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.user = current_user
		if @post.save
			redirect_to @post
		else
			render :new
		end
	end

	def edit
	end

	def update

		if @post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:title, :description, :phone, :email, :address, :url, :author)
	end

	def post_belongs_to_user?(post)
		post.user == current_user
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def require_owner(post)
      unless post_belongs_to_user?(post)
        flash[:error] = "ЭТО НЕ ВАШ ПОСТ, НЕ ВАШ!"
        redirect_to posts_path # halts request cycle
      end
    end 

end
