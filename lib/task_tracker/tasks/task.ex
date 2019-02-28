defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string
    field :name, :string
    has_many :assignments, TaskTracker.Assignments.Assignment

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :desc, :complete])
    |> validate_required([:name, :desc, :complete])
  end
end
