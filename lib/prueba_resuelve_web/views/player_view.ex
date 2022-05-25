defmodule PruebaResuelveWeb.PlayerView do
  use PruebaResuelveWeb, :view
  alias PruebaResuelveWeb.PlayerView

  def render("jugadores.json", %{jugadores: jugadores}) do
    %{"jugadores" => render_many(jugadores, PlayerView, "jugador.json")}
  end

  def render("jugador.json", %{player: jugador}) do
    %{
      "bono" => jugador["bono"],
      "equipo" => jugador["equipo"],
      "goles" => jugador["equipo"],
      "nivel" => jugador["nivel"],
      "nombre" => jugador["nombre"],
      "sueldo" => jugador["sueldo"],
      "sueldo_completo" => jugador["sueldo_completo"]
    }
  end
end
