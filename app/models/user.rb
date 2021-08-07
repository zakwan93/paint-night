class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, format: Devise.email_regexp
   # validates :primary_phone,
   #                    :presence => {:message => 'can not be blank'},
   #                   # :numericality => true, 
   #                   :length => { :minimum => 12, :maximum => 15 }
  validates :primary_phone,
            :length => { is: 12 },
              format: { with: /\d{3}-\d{3}-\d{4}/, message: "is not valid" }

  validates_presence_of :first_name,
                        :last_name,
                        :dob,
                        :gender,
                        :primary_phone_type,
                        :primary_address_line_1, 
                        :primary_city, 
                        :primary_state, 
                        :primary_country, 
                        :primary_address_type
  validates_format_of :first_name, :last_name, :with => /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :middle_name, length: { is: 1 }, allow_blank: true
  validates :primary_state, length: { is: 2 }
  validates :primary_zip, :numericality => true
  validates_format_of :primary_zip,
                    :with => %r{\d{5}(-\d{4})?},
                    :message => "should be 12345 or 12345-1234"
  
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

  ransacker :full_name do |parent|
      Arel::Nodes::InfixOperation.new('||',
                                      Arel::Nodes::InfixOperation.new('||', parent.table[:first_name], ' '),
                                      parent.table[:last_name])
    end

end
