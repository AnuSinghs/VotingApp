require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe CampaignsController, type: :controller do
  before do
    FactoryBot.reload
  end
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns all campaigns as @campaigns' do
      campaign1 = FactoryBot.create(:campaign, name: 'Campaign 1')
      campaign2 = FactoryBot.create(:campaign, name: 'Campaign 2')

      # Create the existing campaigns after the expected campaigns
      FactoryBot.create_list(:campaign, 3)

      get :index

      # Print out the actual value of @campaigns for inspection
      p assigns(:campaigns)

      expect(assigns(:campaigns)).to include(campaign1, campaign2)
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      campaign = FactoryBot.create(:campaign, name: 'My Campaign')

      get :show, params: { id: campaign.id }
      expect(response).to render_template(:show)
    end

    it 'assigns the requested campaign as @campaign' do
      campaign = FactoryBot.create(:campaign, name: 'My Campaign')

      get :show, params: { id: campaign.id }
      expect(assigns(:campaign)).to eq(campaign)
    end
  end

  describe 'GET votes' do
    let(:campaign) { FactoryBot.create(:campaign, name: 'ssss_uk_01B') }

    before do
      FactoryBot.create(:vote, campaign: campaign, choice: 'Antony')
      FactoryBot.create(:vote, campaign: campaign, choice: 'Leon')
      FactoryBot.create(:vote, campaign: campaign, choice: 'Tupele')
      FactoryBot.create(:vote, campaign: campaign, choice: 'Tupele')
    end

    it 'renders the votes template' do
      get :votes, params: { id: campaign.id }
      expect(response).to render_template(:votes)
    end

    it 'assigns the requested campaign as @campaign' do
      get :votes, params: { id: campaign.id }
      expect(assigns(:campaign)).to eq(campaign)
    end

    it 'assigns the candidates with their scores' do
      get :votes, params: { id: campaign.id }
      expect(assigns(:candidates_with_scores)).to eq([
          { candidate: 'Tupele', score: 2 },
          { candidate: 'Antony', score: 1 },
          { candidate: 'Leon', score: 1 },
      ])
    end

    it 'assigns the number of uncounted messages' do
      get :votes, params: { id: campaign.id }
      expect(assigns(:uncounted_messages)).to eq(0)
    end
  end
end
