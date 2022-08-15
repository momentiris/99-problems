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
  def length([_head | tail]), do: length(tail, 1)
  def length([], l), do: l
  def length([_head | tail], l), do: length(tail, l + 1)

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
  def reverse([head | tail]), do: reverse([head | tail], [])

  def reverse([], acc), do: acc
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

  @doc """
  09 - Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

  ## Examples

      iex> App.pack([0, 0, 0, 0, 1, 2, 2, 3, 3, 0])
      [[0, 0, 0, 0], [1], [2, 2], [3, 3], [0]]

  """

  def pack(xs), do: pack([], xs) |> Enum.reverse()

  def pack([[head | _tail] = current | rest_acc], [head | tail]),
    do: pack([[head | current] | rest_acc], tail)

  def pack(accumulator, [head | tail]), do: pack([[head] | accumulator], tail)
  def pack(acc, []), do: acc

  @doc """
  10 - run-length encoding of a list. use the result of problem p09 to implement the so-called run-length encoding data compression method. consecutive duplicates of elements are encoded as lists (n e) where n is the number of duplicates of the element e.

  ## examples

      iex> App.encode([0, 0, 0, 0, 1, 2, 2, 3, 3, 0])
      [[4, 0], [1, 1], [2, 2], [2, 3], [1, 0]]

  """
  def encode([[_head | _tail] | _rest] = xs), do: encode([], xs)
  def encode(xs), do: encode(xs |> pack) |> Enum.reverse()

  def encode(acc, [head | tail]),
    do: encode([[head |> Enum.count(), Enum.at(head, 0)] | acc], tail)

  def encode(acc, []), do: acc

  @doc """
  11 - Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

  ## examples

      iex> App.encode_modified([0, 0, 0, 0, 1, 2, 2, 3, 3, 0])
      [[4, 0], 1, [2, 2], [2, 3], 0]

  """

  def encode_modified([[_head | _tail] | _rest] = xs), do: encode_modified([], xs)
  def encode_modified(xs), do: encode_modified(xs |> pack) |> Enum.reverse()

  def encode_modified(acc, [[head] | tail]),
    do: encode_modified([head | acc], tail)

  def encode_modified(acc, [head | tail]),
    do: encode_modified([[head |> Enum.count(), Enum.at(head, 0)] | acc], tail)

  def encode_modified(acc, []), do: acc
end
