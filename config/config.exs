# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :picam_http, port: 80

config :pi_dash_cam, interface: :wlan0

config :nerves_network,
  regulatory_domain: "US"

config :nerves_network, :default,
  wlan0: [
    ssid: "Pickle's Wi-Fi Network",
    psk: "Sprt121926",
    key_mgmt: :"WPA2-PSK"
  ],
  eth0: [
    ipv4_address_method: :dhcp
  ]

config :nerves, :firmware,
  rootfs_overlay: "rootfs_overlay"

config :logger, level: :debug

config :bootloader,
  init: [
    :nerves_runtime,
    :nerves_network
  ],
  app: :pi_dash_cam

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
