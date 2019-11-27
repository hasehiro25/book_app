class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :postcode, :integer, default: ""
    add_column :users, :address, :string, default: ""
    add_column :users, :profile, :text, default: ""
  end
end
