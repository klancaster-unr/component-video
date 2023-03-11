defmodule HtmlDemoWeb.ListController do
    use HtmlDemoWeb, :controller
  alias HtmlDemo.Examples.Employee
  alias HtmlDemo.Repo

    def index(conn, _params) do
      render(conn, :index, employees: Repo.all(Employee))
    end

end
