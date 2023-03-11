defmodule HtmlDemo.ExamplesTest do
  use HtmlDemo.DataCase

  alias HtmlDemo.Examples

  describe "employees" do
    alias HtmlDemo.Examples.Employees

    import HtmlDemo.ExamplesFixtures

    @invalid_attrs %{name: nil, title: nil}

    test "list_employees/0 returns all employees" do
      employees = employees_fixture()
      assert Examples.list_employees() == [employees]
    end

    test "get_employees!/1 returns the employees with given id" do
      employees = employees_fixture()
      assert Examples.get_employees!(employees.id) == employees
    end

    test "create_employees/1 with valid data creates a employees" do
      valid_attrs = %{name: "some name", title: "some title"}

      assert {:ok, %Employees{} = employees} = Examples.create_employees(valid_attrs)
      assert employees.name == "some name"
      assert employees.title == "some title"
    end

    test "create_employees/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Examples.create_employees(@invalid_attrs)
    end

    test "update_employees/2 with valid data updates the employees" do
      employees = employees_fixture()
      update_attrs = %{name: "some updated name", title: "some updated title"}

      assert {:ok, %Employees{} = employees} = Examples.update_employees(employees, update_attrs)
      assert employees.name == "some updated name"
      assert employees.title == "some updated title"
    end

    test "update_employees/2 with invalid data returns error changeset" do
      employees = employees_fixture()
      assert {:error, %Ecto.Changeset{}} = Examples.update_employees(employees, @invalid_attrs)
      assert employees == Examples.get_employees!(employees.id)
    end

    test "delete_employees/1 deletes the employees" do
      employees = employees_fixture()
      assert {:ok, %Employees{}} = Examples.delete_employees(employees)
      assert_raise Ecto.NoResultsError, fn -> Examples.get_employees!(employees.id) end
    end

    test "change_employees/1 returns a employees changeset" do
      employees = employees_fixture()
      assert %Ecto.Changeset{} = Examples.change_employees(employees)
    end
  end

  describe "employees" do
    alias HtmlDemo.Examples.Employee

    import HtmlDemo.ExamplesFixtures

    @invalid_attrs %{name: nil, title: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Examples.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Examples.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{name: "some name", title: "some title"}

      assert {:ok, %Employee{} = employee} = Examples.create_employee(valid_attrs)
      assert employee.name == "some name"
      assert employee.title == "some title"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Examples.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{name: "some updated name", title: "some updated title"}

      assert {:ok, %Employee{} = employee} = Examples.update_employee(employee, update_attrs)
      assert employee.name == "some updated name"
      assert employee.title == "some updated title"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Examples.update_employee(employee, @invalid_attrs)
      assert employee == Examples.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Examples.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Examples.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Examples.change_employee(employee)
    end
  end
end
