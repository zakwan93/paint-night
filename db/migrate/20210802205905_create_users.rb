class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.string :title
      t.integer :age
      t.string :ethinicity
      t.string :language
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
