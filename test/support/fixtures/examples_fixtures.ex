defmodule HtmlDemo.ExamplesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HtmlDemo.Examples` context.
  """

  @doc """
  Generate a employees.
  """
  def employees_fixture(attrs \\ %{}) do
    {:ok, employees} =
      attrs
      |> Enum.into(%{
        name: "some name",
        title: "some title"
      })
      |> HtmlDemo.Examples.create_employees()

    employees
  end

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        name: "some name",
        title: "some title"
      })
      |> HtmlDemo.Examples.create_employee()

    employee
  end
end
