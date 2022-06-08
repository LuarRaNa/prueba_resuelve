defmodule PruebaResuelveWeb.IndexLive do
  use Phoenix.LiveView,
    layout: {PruebaResuelveWeb.LayoutView, "live.html"},
    container: {:div, class: "h-5/6"}

  def mount(_params, _map, socket) do
    socket =
      socket
      |> assign(:input_json, %{})
      |> assign(:result_json, %{})

    {:ok, socket}
  end

  def handle_event("new_json", %{"value" => value}, socket) do
    with {:ok, json} <- Jason.decode(value) do
      Task.Supervisor.async_nolink(
        PruebaResuelveWeb.TaskSupervisor,
        fn ->
          PruebaResuelveWeb.ExtApi.ApiCaller.get_json("players", value)
        end
      )

      {:noreply, assign(socket, :input_json, json)}
    else
      {:error, _} -> {:noreply, socket |> assign(:input_json, %{}) |> assign(:result_json, %{})}
    end
  end

  def handle_info({ref, result}, socket) do
    Process.demonitor(ref, [:flush])

    with {:ok, json} <- result do
      {:noreply, assign(socket, :result_json, json)}
    else
      {:error, _} -> {:noreply, assign(socket, :result_json, %{})}
    end
  end

  def handle_info({:DOWN, _ref, _, _, reason}, socket) do
    IO.inspect(reason)
    {:noreply, socket}
  end
end
