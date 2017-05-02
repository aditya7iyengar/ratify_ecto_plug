defmodule Ratify.Ecto.Plug.BehaviorHandler do
  @moduledoc """
  A default error handler that can be used for failed behavior
  """

  @callback handle_bad_behavior(Plug.Conn.t, map) :: Plug.Conn.t

  import Plug.Conn

  def handle_bad_behavior(conn, transform) do
    conn
    |> transform.()
    |> halt()
  end
end
