# Module One Final Project

## 🏀 2k19 Dream Team! 🏀

For our final project, we built a Command Line database application.

Our Command Line application utilizes the CRUD (Create, Read, Update, Destroy) principles.

In the application there are three models, in a many-to-many relationship, with one join model.

Before we started building the application we sketched out all of the relationships between our models, built the tables and created user stories.


### Models

(insert pic of model)


### User Stories

* As a user, I want to be able to create a Dream Team of current NBA players
* As a user, I want to be able to view my newly created Dream Team
* As a user, I should be able to update/trade a playersd
* As a user, I want to be able to delete the Dream Team I create


## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project.(2 minutes max)
6. Prepare a presentation to follow your video.(3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address, if anything, what you would change or add to what you have today?
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```
