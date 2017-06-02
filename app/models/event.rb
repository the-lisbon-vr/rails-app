class Event < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :users, through: :slots
  has_attachments :photos, maximum: 2
end
