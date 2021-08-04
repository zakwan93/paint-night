class CreatePhones < ActiveRecord::Migration[6.1]
  def change
    create_table :phones do |t|
      t.string :phone_type
      t.integer :phone_number
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
