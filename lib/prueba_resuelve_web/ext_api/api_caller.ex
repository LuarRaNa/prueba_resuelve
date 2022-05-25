defmodule PruebaResuelveWeb.ExtApi.ApiCaller do
  def get_json(path, params) do
    "/api/#{path}"
    |> build_request(params)
    |> Finch.request(PruebaResuelveWebApi)
    |> parse_as_json()
    |> case do
      {:ok, json} ->
        {:ok, json}

      error ->
        error
    end
  end

  defp build_request(path, params) do
    request_url = "http://localhost:4000#{path}"

    Finch.build(
      :post,
      request_url,
      [
        {"Content-Type", "application/json"}
      ],
      params
    )
  end

  defp parse_as_json({:ok, %Finch.Response{status: 200, body: body}}) do
    Jason.decode(body)
  end

  defp parse_as_json({:ok, %Finch.Response{status: error_code, body: body}}) do
    {:error, {:http, error_code, body}}
  end

  defp parse_as_json({:error, _exception} = error), do: error
end
