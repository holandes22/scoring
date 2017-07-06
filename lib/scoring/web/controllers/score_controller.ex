defmodule Scoring.Web.ScoreController do
  use Scoring.Web, :controller

  def index(conn, %{"score" => score}) do

    Scoring.Server.set_score(score["left"], score["right"])
    Scoring.Web.Endpoint.broadcast("room:lobby", "score_event", score)

    conn
    |> put_flash(:info, "Score updated")
    |> render("index.html")
  end

  def index(conn, _params) do
    render conn, "index.html"
  end
end
