defmodule Ratify.Ecto.Plug.SetUser do
  import Plug.Conn

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Ratify.Ecto.Plug.config(:user_repo).get(Ratify.Ecto.Plug.config(:user_struct), user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
