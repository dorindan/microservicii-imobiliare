defmodule ApartmentsApi.Repo.Migrations.ChangeMapLinkType do
  use Ecto.Migration

  def change do
    alter table(:apartments) do
      modify :mapLink, :varchar, size: "10000"
    end
  end
end
