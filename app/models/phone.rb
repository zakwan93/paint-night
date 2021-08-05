class Phone < ApplicationRecord
  include SetAsPrimary
  belongs_to :user

   validates :phone_number, :presence => {:message => 'is not valid'},
                     :numericality => true,
                     :length => { :minimum => 10, :maximum => 13 }
  # set_as_primary :primary, owner_key: :user
end
