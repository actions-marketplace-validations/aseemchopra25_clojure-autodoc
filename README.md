# Clojure-Autodoc Action
This Github Action will generate documentation from Clojure source directory recursively.

## Inputs:

### source-path 
- Optional, Path of Clojure Code Directory
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
    source-path: ./clj
    working-directory: .
```

### Usage - Exporting and Archiving CLJ Documentation on Pull Request at custom directory

```
name: CLJ Documentation

on:
  pull_request:
    branches: [ master ]
  push:
    branches: [ master ]
    paths:
      - 'clj/**'

jobs: 
  build-documentation:
    runs-on: ubuntu-latest

    steps:
     - uses: actions/checkout@v2
     - name: Generate AutoDocs for CLJ(S)
       uses: aseemchopra25/clojure-autodoc@main
       with:
          source-path: ./clj
          working-directory: .
    
     - name: Archive documentation
       uses: actions/upload-artifact@v2
       with:
        name: clj-documentation
        path: |
          autodoc/*

```

## Contributing
1. Fork the project
2. Create your feature branch ```git checkout -b feature/awesomefeature```
3. Commit your changes ```git commit -m "added some awesome features"```
4. Push to the branch ```git push origin feature/awesomefeature```
5. Open a Pull Request

## Acknowledgements
Based on Tom Faulhaber's software [autodoc](https://github.com/tomfaulhaber/autodoc) 
### Feel free to raise an issue or Issue a PR :D