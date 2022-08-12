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

  @doc """
  Find the number of elements of a list. 

  ## Examples

      iex> App.length([])
      0

      iex> App.length([0])
      1

      iex> App.length([0,1,2])
      3

  """

  def length([]), do: 0
  def length([], l), do: l
  def length([_head | tail], l), do: length(tail, l + 1)
  def length([_head | tail]), do: length(tail, 1)

  @doc """
  Reverse a list. 

  ## Examples

      iex> App.reverse([])
      []

      iex> App.reverse([0])
      [0]

      iex> App.reverse([0, 1, 2])
      [2, 1, 0]

      iex> App.reverse(['a', 'b', 'c'])
      ['c', 'b', 'a']

  """

  def reverse([]), do: []
  def reverse([], acc), do: acc

  def reverse([head | tail]), do: reverse([head | tail], [])
  def reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @doc """
  06 - Find out whether a list is a palindrome. 

  ## Examples

      iex> App.isPalindrome([1, 2, 3])
      false

      iex> App.isPalindrome("madamimadam")
      true

      iex> App.isPalindrome([1, 2, 4, 8, 16, 8, 4, 2, 1])
      true

  """

  def isPalindrome(xs) when is_list(xs), do: Enum.join(xs, "") == Enum.join(reverse(xs), "")
  def isPalindrome(str), do: str == reverse(String.split(str)) |> Enum.join()

  @doc """
  07 - Flatten a nested list structure. 

  ## Examples

      iex> App.flatten([])
      []

      iex> App.flatten([1])
      [1]

      iex> App.flatten([1, [2, [3, [4]]]])
      [1, 2, 3, 4]

  """

  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [head]

  @doc """
  08 - Eliminate consecutive duplicates of list elements.

  ## Examples

      iex> App.compress("abcabc")
      "abcabc"

      iex> App.compress("aaabbbaaabbcccc")
      "ababc"

  """

  def compress(str) when is_binary(str),
    do:
      str
      |> String.split("", trim: true)
      |> compress([])
      |> Enum.reverse()
      |> Enum.join("")

  def compress([], accumulator), do: accumulator
  def compress([head | tail], [head | _rest] = acc), do: compress(tail, acc)
  def compress([head | tail], []), do: compress(tail, [head])
  def compress([head | tail], accumulator), do: compress(tail, [head | accumulator])
end
