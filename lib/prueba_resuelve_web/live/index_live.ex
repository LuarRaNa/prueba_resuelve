defmodule PruebaResuelveWeb.IndexLive do
  use Phoenix.LiveView,
    layout: {PruebaResuelveWeb.LayoutView, "live.html"},
    container: {:div, class: "h-5/6"}

  def mount(_params, _map, socket) do
    socket = assign(socket, :input_json, %{})
    {:ok, socket}
  end

  def handle_event("new_json", %{"value" => value}, socket) do
    with {:ok, json} <- Jason.decode(value) do
      {:noreply, assign(socket, :input_json, json)}
    else
      {:error, _} -> {:noreply, assign(socket, :input_json, %{})}
    end
  end
end
