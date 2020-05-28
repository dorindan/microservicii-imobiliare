defmodule UserApiWeb.UserView do
  use UserApiWeb, :view
  alias UserApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      encrypted_password: user.encrypted_password,
      telephone: user.telephone,
      username: user.username}
  end
end
