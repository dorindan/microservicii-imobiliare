defmodule ApartmentsApiWeb.ApartmentView do
  use ApartmentsApiWeb, :view
  alias ApartmentsApiWeb.ApartmentView

  def render("index.json", %{apartments: apartments}) do
    %{data: render_many(apartments, ApartmentView, "apartment.json")}
  end

  def render("show.json", %{apartment: apartment}) do
    %{data: render_one(apartment, ApartmentView, "apartment.json")}
  end

  def render("apartment.json", %{apartment: apartment}) do
    %{id: apartment.id,
      pictureFileName: apartment.pictureFileName,
      name: apartment.name,
      details: apartment.details,
      price: apartment.price,
      mapLink: apartment.mapLink}
  end
end
