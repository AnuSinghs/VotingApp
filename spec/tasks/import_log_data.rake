# spec/tasks/import_log_data.rake
require 'rails_helper'
require 'rake'

RSpec.describe 'import_log_data' do
  before do
    Rails.application.load_tasks
    Rake::Task['import_log_data'].reenable
  end

  it 'imports votes from the log file' do
    allow(File).to receive(:readlines).and_return(['VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:Tupele'])

    expect { Rake::Task['import_log_data'].invoke }.to change { Vote.count }.by(1)
  end

  it 'skips lines that are not well-formed' do
    allow(File).to receive(:readlines).and_return(['INVALID LINE'])

    expect { Rake::Task['import_log_data'].invoke }.not_to change { Vote.count }
  end
end

