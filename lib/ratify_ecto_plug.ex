defmodule Ratify.Ecto.Plug do
  @moduledoc """
  A module that provides Simple authentication for Ecto and Plug based applications.

  ## Configuration
      config :ratify_ecto_plug, Ratify.Ecto.Plug,
        user_struct: MyApp.User,
        user_repo: MyApp.Repo

  """

  unless Application.get_env(:ratify_ecto_plug, Ratify.Ecto.Plug) do
    raise "Ratify.Ecto.Plug is not configured"
  end

  unless Keyword.get(Application.get_env(:ratify_ecto_plug, Ratify.Ecto.Plug), :user_struct) do
    raise "Ratify.Ecto.Plug requires a user_struct"
  end

  unless Keyword.get(Application.get_env(:ratify_ecto_plug, Ratify.Ecto.Plug), :user_repo) do
    raise "Ratify.Ecto.Plug requires a user_repo"
  end

  @doc false
  def config, do: Application.get_env(:ratify_ecto_plug, Ratify.Ecto.Plug)

  @doc false
  def config(key), do: config() |> Keyword.get(key)
end
