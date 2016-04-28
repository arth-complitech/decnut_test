class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :pathway, index: true, foreign_key: true
      t.string :status 
      t.text :memo

      t.timestamps null: false
    end
  end
end
