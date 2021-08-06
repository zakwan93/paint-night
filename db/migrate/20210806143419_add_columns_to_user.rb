class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :primary_phone, :string
    add_column :users, :primary_phone_type, :string
    add_column :users, :primary_address_line_1, :string
    add_column :users, :primary_address_line_2, :string
    add_column :users, :primary_city, :string
    add_column :users, :primary_state, :string
    add_column :users, :primary_zip, :string
    add_column :users, :primary_county, :string
    add_column :users, :primary_country, :string
    add_column :users, :primary_address_type, :string
  end
end
