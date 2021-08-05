class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, format: Devise.email_regexp
  validates_presence_of :first_name,:last_name,:dob,:gender

  belongs_to :role, optional: true
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones,
                                 allow_destroy: true
                                #  reject_if: lambda { |attrs| attrs['phone_number'].blank?  } 
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses,
                                 allow_destroy: true

  before_save :assign_role
  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end
  def regular?
    role.name == 'Regular'
  end

end
