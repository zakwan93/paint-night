class RemovePhoneTypeFromPhones < ActiveRecord::Migration[6.1]
  def change
    remove_column :phones, :phone_type, :integer
  end
end
