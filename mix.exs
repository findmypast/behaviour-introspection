defmodule BehaviourIntrospection.Mixfile do
  use Mix.Project

  def project do
    [app: :behaviour_introspection,
     version: "0.1.0",
     elixir: "~> 1.3",
     deps: deps(),
     description: description(),
     package: package()
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger,:defmemo]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:defmemo, "~> 0.1.0"}]
  end

  defp description do
    "Removes the need for factories. Enables open for extension, closed for modification."
  end

  defp package do
  [
    files: ~w(lib mix.exs README.md LICENSE),
    maintainers: ["Dave Elliott, Kim McCann"],
    licenses: ["Apache 2.0"],
    links: %{"GitHub" => "https://github.com/findmypast/behaviour-introspection"}
  ]
  end

end
