class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :edit, :create, :update, :destroy]
	before_filter :find_forum, :only => [ :show, :new, :edit, :create]
	before_filter :find_post, :only => [ :show, :edit, :update, :destroy]
	before_action :check_current_user, :only => [:edit, :update, :destroy]
	def show
	end
	def index
		@forum = DemoForum.find(params[:demo_forum_id])
		@posts = @forum.posts.page(params[:page]).per(20)
	end
	
	def new
		@post = Post.new
		#@post.user = current_user
		#@post.demo_forum_id = params[:demo_forum_id]
	end
	
	def create
		@post = Post.new(post_params)
		@post.user = current_user
		@post.demo_forum_id = params[:demo_forum_id]
		
		if @post.save
			redirect_to demo_forum_posts_path
		else
			render :new
		end
	end
	
	def edit
		
		#@post = @forum.posts.find(params[:id])
	end
	
	def update
		if @post.update_attributes(post_params)		
			redirect_to demo_forum_posts_path
		else
			render :action => :edit
		end
	end
	
	def destroy
		@post.destroy
		redirect_to demo_forum_posts_path
	end
	
	private
	def check_current_user
		if current_user != @post.user
			flash['alert'] = "you are not allowed to perform this operation"
			redirect_to demo_forum_posts_path
		end
	end
	
	def find_forum
		@forum = DemoForum.find(params[:demo_forum_id])
	end
	def find_post
		@post = Post.find(params[:id])
	end
	
	def post_params
		params.require(:post).permit(:title, :content, :file)
	end
end
