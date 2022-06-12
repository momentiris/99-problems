defmodule AppTest do
  use ExUnit.Case
  doctest App

  test "01 - Find the last element of a list." do
    assert App.last([]) == nil

    assert App.last([0]) == 0

    assert App.last([0, 1, 2]) == 2
  end

  test "02 - Find the last but one element of a list." do
    assert App.butLast([]) == nil

    assert App.butLast([0]) == nil

    assert App.butLast([0, 1, 2]) == 1
  end

  test "03 - Find the K'th element of a list. The first element in the list is number 1." do
    assert App.at([], 3) == nil

    assert App.at([0], 1) == 0

    assert App.at([0, 1, 2], 3) == 2
  end
end
