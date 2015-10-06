defmodule Excountries.Mixfile do
  use Mix.Project

  def project do
    [app: :excountries,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.7.2"},
      {:poison, "~> 1.5"}
    ]
  end

  defp description do
    """
    Elixir wrapper for REST Countries API (http://restcountries.eu/)
    """
  end

  defp package do
    [
     files: ["lib", "config", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Ilija Eftimov"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/fteem/excuntries"}
    ]
  end
end
