class Phone < ApplicationRecord
  # include SetAsPrimary

  belongs_to :user
  # set_as_primary owner_key: :user
end
