# frozen_string_literal: true

class AddUserToBook < ActiveRecord::Migration[6.0]
  def up
    add_reference :books, :user, foreign_key: true
    change_column :books, :user_id, :integer, null: false
  end

  def down
    remove_column :books, :user_id
  end
end
