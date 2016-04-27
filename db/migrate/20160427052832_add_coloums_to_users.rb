class AddColoumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :title, :string
    add_column :users, :mobile_number, :string
    add_column :users, :active, :boolean , :default => true
    add_column :users, :status, :string
    add_column :users, :memo, :text
  end
end
