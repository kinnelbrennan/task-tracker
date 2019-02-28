defmodule TaskTracker.Repo.Migrations.CreateT do
  use Ecto.Migration

  def change do
    create table(:t) do
      add :time, :integer
      add :user_id, references(:users, on_delete: :delete_all)
      add :task_id, references(:tasks, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:t, [:user_id])
    create index(:t, [:task_id])
  end
end
