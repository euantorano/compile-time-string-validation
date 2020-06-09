from strutils import split, parseEnum

type Promises = enum
  stdio,
  rpath,
  wpath,
  cpath,
  dpath

proc validatePromises(promises: string): bool =
  result = true

  for s in promises.split(' '):
    try:
      discard parseEnum[Promises](s)
    except ValueError:
      return false

proc promise(promises: static[string]): void =
  static: doAssert(validatePromises(promises), "invalid promises: " & promises)

  echo "valid promises: ", promises

when isMainModule:
  when defined(invalidPromises):
    promise "stdio foobar"
  else:
    promise "stdio rpath wpath"