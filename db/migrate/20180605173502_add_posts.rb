class AddPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
