defmodule TaskTracker.Times.Time do
  use Ecto.Schema
  import Ecto.Changeset


  schema "times" do
    field :time_in, :naive_datetime
    field :time_out, :naive_datetime
    belongs_to :assignment, TaskTracker.Assignments.Assignment

    timestamps()
  end

  @doc false
  def changeset(time, attrs) do
    time
    |> cast(attrs, [:time_in, :time_out, :assignment_id])
    |> validate_required([:time_in, :time_out, :assignment_id])
  end
end
