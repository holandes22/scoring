defmodule Scoring.Web.ScoreController do
  use Scoring.Web, :controller
  alias Scoring.Server

  def index(conn, %{"score" => %{"left" => left, "right" => right}}) do
    Scoring.Server.set_score(left, right)

    conn
    |> put_flash(:info, "Score updated")
    |> render("index.html")
  end

  def index(conn, _params) do
    render conn, "index.html"
  end
end
