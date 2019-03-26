defmodule Gradualixir.Annotate do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      import Gradualixir.Annotate

      @compile {:inline, [{:::, 2}]}
      @compile {:inline, ":::": 2}

      defp unquote(:::)(expr, _type), do: expr
      defp unquote(:":::")(expr, _type), do: expr
    end
  end

  defmacro annotate_type(x, y) do
    quote do
      unquote(x) :: unquote(y)
    end
  end

  defmacro assert_type(x, y) do
    quote do
      unquote(:":::")(unquote(x), unquote(type_to_charlist(y)))
    end
  end

  ##
  defp type_to_charlist(type) do
    [1, 2]
  end

  ##
  ##
  # 3def test(a) do
  ####    a <~> "integer()"
  ####    a :: "atom()"
  ##
  ##    {a,
  ##     <<16::float>>,
  ##     annotate_type({1,2,3}, integer())
  ## {annotate_type(a, 2), assert_type(a, 'integer()')}
  # unquote(:::)(a, 2)
  ##     assert_type(2, atom())}
  ## end

  ##
  ##  #def expr :: _type, do: expr
  ##
  ##  def expr <~> _type, do: expr
  ##
  ## for funname <- [:::, :":::"] do
  ##   def unquote(funname)(a, _type), do: a
  ## end
end
