require "populator"
namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create","db:migrate"]
  task :rebuild => ["dev:build", "db:seed"]
  desc "Create fake data"
  task :fake => :environment do
		[DemoForum, Post].each(&:delete_all)
		DemoForum.populate(10) do |forum|
			forum.name = Populator.words(1..2)
			Post.populate(30) do |post|
				post.demo_forum_id = forum.id
				post.title = Populator.words(1..3)
				post.content = Populator.words(10..20)
				post.user_id = rand(1..2)
			end
		end
  end
end

