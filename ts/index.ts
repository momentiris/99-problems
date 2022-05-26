// 01 - Find the last element of a list.
export function last<T>([x, ...xs]: Array<T>): T | undefined {
  if (xs.length === 0) return x

  return last(xs)
}

// 02 - Find the last but one element of a list.
export function butLast<T>([x, ...xs]: Array<T>): T | undefined {
  if (x === undefined) return undefined
  if (xs.length === 1) return x

  return butLast(xs)
}

// 03 - Find the K:th element of a list.
export function at<T>([x, ...xs]: Array<T>, k: number): T | undefined {
  if (x !== undefined && k === 1) return x
  if (xs && k > 1) return at(xs, k-1)

  return undefined
}
