defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  # 
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.
 
  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_head | tail]), do: 1 + count(tail)
  
  @spec reverse(list) :: list
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([head | tail], acc), do: reverse(tail, [head | acc])
  
  @spec map(list, (any -> any)) :: list
  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func) ]
  
  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _func), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _func), do: acc
  def reduce([head | tail], acc, func), do: reduce(tail, func.(head, acc), func)
  
  @spec append(list, list) :: list
  def append(a, b), do: reverse(reverse(a), b)
  
  @spec concat([[any]]) :: [any]
  def concat(ll), do: concat(reverse(ll), [])
  defp concat([], acc), do: acc
  defp concat([head | tail], acc), do: concat(tail, append(head, acc))
end