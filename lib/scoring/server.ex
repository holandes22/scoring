defmodule Scoring.Server do
  use GenServer

  def start_link(state \\ {:left, 0, :right, 0}) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state), do: {:ok, state}

  def get_score(), do: GenServer.call(__MODULE__, :get_score)
  def set_score(left, right), do: GenServer.call(__MODULE__, {:set_score, left, right})

  def handle_call(:get_score, _from, state), do:  {:reply, {:ok, state}, state}

  def handle_call({:set_score, left, right}, _from, _state) do
    state = {:left, left, :right, right}
    {:reply, {:ok, state}, state}
  end

end
