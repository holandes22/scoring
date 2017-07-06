defmodule Scoring.Web.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, {:left, left, :right, right}} = Scoring.Server.get_score()

    {:ok, %{left: left, right: right}, socket}
  end

  def handle_out("score_event", payload, socket) do
    push socket, "score_event", payload
    {:noreply, socket}
  end
end
