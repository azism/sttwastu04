class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :summary
      t.string :work_as
      t.string :work_in
      t.text :experiences
      t.text :interests
      t.text :skills
      t.string :languages
      t.text :organizations
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
