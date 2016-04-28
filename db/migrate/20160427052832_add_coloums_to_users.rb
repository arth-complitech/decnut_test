class AddColoumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string , null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :title, :string, null: false
    add_column :users, :mobile_number, :string, null: false
    add_column :users, :active, :boolean , :default => true
    add_column :users, :status, :string
    add_column :users, :memo, :text
  end
end
