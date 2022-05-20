defmodule PruebaResuelveWeb.IndexLive do
  use Phoenix.LiveView,
    layout: {PruebaResuelveWeb.LayoutView, "live.html"},
    container: {:div, class: "h-5/6"}

  def mount(_params, _map, socket) do
    {:ok, socket}
  end
end
