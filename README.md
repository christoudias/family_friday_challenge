<h1>Family Friday Challenge</h1>

This is a solution to the challenge presented by Apartmentlist which is listed here: https://gist.github.com/sarahwiemero/358018196ef6b7e5fec68e103bb25a08
To run this application:
1) Download the repo and unzip it.
2) Browse to the directory where you unzipped it and run "bundle install"
3) Start the server by running "rails server"
4) Take your browser to http://localhost:3000


<h3>Thoughts and Approach</h3>
 The app starts with the import page where a JSON is ingested. This page will:
  - Lookup the restaurant and create it if it does not exist.
  - Add a record to the Correspondence Model for each user listed
  - The correspondence will create its own token as a unique identifier


  You can then view the emails by goin to the "View Emails" link. This will list all of the emails which have been created. You can view the emails by clicking on the "View Email" link next to each record. This will show the email which will be sent to the user. This includes special formatting to comply with HTML clients and to be easily viewed on mobile devices (where over 50% of emails are viewed today).

  Emails have a link to each star rating that includes the token and the rating which will then be logged on the email landing page.

  Restaurants can be viewed under the "Restaurants" link in the nav along with their cumulative rating. It shows a rating of 0 if there haven't been any votes on it yet.

<h3>Next Steps</h3>

   This time took a little longer than I expected so I need to stop short of where I wanted to be. But here is where I would take it next:
   1) Add pagination onto the list of restaurants and emails
   2) Improve the overall UI
   3) Add authentication
   4) Enhance reporting so that the rating of a restaurant can be seperated by day it was visited. E.g. emails sent on Friday for the "finance" team would have one rating. Emails sent on Monday with the "engineering" team would have another rating.
   5) Add rspec tests
   6) Improve the UI of the email and landing page.
   7) Add a "sent_at" column to each correspondence and write the script that actually sends the emails to the users and logs the email as sent.