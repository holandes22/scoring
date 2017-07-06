defmodule Scoring.Web.PageController do
  use Scoring.Web, :controller
  alias Scoring.Server

  def index(conn, _params) do
    {:ok, {:left, left, :right, right}} = Server.get_score()

    conn
    |> assign(:score, %{left: left, right: right})
    |> render("index.html")
  end
end
