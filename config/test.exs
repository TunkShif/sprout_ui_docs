import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :sprout_docs, SproutDocsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VEF28hNRd8zfJgFffcCGNo/MsMbtScaK5vYmL3SIQuFKWB5RT6ANriKyr/mvjw/s",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
