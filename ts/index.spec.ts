import {
  last,
  butLast,
  at,
  length,
  reverse,
  isPalindrome,
  flatten,
  compress,
} from '.';

describe('01 - Find the last element of a list.', () => {
  it('works', () => {
    const cases = [[], [0], [0, 1]];
    const result = cases.flatMap(last);

    expect(result).toEqual([undefined, 0, 1]);
  });
});

describe('02 - Find the last but one element of a list.', () => {
  it('works', () => {
    const cases = [[], [0], [0, 1], [0, 1, 2]];
    const result = cases.flatMap(butLast);

    expect(result).toEqual([undefined, undefined, 0, 1]);
  });
});

describe('03 - Find the K:th element of a list.', () => {
  it('works', () => {
    const cases: Array<[Array<number>, number]> = [
      [[], 1],
      [[0], 2],
      [[0, 1], 1],
      [[0, 1, 2], 3],
    ];

    const result = cases.flatMap(([xs, k]) => at(xs, k));

    expect(result).toEqual([undefined, undefined, 0, 2]);
  });
});

describe('04 - Find the number of elements of a list.', () => {
  it('works', () => {
    const cases: Array<Array<number | undefined>> = [
      [],
      [undefined],
      [0],
      [0, 1, 2],
    ];

    const assert = (xs: Array<number | undefined>) =>
      expect(length(xs)).toEqual(xs.length);
    cases.forEach(assert);
  });
});

describe('05 - Reverse a list.', () => {
  it('works', () => {
    const cases: Array<Array<number>> = [[], [0], [0, 1], [0, 1, 2]];

    const assert = (xs: Array<number>) =>
      expect(reverse(xs)).toEqual(xs.reverse());
    cases.forEach(assert);
  });
});

describe('06 - Find out whether a list is a palindrome.', () => {
  it('works', () => {
    const cases = [[0, 1, 2], 'sirapiparis', [0, 1, 0]];
    const result = cases.map((c) => isPalindrome(c));
    expect(result).toEqual([false, true, true]);
  });
});

describe('06 - Find out whether a list is a palindrome.', () => {
  it('works', () => {
    const cases = [[0, 1, 2], 'sirapiparis', [0, 1, 0]];
    const result = cases.map((c) => isPalindrome(c));
    expect(result).toEqual([false, true, true]);
  });
});

describe('07 - Flatten a nested list structure.', () => {
  it('works', () => {
    const a = [0, 1, 2];
    const b = [3, 4, 5];
    const c = [a, b];

    expect(flatten(c)).toEqual(c.flat());
  });
});

describe('08 - Eliminate consecutive duplicates of list elements.', () => {
  it('works', () => {
    const input = [
      'a',
      'a',
      'a',
      'a',
      'b',
      'c',
      'c',
      'a',
      'a',
      'd',
      'e',
      'e',
      'e',
      'e',
    ];

    const expected = ['a', 'b', 'c', 'a', 'd', 'e'];

    expect(compress(input)).toEqual(expected);
  });
});
