defmodule BehaviourIntrospectionTest do
  use ExUnit.Case

  test "Ensure that memoised result is identical to non-memoised result." do
    non_memoised_result = BehaviourIntrospection.available_modules_with_behaviour(Test.SimpleBehaviour)
    memoised_result = BehaviourIntrospection.available_modules_with_behaviour(Test.SimpleBehaviour)

    assert memoised_result == non_memoised_result
  end

  test "Check that SimpleImplementation1 is returned when SimpleBehaviour is interrogated" do
    assert BehaviourIntrospection.available_modules_with_behaviour(Test.SimpleBehaviour)
      |> Enum.any?(fn (x) -> x == Test.SimpleImplementation1 end)
  end


  test "Check that SimpleImplementation2 is returned when SimpleBehaviour is interrogated" do
    assert BehaviourIntrospection.available_modules_with_behaviour(Test.SimpleBehaviour)
      |> Enum.any?(fn (x) -> x == Test.SimpleImplementation2 end)
  end

  test "Here is the example code test !" do
    # Call all description methods on any modules that implement SimpleBehaviour.
    BehaviourIntrospection.available_modules_with_behaviour(Test.SimpleBehaviour)
      |> Enum.each(fn (x) -> IO.inspect(x.description()) end)
  end

end
