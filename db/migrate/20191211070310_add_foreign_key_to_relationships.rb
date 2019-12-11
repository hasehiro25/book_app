# frozen_string_literal: true

class AddForeignKeyToRelationships < ActiveRecord::Migration[6.0]
  def up
    add_foreign_key :relationships, :users, column: :follower_id
    add_foreign_key :relationships, :users, column: :followed_id
  end

  def down
    remove_foreign_key :relationships, :users, column: :follower_id
    remove_foreign_key :relationships, :users, column: :followed_id
  end
end
