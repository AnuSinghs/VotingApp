# README

## SMS Voting Application
This is a Rails application designed to handle SMS voting data, allowing users to view and analyze campaign results.

### Approach
Approach to building this application involved the following steps:

* Database Design: identified the key entities in the application, which include campaigns, candidates, and votes also created corresponding database tables and defined their relationships using ActiveRecord associations
* Controller and Routing: implemented controllers to handle the logic and data flow for the application and defined routes to map incoming requests to the appropriate controller actions
* Views: designed views using HTML and ERB (Embedded Ruby) templates to present the data to the users also created index and show pages to display the list of campaigns and the details of each campaign respectively
* Data Import: created a command-line script that reads a log file containing voting data. The script parses each line, discards any malformed lines, and imports valid data into the application by creating campaign and vote records
* User Interface: focused on creating a user-friendly interface for the application. The front-end allows users to easily navigate through campaigns, view candidate scores, and see the number of uncounted messages for each campaign

### Files added
#### Gemfile
* Gemfile

#### Schema
* db/schema.rb

#### Models
* app/models/campaign.rb
* app/models/vote.rb

#### Views
* app/views/campaigns/index.html.erb
* app/views/campaigns/show.html.erb
* app/views/campaigns/votes.html.erb

#### Controllers
* app/controllers/campaigns_controller.rb

#### Tasks
* lib/tasks/import_log_data.rake

#### Routes
* config/routes.rb

#### Public
* public/votes.txt

#### FactoryBot
* spec/factories/campaigns.rb
* spec/factories/votes.rb



### Design Decisions

* Model Associations: chose to establish associations between the Campaign, Candidate, and Vote models using ActiveRecord associations such as has_many, belongs_to, and has_many :through. This allows us to retrieve and manipulate the data efficiently.
* Pagination: To enhance the user experience and handle large datasets, implemented pagination using the will_paginate gem. This ensures that campaign results are displayed in a manageable and organized manner.
* File Import: decided to handle the data import process through a command-line script. This allows for flexibility in running the script independently of the web application, making it easier to import data from log files into the application's database.
* Error Handling: incorporated error handling mechanisms to handle malformed log file lines. Any lines that do not conform to the expected format are discarded during the data import process.


### Running the Application
To run the SMS Voting Application locally:

* Make sure you have Ruby and Rails installed on your system.
* Clone this repository and navigate to the project directory.
* Install the required gems by running bundle install.
* Set up the database by running rails db:create followed by rails db:migrate.
* Place your votes.txt log file in the public directory.
* Start the Rails server with rails server.
* Open your web browser and visit http://localhost:3000 to access the application.
* In a separate terminal or command prompt, navigate to your Rails application directory Execute the task by running the command "rails import_log_data", This will read the contents of the votes.txt file located in the public directory and import the votes into the database.
* Note: Make sure the votes.txt file exists in the public directory before executing the task.
* After executing the task, you should see the imported votes reflected in your application's database.
* Please note that you may need to modify the database configuration in config/database.yml if necessary

### Conclusion
With the SMS Voting Application, users can easily view and analyze campaign results. The application handles the data import process from log files, provides a user-friendly interface, and leverages the power of Ruby on Rails to efficiently manage voting data.
