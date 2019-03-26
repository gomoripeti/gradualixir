defmodule GradualixirTest do
  use ExUnit.Case
  doctest Gradualixir

  test "greets the world" do
    # assert Gradualixir.hello() == :world
  end

  test "type annotations" do
    assert Gradualixir.gradualize(
             "_build/test/gradialixir/ebin/Elixir.GradualixirTest.ShouldPass.beam"
           ) == :ok
  end

  defmodule ShouldPass do
    use Gradualixir.Annotate

    @spec f(any()) :: atom()
    def f(a) do
      a :: 'integer()'
    end
  end
end
