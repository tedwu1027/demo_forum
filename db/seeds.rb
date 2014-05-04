# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(:email => "admin@demo.com", :password => "11111111", :password_confirmation => "11111111")
admin.is_admin = true 
admin.confirmed_at = Time.now
admin.save!

normal_user = User.new(:email => "user@demo.com", :password => "11111111", :password_confirmation => "11111111")
normal_user.confirmed_at = Time.now
normal_user.save! 

forum = DemoForum.create!(:name => "System Announcement")
post = forum.posts.build(:title => "First Post", :content => "This is a demo post") 
post.user_id = admin.id 
post.save!