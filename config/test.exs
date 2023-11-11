import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :prenix_components_docs_web, PrenixComponentsDocsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "hxp5/KYM0wSAh9SkUQWsX0iEtai0jDvVTPEynkfjg18YCBOrERWajIZC8aUZ7aho",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# In test we don't send emails.
config :prenix_components_docs, PrenixComponentsDocs.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
