use Mix.Config

config :scoring, Scoring.Web.Endpoint,
  on_init: {Scoring.Web.Endpoint, :load_from_system_env, []},
  url: [host: "radiant-earth-11117.herokuapp.com", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info
