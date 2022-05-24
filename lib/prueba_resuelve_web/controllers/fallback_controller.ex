defmodule PruebaResuelveWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use PruebaResuelveWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, code}) do
    conn
    |> put_status(code)
    |> put_view(PruebaResuelveWeb.ErrorView)
    |> render(:"404")
  end
end
