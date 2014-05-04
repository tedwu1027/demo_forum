class CreateDemoForums < ActiveRecord::Migration
  def change
    create_table :demo_forums do |t|
      t.string :name

      t.timestamps
    end
  end
end
