readline = require 'readline'

debug = false
dependencies = {}
installed = {}
indent = '   '

depend = (args) ->
  if args.length > 1
    dependant = args.shift()
    dependencies[dependant] = args
    if debug
      console.log dependencies
  else
    console.log 'ERROR: DEPEND command takes at least 2 arguments'

install = (args) ->
  if args.length is 1
    install_candidate = args[0]
    install_dependencies = dependencies[install_candidate]

    if install_dependencies
      for install_dependency in install_dependencies
        console.log indent + 'Installing ' + install_dependency
        installed[install_dependency] = true

    console.log indent + 'Installing ' + install_candidate
    installed[install_candidate] = true
  else  
    console.log 'ERROR: INSTALL command takes only 1 argument at a time'

remove = (args) ->
  console.log 'command REMOVE'

list = (args) ->
  if args.length is 0
    for install of installed
      console.log indent + install
  else
    console.log 'ERROR: LIST command takes no arguments'

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
