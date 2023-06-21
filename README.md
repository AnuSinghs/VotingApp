# README

## SMS Voting Application
This is a Rails application designed to handle SMS voting data, allowing users to view and analyze campaign results.

### Approach
Our approach to building this application involved the following steps:

* Database Design: We identified the key entities in the application, which include campaigns, candidates, and votes. We created corresponding database tables and defined their relationships using ActiveRecord associations
* Controller and Routing: We implemented controllers to handle the logic and data flow for the application. We defined routes to map incoming requests to the appropriate controller actions
* Views: We designed views using HTML and ERB (Embedded Ruby) templates to present the data to the users. We created index and show pages to display the list of campaigns and the details of each campaign respectively
* Data Import: We created a command-line script that reads a log file containing voting data. The script parses each line, discards any malformed lines, and imports valid data into the application by creating campaign and vote records
* User Interface: We focused on creating a user-friendly interface for the application. The front-end allows users to easily navigate through campaigns, view candidate scores, and see the number of uncounted messages for each campaign


### Design Decisions

* Model Associations: We chose to establish associations between the Campaign, Candidate, and Vote models using ActiveRecord associations such as has_many, belongs_to, and has_many :through. This allows us to retrieve and manipulate the data efficiently.
* Pagination: To enhance the user experience and handle large datasets, we implemented pagination using the will_paginate gem. This ensures that campaign results are displayed in a manageable and organized manner.
* File Import: We decided to handle the data import process through a command-line script. This allows for flexibility in running the script independently of the web application, making it easier to import data from log files into the application's database.
* Error Handling: We incorporated error handling mechanisms to handle malformed log file lines. Any lines that do not conform to the expected format are discarded during the data import process.


### Running the Application
To run the SMS Voting Application locally:

* Make sure you have Ruby and Rails installed on your system.
* Clone this repository and navigate to the project directory.
* Install the required gems by running bundle install.
* Set up the database by running rails db:create followed by rails db:migrate.
* Place your votes.txt log file in the public directory.
* Start the Rails server with rails server.
* Open your web browser and visit http://localhost:3000/ to access the application.
* Please note that you may need to modify the database configuration in config/database.yml if necessary

### Conclusion
With the SMS Voting Application, users can easily view and analyze campaign results. The application handles the data import process from log files, provides a user-friendly interface, and leverages the power of Ruby on Rails to efficiently manage voting data.







