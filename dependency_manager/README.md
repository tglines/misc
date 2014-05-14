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

Didn't get recursive dependency removal exactly right as you can see by the varied output.
This happens because the two way index method I use to maintain the tree doesnt get fully updated
and it thinks it still needs TCPIP.  Given a bit more time I'd throw a fix in the remove_dependencies method for this.

Also I'd clean up the code a bit, and put the input/output expectations in test coverage

All commands echo themselves when entered, only INSTALL/REMOVE/LIST have other output.

Note all input/output done via stdin/stdout


