# TaskTracker

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Documentation

  * Tasks:
    Tasks take a name a description and a boolean as to whether they have
    been completed or not.
    Any user can add a task to their "Assignments" assignments take a task
    a user_id and a time they have been worked on for time will be shown in
    15 minute increments so if you have worked on a taks for 30 minutes your
    entry for time would be '2'

I decided to split tasks and assignments into two different tables so that
any number of people could pick up a task to work on. Assignments are an easier
way for users to track witch tasks they are assigned to, instead of going
through all of the listed tasks to find out which ones they are assigned to.
So therefore assignments have a has many relationship with both tasks and users.
I made this decision because I think that it will at some point be easier to
handle changes to any of these structures. If tasks have to change in anyway it
should not affect any existing assignments. Also this way everyone can see any
changes right away to the tasks through their assignments. s 
