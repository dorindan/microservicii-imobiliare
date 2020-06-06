defmodule ApartmentsApi.Repo do
  use Ecto.Repo,
    otp_app: :apartments_api,
    adapter: Ecto.Adapters.Postgres
end
