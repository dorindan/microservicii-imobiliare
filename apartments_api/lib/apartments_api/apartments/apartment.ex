defmodule ApartmentsApi.Apartments.Apartment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "apartments" do
    field :details, :string
    field :mapLink, :string
    field :name, :string
    field :pictureFileName, :string
    field :price, :integer
    field :owner_id, :string

    timestamps()
  end

  @doc false
  def changeset(apartment, attrs) do
    apartment
    |> cast(attrs, [:pictureFileName, :name, :details, :price, :mapLink, :owner_id])
    |> validate_required([:pictureFileName, :name, :details, :price, :mapLink, :owner_id])
  end
end
