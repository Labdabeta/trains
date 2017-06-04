# Train Kernel

## Instructions

To build the kernel merely clone the repository and run `make` (or `make prod`
for `-O2` optimization, or `make small` for `-Os` optimization). This will
produce a file called "kernel.elf" in the base directory. This file can be
copied to the scp server and loaded on the RedBoot machines by issuing the
command `load -b 0x100000 -h 10.15.167.5 "ARM/path/to/kernel.elf"`. This should
run the kernel and produce the desired output.

## Styleguide

### Tabs

Due to different people's opinions of optimal tab width, this project will use
only unexpanded tab characters.

### Newlines

Only UNIX style end of lines will be used in this project.

The maximum line length shall be 80 characters. Any line longer should be broken
up and thoroughly rethought.

### Braces

We use Linux Kernel brace style. This is predominantly the K&R style, however
top level functions have braces on new lines. Basically it boils down to things
that can be nested have the brace on the same line, while things that cannot get
the brace on a new line.

Example source:

```c
int main(int argc, char *argv[])
{
	if (argc > 1) {
		/* ... */
	}
}
```

### Comments

Both c99 and c89 comments may be used. In order to comment-out blocks of code
the `#if 0` idiom will be used as it is respected by most editors.

Examples:

```c
int x; /* ok */
int y; // ok
/*
int bad; -- not ok
*/
#if 0
int bad; /* ok */
#endif
```

Excessive comments should be avoided, preferring self documenting code when
possible.

Multiline comments should be balanced in all cases. This means if divided
vertically in half, there should be the same number of comment-only lines and
comment+text lines in a comment. See https://lkml.org/lkml/2016/7/8/625 for details. For example:

```c
/* This
 * is just bad!
 */

/*
 * and this isn't better. */

/*
* while this is still wrong.
*/

/*
 * But this is ok.
 */
```

### C99

C99 is strictly forbidden. Only c99 comments may be used. Compilation will be
done using c89 mode on the compiler, but to support c99 comments it will not be
set to be pedantic.

### Header Guards

Header guards are to be used instead of `#pragma once` to allow for
header/source splitting during testing if necessary.

### Naming

Variable names should be terse in all logical code in order to fit the most
logical operation on one screen. However any global symbol shall have a full
descriptive name such that its contents can be understood without a comment.

Constants should always be in FULL\_UPPERCASE.

### Typedefs

If a struct's members are to be directly accessed, then it should be passed
transparently as a `struct StructType`. However if the struct is to be used
opaquely, then it should be passed as a `ST` typedef.

### Functions

A function shall be at most 7-20-10. That means a maximum of 7 lines of variable
declarations and precondition checks, 20 lines of body code, and 10 lines of
cleanup code. A maximum of 7 local variables is enforced (relating to the
short-term memory limit of the human brains working on the project). Helper
functions should not be avoided, as they can be easily optimized by the
compiler.

The goto fail idiom is encouraged to help clean code.

### General Guidelines

 - Readibility shall be placed above all else.

This means, for example, that yoda conditions are forbidden. While they may
prevent bugs when `==` is accidentally replaced with `=`, it detracts from
legibility.

 - Code design is more important than the style of the code itself.

Keeping modules highly cohesive and lowly coupled to each other is more
important than having pretty code in the module definitions.

 - Module interfaces should be heavily commented.

While code internal to a module can be self documenting, as we are not working
in Ada, we must use comments to describe the interfaces of our modules.

 - The linux kernel has experience.

When wondering about what works and what doesn't feel free to consult the linux
kernel's styleguide:
https://www.kernel.org/doc/html/v4.10/process/coding-style.html

The developers of the linux kernel have much more experience than anybody on
this team.

## Git Etiquette

This project uses a development branch for active development. In addition users
shall work on their own branches making frequent small commits before pushing a
single coherent commit with a message body to the development branch. When a
deadline looms, or a major version is completed, the development branch will be
merged back onto the master branch.
