class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :country
      t.string :address_type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
