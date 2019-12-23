# frozen_string_literal: true

class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :follower, index: true, null: false
      t.references :followed, index: true, null: false
      t.timestamps
    end
    add_index :followings, [:follower_id, :followed_id], unique: true
  end
end
