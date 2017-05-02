defmodule Ratify.Ecto.Plug.RequireAuth do
  def init(params) do
    params = Enum.into(params, %{})
    %{handler: build_handler_tuple(params)}
  end

  def call(conn, params) do
    case conn.assigns[:user] do
      nil ->
        {module, function} = Map.get(params, :handler)
        apply(module, function, [conn])
      _ -> conn
    end
  end

  defp build_handler_tuple(%{handler: handler_module}) do
    {handler_module, :handle_unauthenticated}
  end

  defp build_handler_tuple(_) do
    {Ratify.Handlers.AuthHandler, :handle_unauthenticated}
  end
end
