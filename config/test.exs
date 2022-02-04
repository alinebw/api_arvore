import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :api_arvore, ApiArvore.Repo,
  adapter: Ecto.Adapter.MySQL,
  username: "root",
  password: "Bromeli@s",
  hostname: "localhost",
  port: 3306,
  database: "api_arvore_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_arvore, ApiArvoreWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "xpPQxRsBQEk+Qy/mpwXc68J3KFeZWtpxupX7kyq1OFII5DKuNxYzkliio3V92RWe",
  server: false

# In test we don't send emails.
config :api_arvore, ApiArvore.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
