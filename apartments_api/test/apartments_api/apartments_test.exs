defmodule ApartmentsApi.ApartmentsTest do
  use ApartmentsApi.DataCase

  alias ApartmentsApi.Apartments

  describe "apartments" do
    alias ApartmentsApi.Apartments.Apartment

    @valid_attrs %{details: "some details", mapLink: "some mapLink", name: "some name", pictureFileName: "some pictureFileName", price: 42}
    @update_attrs %{details: "some updated details", mapLink: "some updated mapLink", name: "some updated name", pictureFileName: "some updated pictureFileName", price: 43}
    @invalid_attrs %{details: nil, mapLink: nil, name: nil, pictureFileName: nil, price: nil}

    def apartment_fixture(attrs \\ %{}) do
      {:ok, apartment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Apartments.create_apartment()

      apartment
    end

    test "list_apartments/0 returns all apartments" do
      apartment = apartment_fixture()
      assert Apartments.list_apartments() == [apartment]
    end

    test "get_apartment!/1 returns the apartment with given id" do
      apartment = apartment_fixture()
      assert Apartments.get_apartment!(apartment.id) == apartment
    end

    test "create_apartment/1 with valid data creates a apartment" do
      assert {:ok, %Apartment{} = apartment} = Apartments.create_apartment(@valid_attrs)
      assert apartment.details == "some details"
      assert apartment.mapLink == "some mapLink"
      assert apartment.name == "some name"
      assert apartment.pictureFileName == "some pictureFileName"
      assert apartment.price == 42
    end

    test "create_apartment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Apartments.create_apartment(@invalid_attrs)
    end

    test "update_apartment/2 with valid data updates the apartment" do
      apartment = apartment_fixture()
      assert {:ok, %Apartment{} = apartment} = Apartments.update_apartment(apartment, @update_attrs)
      assert apartment.details == "some updated details"
      assert apartment.mapLink == "some updated mapLink"
      assert apartment.name == "some updated name"
      assert apartment.pictureFileName == "some updated pictureFileName"
      assert apartment.price == 43
    end

    test "update_apartment/2 with invalid data returns error changeset" do
      apartment = apartment_fixture()
      assert {:error, %Ecto.Changeset{}} = Apartments.update_apartment(apartment, @invalid_attrs)
      assert apartment == Apartments.get_apartment!(apartment.id)
    end

    test "delete_apartment/1 deletes the apartment" do
      apartment = apartment_fixture()
      assert {:ok, %Apartment{}} = Apartments.delete_apartment(apartment)
      assert_raise Ecto.NoResultsError, fn -> Apartments.get_apartment!(apartment.id) end
    end

    test "change_apartment/1 returns a apartment changeset" do
      apartment = apartment_fixture()
      assert %Ecto.Changeset{} = Apartments.change_apartment(apartment)
    end
  end
end
