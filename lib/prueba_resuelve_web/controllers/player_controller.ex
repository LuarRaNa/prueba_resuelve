defmodule PruebaResuelveWeb.PlayerController do
  use PruebaResuelveWeb, :controller

  alias PruebaResuelve.Payroll

  action_fallback PruebaResuelveWeb.FallbackController

  def salary(conn, %{"jugadores" => jugadores}) do
    jugadores = Payroll.get_salary(jugadores)
    render(conn, "jugadores.json", jugadores: jugadores)
  end
end
