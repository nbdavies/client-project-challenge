### Synopsis
This will be a Pokemon themed wiki framework. Visitors will be greeted with a list of recent articles, they will be able to view articles, and they will be able to search for articles. Logged in users will be able to write new articles and edit existing ones, including adding/removing categories. Admins will further be able to delete articles and promote other users to become admins.

### Getting Started
Clone the git repository.

### Dependencies
Rails.

### Summary

Use the "DBC Rails"-preferred stack:

- Practice TDD using RSpec with `factory_girl` and `capybara`
- [Remove `turbolinks`][die-turbolinks] and `coffee-rails`

Remember, to create a new Rails application with certain features enabled / disabled, you can use [command-line switches][cls].  A good start would be `rails --help`.

### Strategy

Before you dive to deeply into the code, be clear with your team on three things:

1. Decide on your MVP
2. Break your MVP down into deliverable features

### Testing

Your app must be fully tested.  If you want to stretch yourself by TDDing your way, go for it, but timebox yourself. The goal of this is to actually build a functional and well tested app.

Additionally, since testing is such a heavy focus for this application, you should integrate [Continuous Integration][CI].  Two popular providers of CI services are [TravisCI][] and [CircleCI][].

As a bonus feature, try integrating the callback hooks between CI and [Trello][] and [Slack][] to post your CI status directly into your cards and chat..

### Pro Developer Technologies

* Track your work and user stories and their progress by means of [Trello][], [Pivotal Tracker][] or a physical card wall.
* Add continuous integration (CI) to your repo.
* Keep your team communication up and add a chat application.  Many teams, especially those that work remotely, find it helpful to use a chat environment like Slack.  Integrate this with GitHub and CI and hygeinic git behavior, you can work as well separated by miles as you might while standing in the same room together.

### Checkpoints

* Your team should produce a repo inside of your cohort's organization in GitHub
* Your first commit should be a `README.md` containing:
 * Your team name
 * Your team members' names
 * The user stories that define your MVP
* You will be demoing your MVP
 * Show us your app doing the essential work of your app
 * Show us your tests
 * Show us `git log --graph`, this should be clean
* You will be demoing your final project


[die-turbolinks]: http://blog.steveklabnik.com/posts/2013-06-25-removing-turbolinks-from-rails-4
[CI]: http://en.wikipedia.org/wiki/Continuous_integration
[TravisCI]: https://travis-ci.org/recent
[CircleCI]: https://circleci.com/
[Pivotal Tracker]: https://pivotaltracker.com
[Trello]: https://trello.com/
[Slack]: https://slack.com/
[cls]: http://en.wikipedia.org/wiki/Command-line_interface
