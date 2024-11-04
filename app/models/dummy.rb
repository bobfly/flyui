class Dummy < ApplicationRecord
  extend Enumerize

  enumerize :status, in: [ :user, :admin, :idiot ], default: :user

  validates :name, presence: true
end
