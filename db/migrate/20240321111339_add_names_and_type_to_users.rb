# frozen_string_literal: true

class AddNamesAndTypeToUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type, :string, null: false, default: 'User'
  end

  def down
    add_column :users, :name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :type, :string, if_exists: true
  end
end
