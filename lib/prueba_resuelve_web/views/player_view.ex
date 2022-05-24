defmodule PruebaResuelveWeb.PlayerView do
  use PruebaResuelveWeb, :view
  alias PruebaResuelveWeb.PlayerView

  def render("salary.json", %{jugadores: jugadores}) do
    %{"jugadores" => render_many(jugadores, PlayerView, "player.json")}
  end

  def render("player.json", jugador) do
    jugador
  end
end
