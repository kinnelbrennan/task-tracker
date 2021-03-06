defmodule TaskTrackerWeb.AssignmentController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Assignments
  alias TaskTracker.Assignments.Assignment
  alias TaskTracker.Users

  def index(conn, _params) do
    t = Assignments.list_t()
    render(conn, "index.html", t: t)
  end

  def new(conn, _params) do
    changeset = Assignments.change_assignment(%Assignment{})
    users =
      Users.list_users
      ##|> Enum.filter() filter by manager
      |> Enum.map(&{"#{&1.email}", &1.id})
    render(conn, "new.html", changeset: changeset, users: users)
  end

  def create(conn, %{"assignment" => assignment_params}) do
    case Assignments.create_assignment(assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment created successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    assignment = Assignments.get_assignment!(id)
    users =
      Users.list_users
      ##|> Enum.filter() filter by manager
      |> Enum.map(&{"#{&1.email}", &1.id})
    render(conn, "show.html", assignment: assignment, users: users)
  end

  def edit(conn, %{"id" => id}) do
    assignment = Assignments.get_assignment!(id)
    changeset = Assignments.change_assignment(assignment)
    users =
      Users.list_users
      ##|> Enum.filter() filter by manager
      |> Enum.map(&{"#{&1.email}", &1.id})
    render(conn, "edit.html", assignment: assignment, changeset: changeset, users: users)
  end

  def update(conn, %{"id" => id, "assignment" => assignment_params}) do
    assignment = Assignments.get_assignment!(id)

    case Assignments.update_assignment(assignment, assignment_params) do
      {:ok, assignment} ->
        conn
        |> put_flash(:info, "Assignment updated successfully.")
        |> redirect(to: Routes.assignment_path(conn, :show, assignment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", assignment: assignment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    assignment = Assignments.get_assignment!(id)
    {:ok, _assignment} = Assignments.delete_assignment(assignment)

    conn
    |> put_flash(:info, "Assignment deleted successfully.")
    |> redirect(to: Routes.assignment_path(conn, :index))
  end
end
