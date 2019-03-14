defmodule TaskTracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :admin, :boolean, default: false, null: false
      add :manager, :string, default: "Only God", null: true

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
