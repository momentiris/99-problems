export function last<T>([x, ...xs]: Array<T>): T | undefined {
  if (xs.length === 0) return x;

  return last(xs);
}

export function butLast<T>([x, ...xs]: Array<T>): T | undefined {
  if (x === undefined) return undefined;
  if (xs.length === 1) return x;

  return butLast(xs);
}

export function at<T>([x, ...xs]: Array<T>, k: number): T | undefined {
  if (x !== undefined && k === 1) return x;
  if (xs && k > 1) return at(xs, k - 1);

  return undefined;
}

export function length<T>(xs: Array<T>): number {
  return xs.reduce((acc) => acc + 1, 0);
}

export function reverse<T>(xs: Array<T>): Array<T> {
  function r<T>([x, ...xs]: Array<T>, acc: Array<T>): Array<T> {
    if (x === undefined) return acc;
    return r(xs, [x, ...acc]);
  }

  return r(xs, []);
}

export function isPalindrome(xs: string | Array<string | number>): boolean {
  const norm = [...xs];
  return norm.join('') === norm.reverse().join('');
}

export function flatten<T>(xs: Array<T>): Array<T> {
  return xs.reduce(
    (acc: Array<T>, cur: T) =>
      acc.concat(Array.isArray(cur) ? flatten(cur) : cur),
    []
  );
}

export function compress<T extends string>(xs: Array<T>): Array<T> {
  const isConsecutiveDuplicate = <T>(x: T, idx: number, xs: Array<T>) =>
    idx === 0 || x !== xs[idx - 1];

  return xs.filter(isConsecutiveDuplicate);
}
