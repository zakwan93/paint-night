class Phone < ApplicationRecord
  # include SetAsPrimary
  belongs_to :user
  # self.primary_key = 'user_id'

  # validates :phone_number,:allow_blank => true,
  #                     :presence => {:message => 'can not be blank'},
  #                    :numericality => true, 
  #                    :length => { :minimum => 10, :maximum => 13 }
  validates :phone_number,
            :length => { is: 12 },
            format: { with: /\d{3}-\d{3}-\d{4}/, message: "is not valid" }

  # set_as_primary :primary, owner_key: :user
  
end
