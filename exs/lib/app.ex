defmodule App do
  @moduledoc """
  Documentation for `App`.
  """

  @doc """
  Get the last element in a list.

  ## Examples

      iex> App.last([])
      :nil

      iex> App.last([0])
      0

      iex> App.last([0,1,2])
      2

  """
  def last([]), do: nil
  def last([x]), do: x
  def last([_ | tail]), do: last(tail)

  @doc """
  Get the second last element in a list.

  ## Examples

      iex> App.butLast([])
      :nil

      iex> App.butLast([0])
      :nil

      iex> App.butLast([0,1,2])
      1

  """

  def butLast([]), do: nil
  def butLast([_x]), do: nil
  def butLast([x, _y]), do: x
  def butLast([_ | tail]), do: butLast(tail)

  @doc """
  Find the K'th element of a list. 

  ## Examples

      iex> App.at([], 1)
      :nil

      iex> App.at([0], 1)
      0

      iex> App.at([0,1,2], 2)
      1

  """

  def at([_ | tail], k) when k > 1, do: at(tail, k - 1)
  def at([x | _tail], k) when k == 1, do: x
  def at([], _k), do: nil
end
