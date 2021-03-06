defmodule TaskTracker.AssignmentsTest do
  use TaskTracker.DataCase

  alias TaskTracker.Assignments

  describe "t" do
    alias TaskTracker.Assignments.Assignment

    @valid_attrs %{assingments: "some assingments", time: 42}
    @update_attrs %{assingments: "some updated assingments", time: 43}
    @invalid_attrs %{assingments: nil, time: nil}

    def assignment_fixture(attrs \\ %{}) do
      {:ok, assignment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Assignments.create_assignment()

      assignment
    end

    test "list_t/0 returns all t" do
      assignment = assignment_fixture()
      assert Assignments.list_t() == [assignment]
    end

    test "get_assignment!/1 returns the assignment with given id" do
      assignment = assignment_fixture()
      assert Assignments.get_assignment!(assignment.id) == assignment
    end

    test "create_assignment/1 with valid data creates a assignment" do
      assert {:ok, %Assignment{} = assignment} = Assignments.create_assignment(@valid_attrs)
      assert assignment.assingments == "some assingments"
      assert assignment.time == 42
    end

    test "create_assignment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Assignments.create_assignment(@invalid_attrs)
    end

    test "update_assignment/2 with valid data updates the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{} = assignment} = Assignments.update_assignment(assignment, @update_attrs)
      assert assignment.assingments == "some updated assingments"
      assert assignment.time == 43
    end

    test "update_assignment/2 with invalid data returns error changeset" do
      assignment = assignment_fixture()
      assert {:error, %Ecto.Changeset{}} = Assignments.update_assignment(assignment, @invalid_attrs)
      assert assignment == Assignments.get_assignment!(assignment.id)
    end

    test "delete_assignment/1 deletes the assignment" do
      assignment = assignment_fixture()
      assert {:ok, %Assignment{}} = Assignments.delete_assignment(assignment)
      assert_raise Ecto.NoResultsError, fn -> Assignments.get_assignment!(assignment.id) end
    end

    test "change_assignment/1 returns a assignment changeset" do
      assignment = assignment_fixture()
      assert %Ecto.Changeset{} = Assignments.change_assignment(assignment)
    end
  end
end
