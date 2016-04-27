class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :active
      t.string :status
      t.text :memo

      t.timestamps null: false
    end
  end
end
