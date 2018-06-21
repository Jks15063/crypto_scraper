# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :crypto_scraper,
  ecto_repos: [CryptoScraper.Repo]

# Configures the endpoint
config :crypto_scraper, CryptoScraperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "szFTAbVnmwUBJTcZK8bnM69xyFP9kxOyP7T89DywQk63n5lYV6rMM9R0DiXYvlzF",
  render_errors: [view: CryptoScraperWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CryptoScraper.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
