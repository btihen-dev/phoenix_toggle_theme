defmodule Darktoggle.Repo do
  use Ecto.Repo,
    otp_app: :darktoggle,
    adapter: Ecto.Adapters.Postgres
end
