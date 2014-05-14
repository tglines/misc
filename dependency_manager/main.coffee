readline = require 'readline'

depend = ->
  console.log 'command DEPEND'

install = ->
  console.log 'command INSTALL'

remove = ->
  console.log 'command REMOVE'

list = ->
  console.log 'command LIST'

end = ->
  console.log 'command END'

# COMMAND --> action
commands =
  DEPEND: depend
  INSTALL: install
  REMOVE: remove
  LIST: list
  END: end

rl = readline.createInterface
  input: process.stdin,
  output: process.stdout

rl.on 'line', (line) ->
  tokens = line.trim().split(/\s+/)
  console.log tokens
