class Admin::DemoForumsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin
	def enter_admin_mode
		cookies[:admin_mode] = true;
		redirect_to demo_forums_path
	end
	def quit_admin_mode
		cookies[:admin_mode] = false;
		redirect_to demo_forums_path
	end
	
	private
	
	def is_admin
		if !current_user.is_admin
			flash[:alert] = "Admin Only"
			redirect_to demo_forums_path
		end
	end
end
