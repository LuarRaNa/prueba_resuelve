defmodule PruebaResuelveWeb.PageController do
  use PruebaResuelveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
