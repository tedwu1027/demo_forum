class AddFileToPost < ActiveRecord::Migration
  def change
	add_attachment :posts, :file
  end
end
