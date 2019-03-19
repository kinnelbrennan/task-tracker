defmodule TaskTracker.Repo.Migrations.CreateTimes do
  use Ecto.Migration

  def change do
    create table(:times) do
      add :time_in, :naive_datetime
      add :time_out, :naive_datetime
      add :assignment_id, references(:t, on_delete: :delete_all)

      timestamps()
    end

    create index(:times, [:assignment_id])
  end
end
