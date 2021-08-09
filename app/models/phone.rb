class Phone < ApplicationRecord
  belongs_to :user
  validates :phone_number,
            :length => { is: 12 },
            format: { with: /\d{3}-\d{3}-\d{4}/, message: "is not valid" }
end
