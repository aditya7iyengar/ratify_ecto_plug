defmodule Ratify.Ecto.Plug.AuthHandler do
  @moduledoc """
  A default error handler that can be used for failed authentication
  """

  @callback handle_unauthenticated(Plug.Conn.t, map) :: Plug.Conn.t

  import Plug.Conn

  def handle_unauthenticated(conn, transform) do
    conn
    |> transform.()
    |> halt()
  end
end
