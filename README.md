Hey. Half vibe-coded, half have written myself. This is a CLI-utility to convert your Obsdidian vault to a bunch of static html files.
WARNING:
- I'm not claiming compatability with any Markdown standart
- My goal is first of all make a utility I use myself for my own vault
- Development is still going on, though it may suddenly be finished (when my vaulted will be converted to HTML properly)
- I'm open to code review and contribution

To compile, download the code and run:
```sh
sbcl (or your implementation)
(asdf:make :websidian)
```

You have to get the Deploy library into your local-projects of Quicklisp and install some dependecies before compilation (i think it's patchelf on Linux and some random .dll on Windows. Deploy will tell you what to install).

To use it, open your shell and run:
```
./websidian "name-of-note.md" "THE-SAME-NAME-AS-NOTE.html" "style.css" 
```

Last one is optional, the utility bakes css into html. I personally recommend [Sakura CSS](https://github.com/oxalorg/sakura).

It's more useful in script, something like:

```sh
#!/bin/bash

find . -maxdepth 1 -name "*.md" -print0 | while read -d $'\0' file; do
    clean_file=${file#./}
    output_file="${clean_file%.md}.html"
    
    echo "Processing: $clean_file -> $output_file"
    ./websidian "$clean_file" "$output_file" "style.css"
done
```

It'll work if you put all your files into one directory (also the pics).

If you somehow found this helpful, enjoy.

Project structure:

1. predicates.lisp contains predicates used in project
2. inline-walker.lisp contains a huge walker function that converts elements that are not blocks
3. block-walker.lisp contains a huge walker function that converts elements that are blocks into AST
4. renderer-ast.lisp contains a huge walker function that converts AST into HTML
5. functions.lisp contains functions that are hanging in the air (mostly block proccessing stuff)
6. main.lisp contains a main function
7. package.lisp declares a package :websidian
8. websidian.asd contains an asdf system definition
