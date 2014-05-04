class AddForumIdToPost < ActiveRecord::Migration
  def change
	add_column :posts, :demo_forum_id, :integer
  end
end
