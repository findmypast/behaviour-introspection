defmodule Test.SimpleImplementation1 do
  @behaviour Test.SimpleBehaviour

  def description do
    "This is the first simple implementation"
  end

end

defmodule Test.SimpleImplementation2 do
  @behaviour Test.SimpleBehaviour

  def description do
    "This is the second simple implementation"
  end

end
