FactoryBot.define do
  factory :vote do
    association :campaign
    choice { 'Candidate A' }
    validity { 'during' }
    conn { 'MIG01TU' }
    msisdn { '00777778359999' }
    guid { 'E6109CA1-7756-45DC-8EE7-677CA7C3D7F3' }
    shortcode { '63334' }
  end
end
