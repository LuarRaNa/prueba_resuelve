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
      pid = self()
      Task.async(fn ->
        Process.sleep(1000)
        send(pid, {:api_call_done, json})
      end)

      {:noreply, assign(socket, :input_json, json)}
    else
      {:error, _} -> {:noreply, assign(socket, :input_json, %{})}
    end
  end

  def handle_info({:api_call_done, result}, socket) do
    {:noreply, assign(socket, :result_json, result)}
  end

  # Evitar que la llamada de retorno de Task.async termine IndexLive.
  def handle_info(_, socket), do: {:noreply, socket}
end
