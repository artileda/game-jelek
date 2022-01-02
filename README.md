# Godot-Nim project

This code is obtained by following this video tutorial : [Advance Godot : Integrating Nim with Godot](https://youtu.be/WdL-doqxXyo). 

The full original source : [godot-nim-stub](https://github.com/pragmagic/godot-nim-stub), this just
modified version empty project for ease to scaffold godot-nim project.

## How to use this ?

- Use this repository as template and clone your template repo to your local machine
- If you haven't install `nake` make sure install it first by running : `nimble install nake`
- Set this environment variabel in your local machine:
	- `export PATH="~/.nimble/bin":$PATH"`, this for make sure you can call nimbel binary packages
	- `GODOT_BIN`, set this variable value with your GODOT program path
- To clear this template git information, delete the `.git` folder. 


## How to use this to existing Godot Project

- Copy `nakefile.nim`, `nakefile.nim.cfg`, `nimlib.gdnlib`, and `src` folder to your godot project.
- Then `nake build` in your godot project directory.
- Attach script, select `Native Script` and make the script class name and node same as Nim class and it heritance, for example `UwU Node2d` then Nim class should inherit `Node2d` and named `UwU`.
- Load script native libarary, `nimlib.gdnlib`.
- then run.

## LICENSE

- The full original source is license under MIT by Xored Software, Inc.

- Template is Unlicense License.
