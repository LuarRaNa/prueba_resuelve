defmodule PruebaResuelve.Payroll do
  @moduledoc """
  The Payroll context.
  """

  # Esquema de pago
  @payroll %{
    "A" => 5,
    "B" => 10,
    "C" => 15,
    "Cuauh" => 20
  }

  def get_salary(jugadores, payroll \\ @payroll) do
    {total_goles, total_nivel} = team_goal(jugadores, payroll)
    bono_equipo = total_goles / total_nivel

    fill_payment(jugadores, bono_equipo, payroll)
  end

  defp team_goal(jugadores, payroll) do
    jugadores
    |> Enum.map(fn jugador -> {jugador["goles"], payroll[jugador["nivel"]]} end)
    |> Enum.reduce({0, 0}, fn {goles, nivel}, {total_goles, total_nivel} ->
      {goles + total_goles, nivel + total_nivel}
    end)
  end

  defp fill_payment(jugadores, bono_equipo, payroll) do
    jugadores
    |> Enum.map(fn jugador -> %{jugador | "sueldo_completo" => jugador["sueldo"]} end)
    |> Enum.map(fn jugador -> salary_plus_bonus(jugador, bono_equipo, payroll) end)
  end

  defp salary_plus_bonus(jugador, bono_equipo, payroll) do
    bono_total = jugador["goles"] / payroll[jugador["nivel"]] + bono_equipo
    sueldo_completo = bono_total / 2 * jugador["bono"] + jugador["sueldo_completo"]

    %{jugador | "sueldo_completo" => sueldo_completo}
  end
end
