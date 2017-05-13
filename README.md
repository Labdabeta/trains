# Train Kernel

## Styleguide

### Tabs

Due to different people's opinions of optimal tab width, this project will use
only expanded tab characters.

### Newlines

Only UNIX style end of lines will be used in this project.

### Braces

Predominantly K&R style. Only top level functions have braces on new lines.

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
