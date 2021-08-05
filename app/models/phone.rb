class Phone < ApplicationRecord
  # include SetAsPrimary
  belongs_to :user
  # self.primary_key = 'user_id'

  validates :phone_number,:allow_blank => true,
                      :presence => {:message => 'can not be blank'},
                     :numericality => true, 
                     :length => { :minimum => 10, :maximum => 13 }
  # set_as_primary :primary, owner_key: :user
end
