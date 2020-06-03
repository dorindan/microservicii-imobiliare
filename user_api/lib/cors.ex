defmodule Cors do
  @moduledoc false
  use Corsica.Router,
      origins: "*",
      allow_credentials: true,
      max_age: 600,
      allow_headers: :all

  resource "/*"

end
