defmodule Maybe.Mixfile do
  use Mix.Project

  def package do
    [maintainers: ["Feng Zhou"],
     licenses: ["MIT"],
     description: "Utils to deal with errors",
     links: %{"GitHub" => "https://github.com/zweifisch/maybe"}]
  end

  def project do
    [app: :maybe,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
