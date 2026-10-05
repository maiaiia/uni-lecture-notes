---
Class: "[[LFTC]]"
date: 2026-10-05
type:
---
# LAB1-DSL


PkgInstall
This DSL is a minimal language tailored for orchestrating package installation on a linux environment. A script describes which packages should be installed, optionally depending on what the user answers. 

Every script must have the same format, i.e. it must consist of 3 separate stages:
- setup: Declare variables, set up package lists, and ask the user questions
- install: Install the packages
- finish: Report results

There are 2 data types: a string (simple data type) and a list (user-defined).

Control flow


**Package Installer DSL**

This DSL is a minimal language tailored for orchestrating package installation on a linux environment. A script describes which packages should be installed, optionally depending on what the user answers. Every script is organised into three fixed stages that run in order: `setup`, `install` and `finish`, each closed with `end`. The language works with just two types: `string` for text such as a package name or a user answer, and `list` for an ordered collection of strings such as a group of packages (`var tools : list`). Values are stored with assignment (`tools = ["git", "curl"]`) and combined with `+`, which concatenates strings and joins lists (`"Installing " + p`, `tools + ["vim"]`). The core domain action is `add`, which installs the package named by an expression (`add "git"`).

Control flow is explicit and uses `end` delimiters. An `if ... then ... end` block, with an optional `else`, runs statements only when a comparison holds, using == or `!=` on strings (`if answer == "yes" then ... end`). A `for x in list do ... end` loop visits each package in a list, so a whole group can be installed, confirmed or reported on without writing one statement per package. Input is read with `read` answer, which lets the installer ask the user a question during `setup`, and messages are shown with `print`. Variables are global, so an answer collected in `setup` can be used in `install` and `finish`.

The language is designed to be easy to read and write: one statement per line, only one loop form, no functions and no numbers, and clear keywords (`var`, `read`, `print`, `add`, `if`, `for`, `end`). The three fixed stages make every script look the same, which suits an installer's natural phases of gathering information, doing the work and wrapping up. It strikes a balance between being declarative, where you list which packages you want, and imperative, where you control the order and decide what to install based on the user's choices. This makes it approachable for developers and domain experts who want to write simple installer scripts.

