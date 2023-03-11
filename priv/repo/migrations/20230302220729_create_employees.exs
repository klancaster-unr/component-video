defmodule HtmlDemo.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string
      add :title, :string

      timestamps()
    end
  end
end
