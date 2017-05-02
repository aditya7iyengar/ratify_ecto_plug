defmodule Ratify.Ecto.Plug.RequireBehavior do
  def init(params) do
    params = Enum.into(params, %{})
    %{handler: build_handler_tuple(params)}
  end

  def call(conn, params) do
    behavior = Map.get(params, :behavior)

    case conn.assigns[:user] |> behavior.() do
      nil ->
        {module, function} = Map.get(params, :handler)
        transform = Map.get(params, :transform)

        apply(module, function, [conn, transform])
      _ -> conn
    end
  end

  defp build_handler_tuple(%{handler: handler_module}) do
    {handler_module, :handle_bad_behavior}
  end

  defp build_handler_tuple(_) do
    {Ratify.Ecto.Plug.BehaviorHandler, :handle_bad_behavior}
  end
end
