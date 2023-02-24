defmodule MyVMQPlugin.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_vernemq_plugin,
      version: "0.1.0",
      elixir: "1.14.3",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [applications: [:logger, :httpoison, :exjsx],
     env: [
       vmq_plugin_hooks:
       [{:on_client_wakeup, MyVMQPlugin, :on_client_wakeup,1,[]},
        {:on_client_offline, MyVMQPlugin, :on_client_offline,1,[]},
        {:on_client_gone, MyVMQPlugin, :on_client_gone,1,[]},
        {:on_publish, MyVMQPlugin, :on_publish,6,[]}],
       endpoint_on_client_wakeup:  "http://localhost:1889",
       endpoint_on_client_offline: "http://localhost:1889",
       endpoint_on_client_gone:    "http://localhost:1889",
       endpoint_on_publish:        "http://localhost:1889"]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:httpoison, "~> 0.9.0"},
     {:exjsx, "~> 3.2"}]
  end
end
