# Behaviour Introspection

Allows you to gather all modules that implement a specified behaviour so that operations can be performed on them without tight coupling.

This removes the need for specific module registration.

Behaviours are the equivalent to interfaces in Elixir.

## Installation

The package can be installed as:

  1. Add `behaviour_introspection` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:behaviour_introspection, git: "git@github.com:findmypast/behaviour-introspection.git",tag:"0.1.0"}]
    end
    ```

  2. Ensure `behaviour_introspection` is started before your application:

    ```elixir
    def application do
      [applications: [:behaviour_introspection]]
    end
    ```
  3. Run 'mix deps.get'

## Example

```elixir
# An example behaviour with a description function.
defmodule Test.SimpleBehaviour do
  @callback description() :: String.t
end

# A couple of implementations of a behaviour.
defmodule Test.SimpleImplementation1 do
  @behaviour Test.SimpleBehaviour

  def description do
    "This is the first simple implementation"
  end
end

# Call all description methods on any modules that implement SimpleBehaviour.

BehaviourIntrospection.available_modules_with_behaviour(Test.SimpleBehaviour)
  |> Enum.each(fn (x) -> IO.inspect(x.description) end)

# Outputs

"This is the first simple implementation"
```

To add a new implementation simply create the new module in your project with the SimpleBehaviour, as follows:

```elixir
defmodule Test.SimpleImplementation2 do
  @behaviour Test.SimpleBehaviour

  def description do
    "This is the second simple implementation"
  end
end

# Outputs

"This is the first simple implementation"
"This is the second simple implementation"
```
