# clojure-autodoc
This Github Action will generate clojure documentation from source directory recursively.

nspired by the works of [Tom FaulHaber](https://tomfaulhaber.github.io/autodoc/)

P.S Created this as a way to learn GH-Actions.

## Inputs:

### source-path 
- Optional, Path of Clojure/Script Code Directory
- Default ```./src```

### working-directory
- Optional, Path of working directory to change before running autodoc
- Default ```.```

## Usage 

### Usage - Basic
```
uses: aseemchopra25/clojure-autodoc@main

```
### Usage - Source Path and Working Directory
```
uses: aseemchopra25/clojure-autodoc@main
with:
    source-path: ./cljs
    working-directory: .
```

### Usage - Exporting and Archiving CLJS Documentation on Pull Request at custom directory

```
name: CLJ Documentation

on:
  pull_request:
    branches: [ master ]
  push:
    branches: [ master ]
    paths:
      - 'cljs/**'

jobs: 
  build-documentation:
    runs-on: ubuntu-latest

    steps:
     - uses: actions/checkout@v2
     - name: Generate AutoDocs for CLJ(S)
       uses: aseemchopra25/clojure-autodoc@main
       with:
          source-path: ./cljs
          working-directory: .
    
     - name: Archive documentation
       uses: actions/upload-artifact@v2
       with:
        name: cljs-documentation
        path: |
          autodoc/*

```

### Feel free to raise an issue or Issue a PR :D