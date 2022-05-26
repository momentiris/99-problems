import { last, butLast, at } from '.'

describe('01 - Find the last element of a list.', () => {
  it('works', () => {
    const cases = [[], [0], [0, 1]]
    const result = cases.flatMap(last)

    expect(result).toEqual([undefined, 0, 1])
  })
})

describe('02 - Find the last but one element of a list.', () => {
  it('works', () => {
    const cases = [[], [0], [0, 1], [0, 1, 2]]
    const result = cases.flatMap(butLast)

    expect(result).toEqual([undefined, undefined, 0, 1])
  })
})

describe('03 - Find the K:th element of a list.', () => {
  it('works', () => {
    const cases: Array<[Array<number>, number]> = [
      [[], 1],
      [[0], 2],
      [[0, 1], 1],
      [[0, 1, 2], 3],
    ]

    const result = cases.flatMap(([xs, k]) => at(xs, k))

    expect(result).toEqual([undefined, undefined, 0, 2])
  })
})
