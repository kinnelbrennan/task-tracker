# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker.Repo.insert!(%TaskTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TaskTracker.Repo
alias TaskTracker.Users.User

Repo.insert!(%User{email: "harry@hogwarts.edu", admin: false,
  manager: "minerva@hogwarts.edu"})
Repo.insert!(%User{email: "albus@hogwarts.edu", admin: true})
Repo.insert!(%User{email: "hermione@hogwarts.edu", admin: false,
  manager: "minerva@hogwarts.edu"})
Repo.insert!(%User{email: "minerva@hogwarts.edu", admin: true,
  manager: "albus@hogwarts.edu"})
Repo.insert!(%User{email: "ron@hogwarts.edu", admin: false,
  manager: "minerva@hogwarts.edu"})
Repo.insert!(%User{email: "severus@hogwarts.edu", admin: true,
  manager: "albus@hogwarts.edu"})
