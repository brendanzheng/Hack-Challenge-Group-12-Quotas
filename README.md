# Hack-Challenge-Group-12-Quotas

1. App Name: Quotas

2. App Tagline (short one-liner description of your app): An app that allows you to request everyday services!

3. Link(s) to any other public GitHub repo(s) of your app. n/a

4. Some screenshots of your app (highlight important features): TODO

5. A short description of your app (its purpose and features): This app allows you to browse and request various services offered by others such as doing your laundry or cooking you a meal. Everyone is given a certain amount of "quotas" that they can spend on each service.

6. A list of how your app addresses each of the requirements:

Backend:
We chose to implement two tables: users and services. The users table stores information about the users such as their id, username, profile picture url, and number of quotas left. The services table stores information about the various services offered such as the id, name, description, image url, popularity, and cost. There is a many-to-many relationship between the two tables that allow us to easily figure all the people who have requested a given service as well as all the services a given person has requested.

Our routes are quite simple. For both tables, we have routes that allow us to get all users/services (GET), get a single user/service (GET), create a user/service (POST), update a user/service (POST), and delete a user/service (DELETE). We have an additional route that allows us to process a user's request for a service (and update their remaining quotas accordingly). 

8. Anything else you want your grader to know: Thank you!

Note: The link, screenshots, and description will be used for the Hack Challenge website where we will showcase everyone’s final projects
