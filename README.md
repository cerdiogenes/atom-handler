atom-handler
============

Setup and handle atom:// protocol to open them in Atom on Linux system


## Install

```
bash ./install.sh
```

## Use with firefox

* Open Firefox
* Browse atom://<path_to_your_file>
* Select atom-handler and check "Remember my choice for atom links."

## Use with XDG

```
xdg-open atom://<path_to_your_file>
```

## Open at a given line and column

Atom can open at a given line and column by suffixing the URI with :line or :line:column

```
xdg-open atom://<path_to_your_file>:<line_number>:<column_number>
```
