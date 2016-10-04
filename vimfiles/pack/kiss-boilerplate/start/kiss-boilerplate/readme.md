# KISS boilerplate

> Boilerplate insertion, made stupendously simple.

## Installation:

### Vim 8.0+ (with +packages)

Make directories for
`$VIM/vimfiles/pack/kiss-boilerplate/start/`

Then just `git clone https://github.com/9999years/kiss-boilerplate.vim.git` and
you’re done!

### Vim 7.x (or below, maybe)

Copy the files in this repo straight into `$VIM/vimfiles` maybe? I hear people
talk about Vundle a lot, maybe that works. I have no clue, honestly. Godspeed.

## How It Works

A function (`InsertBoilerplate(...)`) and matching Ex-mode command are defined,
and an `autocmd` is registered for `BufNewFile` so that `InsertBoilerplate` is
called on any new files. The command uses the current filetype (or, if supplied,
an argument for a filetype) to find a matching boiler.ft file in `boilerplate/`,
which it then appends to the current buffer with `execute '0read'`.

It amounts to a measly but sufficient 18 lines of code.

## What’s Next

Currently, boilerplate files only exist for TeX, C, CSS, HTML, and Vimscript.
I’d like to expand that — send any boilerplate files you’d like to see my way,
or open a pull request!
