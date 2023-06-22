# lib/tasks/import_log_data.rake
task import_log_data: :environment do
  file_path = Rails.root.join('public', 'votes.txt')

  File.readlines(file_path).each do |line|
    import_line(line)
  end
end

def import_line(line)
  return unless line.start_with?('VOTE')

  # Handle invalid byte sequence gracefully
  line = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')

  campaign_name = line[/Campaign:(\S+)/, 1]
  choice = line[/Choice:(\S+)/, 1]
  validity = line[/Validity:(\S+)/, 1]
  conn = line[/CONN:(\S+)/, 1]
  msisdn = line[/MSISDN:(\S+)/, 1]
  guid = line[/GUID:(\S+)/, 1]

  campaign = Campaign.find_or_create_by(name: campaign_name)
  campaign.votes.create(choice: choice, validity: validity, conn: conn, msisdn: msisdn, guid: guid)
end
