# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HtmlDemo.Repo.insert!(%HtmlDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias HtmlDemo.Repo
alias HtmlDemo.Examples.Employee

1..100
|> Enum.each(fn _ ->
  Repo.insert(%Employee{
    name: Faker.Person.name(),
    title: Faker.Person.title()
  })
end)
