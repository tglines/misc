readline = require 'readline'

debug = true
dependencies = {}

depend = (args) ->
  if args.length > 1
    dependant = args.shift()
    dependencies[dependant] = args
    if debug
      console.log dependencies
  else
    console.log 'ERROR: DEPEND command takes at least 2 arguments'

install = (args) ->
  console.log 'command INSTALL'

remove = (args) ->
  console.log 'command REMOVE'

list = (args) ->
  console.log 'command LIST'

end = (args) ->
  process.exit()

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
  console.log line
  tokens = line.trim().split(/\s+/)
  command = tokens.shift()
  args = tokens
  if commands[command]
    commands[command](args)
  else
    console.log "ERROR: Command not recognized"
