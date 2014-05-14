Sample dependency manager
-------------------------

To Run:
```
coffee main.coffee < input.txt > out.txt    ... for stdin/stdout io redirection style
./run.sh                                    ... shortcut to run the above
coffee main.coffee                          ... for interactive mode
```

Steps:
```
1. Install/compile latest node.js + coffeescript
2. Implement command processing in a nice way with sanity checks
3. Implement each commands behavior
```

Available Commands:
```
1. DEPEND item1 item2 ...
2. INSTALL item1
3. REMOVE item1
4. LIST
```

Gotchas:
```
1. Google Docs processes the word doc with a 3 space indent, assuming this is correct
```

All commands echo themselves when entered, only INSTALL/REMOVE/LIST have other output.

Note all input/output done via stdin/stdout


