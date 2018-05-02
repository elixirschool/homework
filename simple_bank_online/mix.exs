defmodule SimpleBankOnline.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_bank_online,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SimpleBankOnline.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:simple_bank, path: "../simple_bank"},
    ]
  end
end
