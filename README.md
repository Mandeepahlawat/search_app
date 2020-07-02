# README

## Instructions:

I've added a few users by default with website urls but I haven't added any friends so you can add friends from the UI and play around with it.

#### Steps to run app:

* Run rake db:setup
* Run rails s

#### Features:

* A user can be created using their name and a personal website address.
* When a user is created, all the heading (h1-h3) values are pulled in from the website to that users profile.
* The website url is shortened.
* If user is edited then website and headings are updated.
* Ability to create bi-directional friendships from users detail page.
* A users listing page consisting of name, short url, number of friends and links to edit/view details.
* A users details page consiting of user details, list of headings for that user, link to user friends and link to all the remaining users to befriend with them.
* Search functionality on users detail page where if matching heading exists then will list a path from current user to the targeted user. If existing user also contains some heading with text then his name would simply appear in search result without any path. If there are multiple users with matching heading then we'll get a multiple search results.
* Added some sample users in seed to play around with


#### Scalability:

* Ability to have more than 1 website for a user in the future.
* Ability to store additional friendship data in the model.
* Using bulk insert method to add all headings for a website.
* Using counter_cache to store friends_count in the user.
* On listing page using include method to fetch related associations data in a single query.


#### Future work:

* Add test cases for search service
* Add test cases for scraper service
* Search can be made faster by using some 3rd party gem or by storing users data in Elasticsearch or some other service.
* Include APIs.
* Improve UI of the app. I'm using erb templates as i think it's quicker but we can make front-end in react which can consume apis from backend
