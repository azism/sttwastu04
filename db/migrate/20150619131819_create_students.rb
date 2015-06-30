class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :nim
      t.string :name
      t.boolean :sex
      t.string :address

      t.timestamps null: false
    end
  end
end
