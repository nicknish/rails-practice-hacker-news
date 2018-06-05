class AddUserToPosts < ActiveRecord::Migration[5.1]
  def up
    add_reference :posts, :user, foreign_key: true

    Post.find_each do |post|
      post.update(user_id: 1)
    end
  end

  def down
    remove_reference :posts, :user
  end
end
