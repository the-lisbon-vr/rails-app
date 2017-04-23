class Event < ApplicationRecord
  has_many :slots
  has_many :users, through: :slots
end
