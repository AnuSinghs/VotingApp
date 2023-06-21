# app/controllers/campaigns_controller.rb
class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @campaign = Campaign.find(params[:id])
    @candidates = @campaign.votes.group(:choice).select(:choice, 'COUNT(*) as vote_count').order('vote_count DESC')
    @uncounted_messages_count = @campaign.votes.where.not(validity: 'during').count

    @candidates_with_scores = @candidates.map { |candidate| { candidate: candidate.choice, score: candidate.vote_count } }

    Rails.logger.info("Candidates with scores: #{@candidates_with_scores}")
  end

  def import_votes
    file_path = Rails.root.join('public', 'votes.txt')
    import_log_data(file_path)
    redirect_to campaigns_path, notice: 'Votes imported successfully.'
  end

  def votes
    @campaign = Campaign.find(params[:id])
    @candidates_with_scores = @campaign.votes
                                       .group(:choice)
                                       .select(:choice, 'COUNT(*) as score')
                                       .order('score DESC, choice ASC')
                                       .map { |v| { candidate: v.choice, score: v.score } }
    @uncounted_messages = @campaign.votes.where.not(validity: 'during').count
  end

  private

  def import_log_data(file_path)
    File.foreach(file_path) do |line|
      vote_attributes = parse_vote_line(line)
      next if vote_attributes.nil?

      campaign_name = vote_attributes[:campaign]
      choice = vote_attributes[:choice]
      validity = vote_attributes[:validity]
      msisdn = vote_attributes[:msisdn]
      guid = vote_attributes[:guid]
      shortcode = vote_attributes[:shortcode]

      campaign = Campaign.find_or_create_by(name: campaign_name)
      campaign.votes.create(choice: choice, validity: validity, msisdn: msisdn, guid: guid, shortcode: shortcode)
    end
  end

  def parse_vote_line(line)
    match_data = line.match(/VOTE (\d+) Campaign:(\S+) Validity:(\S+) Choice:(\S+) CONN:(\S+) MSISDN:(\S+) GUID:(\S+) Shortcode:(\S+)/)
    return nil unless match_data

    {
      campaign: match_data[2],
      validity: match_data[3],
      choice: match_data[4],
      msisdn: match_data[6],
      guid: match_data[7],
      shortcode: match_data[8]
    }
  end
end

