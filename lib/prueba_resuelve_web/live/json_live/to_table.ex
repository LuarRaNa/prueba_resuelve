defmodule PruebaResuelveWeb.JsonLive.ToTable do
  use Phoenix.Component

  defp get_head_body(%{"jugadores" => list}) do
    {
      List.first(list) |> Map.keys(),
      list
    }
  end

  defp get_head_body(%{}) do
    {[], []}
  end

  def from_json(assigns) do
    ~H"""
    <% {head, body} = get_head_body(@json) %>
    <%= if map_size(@json) != 0 do %>
      <div class="overflow-x-auto overflow-y-auto">
        <table class="table table-compact w-full">
          <thead>
            <tr>
              <th></th>
              <%= for th <- head do %>
                <th><%= th %></th>
              <% end %>
            </tr>
          </thead>
          <tbody>
            <%= for {tr, counter} <- Enum.with_index(body) do %>
              <tr>
                <th><%= counter %></th>
                <%= for th <- head do %>
                  <td><%= tr[th] %></td>
                <% end %>
              </tr>
            <% end %>
          </tbody>
          <tfoot>
            <tr>
              <th></th>
              <%= for th <- head do %>
                <th><%= th %></th>
              <% end %>
            </tr>
          </tfoot>
        </table>
      </div>
    <% end %>
    """
  end
end
