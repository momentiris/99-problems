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

// 04 - Find the number of elements of a list.
// doesn't take undefined elements into account
export function length<T>(xs: Array<T>): number {
  function l<T>([x, ...xs]: Array<T>, n: number): number {
    if(x === undefined) return n
    return l(xs, n + 1)
  }  

 return l(xs, 0)
}

// 05 - Reverse a list.
export function reverse<T>(xs: Array<T>): Array<T> {
  function r<T>([x, ...xs]: Array<T>, acc: Array<T>): Array<T> {
    if(x === undefined) return acc 
    return r(xs, [x, ...acc])
  } 

  return r(xs, []) 
}
