# frozen_string_literal: true

class AddForeignKeyToFollowings< ActiveRecord::Migration[6.0]
  def up
    add_foreign_key :followings, :users, column: :follower_id
    add_foreign_key :followings, :users, column: :followed_id
  end

  def down
    remove_foreign_key :followings, :users, column: :follower_id
    remove_foreign_key :followings, :users, column: :followed_id
  end
end
