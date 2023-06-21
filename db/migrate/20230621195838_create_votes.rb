class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :campaign_id
      t.string :choice
      t.string :validity
      t.string :conn
      t.string :msisdn
      t.string :guid
      t.string :shortcode

      t.timestamps
    end
  end
end
