defmodule UserApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :firstName, :string
      add :lastName, :string
      add :encrypted_password, :string
      add :telephone, :string
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:username])
  end
end
