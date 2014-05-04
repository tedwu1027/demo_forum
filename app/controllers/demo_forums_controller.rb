class DemoForumsController < ApplicationController
	def index
		@forums = DemoForum.all
	end
	def show
		redirect_to demo_forum_posts_path(params[:id])
	end
end
