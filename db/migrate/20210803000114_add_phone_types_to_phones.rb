class AddPhoneTypesToPhones < ActiveRecord::Migration[6.1]
  def change
    add_column :phones, :phone_type, :string
  end
end
