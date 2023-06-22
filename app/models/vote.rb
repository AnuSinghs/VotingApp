# app/models/vote.rb
class Vote < ApplicationRecord
  belongs_to :campaign

  validates_presence_of :choice, :validity, :campaign_id
end
