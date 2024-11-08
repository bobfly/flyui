class Dummy < ApplicationRecord
  extend Enumerize

  enumerize :status, in: [ :user, :admin, :idiot ], default: :user

  validates :name, presence: true

  def to_s
    name
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "active", "completed_at", "created_at", "id", "name", "started_at", "status", "updated_at", "date_range" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
