defmodule ApartmentsApi.Repo.Migrations.CreateApartments do
  use Ecto.Migration

  def change do
    create table(:apartments) do
      add :pictureFileName, :string
      add :name, :string
      add :details, :string
      add :price, :integer
      add :mapLink, :string
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:apartments, [:owner_id])
  end
end
