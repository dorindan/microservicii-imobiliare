defmodule UserApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    Code.require_file("../apartments_api/lib/apartments_api/apartments/apartment.ex")
    field :email, :string
    field :encrypted_password, :string
    field :firstName, :string
    field :lastName, :string
    field :telephone, :string
    field :username, :string
    field :password, :string, virtual: true
    has_many :apartments, ApartmentsApi.Apartments.Apartment

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :firstName, :lastName, :encrypted_password, :telephone, :username])
    |> validate_required([:email, :firstName, :lastName, :encrypted_password, :telephone, :username])
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> update_change(:encrypted_password, &Bcrypt.hash_pwd_salt/1)
  end

end
