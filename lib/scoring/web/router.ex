defmodule Scoring.Web.Router do
  use Scoring.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Scoring.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/score", ScoreController, :index
    post "/score", ScoreController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Scoring.Web do
  #   pipe_through :api
  # end
end
