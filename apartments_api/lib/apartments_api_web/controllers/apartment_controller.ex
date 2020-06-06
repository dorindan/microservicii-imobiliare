defmodule ApartmentsApiWeb.ApartmentController do
  use ApartmentsApiWeb, :controller

  alias ApartmentsApi.Apartments
  alias ApartmentsApi.Apartments.Apartment

  action_fallback ApartmentsApiWeb.FallbackController

  def index(conn, _params) do
    apartments = Apartments.list_apartments()
    render(conn, "index.json", apartments: apartments)
  end

  def create(conn, apartment_params) do
    with {:ok, %Apartment{} = apartment} <- Apartments.create_apartment(apartment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.apartment_path(conn, :show, apartment))
      |> render("show.json", apartment: apartment)
    end
  end

  def show(conn, %{"id" => id}) do
    apartment = Apartments.get_apartment!(id)
    render(conn, "show.json", apartment: apartment)
  end

  def update(conn, %{"id" => id, "apartment" => apartment_params}) do
    apartment = Apartments.get_apartment!(id)

    with {:ok, %Apartment{} = apartment} <- Apartments.update_apartment(apartment, apartment_params) do
      render(conn, "show.json", apartment: apartment)
    end
  end

  def delete(conn, %{"id" => id}) do
    apartment = Apartments.get_apartment!(id)

    with {:ok, %Apartment{}} <- Apartments.delete_apartment(apartment) do
      send_resp(conn, :no_content, "")
    end
  end
end
