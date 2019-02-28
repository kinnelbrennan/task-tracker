defmodule TaskTracker.Assignments.Assignment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "t" do
    field :time, :integer
    belongs_to :user, TaskTracker.Users.User
    belongs_to :task, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(assignment, attrs) do
    assignment
    |> cast(attrs, [:time, :user_id, :task_id])
    |> validate_required([:time, :user_id, :task_id])
  end
end
