class DemoForumsController < ApplicationController
	def index
		#@forums = DemoForum.all
		@forums = DemoForum.page(params[:page]).per(20)
	end
	def show
		redirect_to demo_forum_posts_path(params[:id])
	end
end
