defmodule PiDashCam.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    port = Application.get_env(:picam_http, :port)
    # interface = Application.get_env(:pi_dash_cam, :interface, :eth0)
    # Nerves.Network.setup interface

    children = [
      worker(Picam.Camera, []),
      Plug.Adapters.Cowboy.child_spec(:http, PiDashCam.Router, [], [port: port]),
    ]

    opts = [strategy: :one_for_one, name: PiDashCam.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
