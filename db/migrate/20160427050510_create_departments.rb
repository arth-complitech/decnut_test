class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :status
      t.text :memo
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
