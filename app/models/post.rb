class Post < ActiveRecord::Base
	Paperclip.options[:command_path] = "M:/Program Files/ImageMagick-6.8.9-Q16"
	validates_presence_of :title, :content
	belongs_to :demo_forum
	belongs_to :user
	
	default_scope { order('created_at DESC') }
	
	has_attached_file :file, styles: {thumbnail: "60x60#"}
	validates_attachment :file, content_type: { content_type: ["image/png", "image/jpeg"] }
end
