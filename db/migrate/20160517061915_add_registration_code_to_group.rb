class AddRegistrationCodeToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :registration_code, :string
  end
end
