defmodule HtmlDemo.Repo do
  use Ecto.Repo,
    otp_app: :html_demo,
    adapter: Ecto.Adapters.Postgres
end
