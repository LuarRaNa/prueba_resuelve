import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :prueba_resuelve, PruebaResuelveWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "G47VEhXqEo5d+i8N5ap7pXGEBxjZj5KA2MGBf5VpQJ8N9cwgz2L8JxhDrNUVsU/G",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
