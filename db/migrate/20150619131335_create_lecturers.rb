class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.column :nid, 'integer(10) unsigned zerofill'
      t.string :name
      t.boolean :sex
      t.string :address

      t.timestamps null: false
    end
  end
end
