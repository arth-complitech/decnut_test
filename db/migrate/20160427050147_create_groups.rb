class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name , null: false
      t.boolean :active, :default => true
      t.string :status
      t.text :memo

      t.timestamps null: false
    end
  end
end
