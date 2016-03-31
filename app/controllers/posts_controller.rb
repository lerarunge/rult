class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		if @post = Post.create(post_params)
			redirect_to @post
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		if @post = Post.update(post_params)
			redirect_to @post
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

end
