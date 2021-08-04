class AddPrimaryColumnToPhones < ActiveRecord::Migration[6.1]
  def change
    add_column :phones, :primary, :boolean, default: false, null: false
    # NOTE: Please uncomment following line if you want only one 'true' (constraint) in the table.
    # add_index :phones, :primary, unique: true, where: "(phones.primary IS TRUE)"
  end
end

