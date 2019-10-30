class League < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :league_participants
end
