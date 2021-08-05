class Address < ApplicationRecord
  belongs_to :user
  # validates :zip, :presence => {:message => 'is not valid'},
  #                    :numericality => true,
  #                    :length => { :minimum => 5, :maximum => 5 }
  validates_length_of :zip, :in => 5..6, :allow_blank => true
  validates :zip, :numericality => true
end
