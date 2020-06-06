defmodule ApartmentsApiWeb.ApartmentControllerTest do
  use ApartmentsApiWeb.ConnCase

  alias ApartmentsApi.Apartments
  alias ApartmentsApi.Apartments.Apartment

  @create_attrs %{
    details: "some details",
    mapLink: "some mapLink",
    name: "some name",
    pictureFileName: "some pictureFileName",
    price: 42
  }
  @update_attrs %{
    details: "some updated details",
    mapLink: "some updated mapLink",
    name: "some updated name",
    pictureFileName: "some updated pictureFileName",
    price: 43
  }
  @invalid_attrs %{details: nil, mapLink: nil, name: nil, pictureFileName: nil, price: nil}

  def fixture(:apartment) do
    {:ok, apartment} = Apartments.create_apartment(@create_attrs)
    apartment
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all apartments", %{conn: conn} do
      conn = get(conn, Routes.apartment_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create apartment" do
    test "renders apartment when data is valid", %{conn: conn} do
      conn = post(conn, Routes.apartment_path(conn, :create), apartment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.apartment_path(conn, :show, id))

      assert %{
               "id" => id,
               "details" => "some details",
               "mapLink" => "some mapLink",
               "name" => "some name",
               "pictureFileName" => "some pictureFileName",
               "price" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.apartment_path(conn, :create), apartment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update apartment" do
    setup [:create_apartment]

    test "renders apartment when data is valid", %{conn: conn, apartment: %Apartment{id: id} = apartment} do
      conn = put(conn, Routes.apartment_path(conn, :update, apartment), apartment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.apartment_path(conn, :show, id))

      assert %{
               "id" => id,
               "details" => "some updated details",
               "mapLink" => "some updated mapLink",
               "name" => "some updated name",
               "pictureFileName" => "some updated pictureFileName",
               "price" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, apartment: apartment} do
      conn = put(conn, Routes.apartment_path(conn, :update, apartment), apartment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete apartment" do
    setup [:create_apartment]

    test "deletes chosen apartment", %{conn: conn, apartment: apartment} do
      conn = delete(conn, Routes.apartment_path(conn, :delete, apartment))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.apartment_path(conn, :show, apartment))
      end
    end
  end

  defp create_apartment(_) do
    apartment = fixture(:apartment)
    %{apartment: apartment}
  end
end
