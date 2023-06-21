# app/models/campaign.rb
class Campaign < ApplicationRecord
  has_many :votes
end