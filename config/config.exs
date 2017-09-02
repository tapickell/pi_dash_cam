# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :picam_http, port: 4001

config :pi_dash_cam, interface: :eth0

config :nerves_network, :default,
  eth0: [
    ipv4_address_method: :dhcp
  ]

config :nerves, :firmware,
  rootfs_overlay: "rootfs_overlay"

config :bootloader,
  init: [:nerves_runtime,
         :nerves_network
        ],
  app: :pi_dash_cam

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
