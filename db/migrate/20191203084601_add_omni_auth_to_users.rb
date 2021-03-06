# frozen_string_literal: true

class AddOmniAuthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
  add_index :users, [:uid, :provider], unique: true
end
