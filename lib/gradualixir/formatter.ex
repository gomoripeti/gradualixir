defmodule Gradualixir.Formatter do
  @moduledoc false

  @doc """
  Pretty prints a type represented by an Erlang AST
  """
  @spec pp_type(:erl_parse.abstract_type()) :: String.t()
  def pp_type({:type, _, :bounded_fun, [fun_type, constraints]}) do
    [pp_type(fun_type), "when ", Enum.map_join(constraints, ", ", &pp_constraint/1)]
  end

  def pp_type(type_ast) do
    IO.inspect(type_ast)
    type = {:dummy_name, type_ast, []}
    {:::, _, [_name, quoted_type]} = Code.Typespec.type_to_quoted(type)
    Macro.to_string(quoted_type)
  end

  defp pp_constraint({:type, _, :constraint, [{:atom, _, :is_subtype}, [value, type]]}) do
    [pp_type(value), ': ', pp_type(type)]
  end
end
