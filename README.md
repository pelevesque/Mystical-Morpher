# Mystical Morpher

## Synopsis

```sh
raku main.raku --num-frames=10 source.txt
```

## About

It's not magical, but it's mystical. Following in the great mystic
traditions, Mystical Morpher is all about the journey, not the
destination. You provide the birth and death points, and it generates
the life that ties them together. Are you ready to unveil the hidden
frames between two seemingly unrelated objects? With Mystical Morpher,
a chicken can become an egg, an old man rejuvenated into an active young
boy, and a mother-in-law transformed into a harmless docile cat. Pick
two vector graphics and let Mystical Morpher do the rest! Patent pending,
copyright as of 2024, all rights reserved unless stated otherwise.
Donations through Patreon and Github.

## Usage

Provide a text source file which contains a template with numbers for
the first frame, a divider ```-----```, then the same template with
numbers for the last frame.

A template can be anything, so long as it contains numbers, and that
the templates for the first and last frame contain the same amount
of numbers.

Mystical Morpher will create intermediary frames to reach the total
number of frames specified.

See ```source.txt``` for an example of a source.txt.

## Resource

To make sure your first and last frames use the same format, it might
be necessary to convert their paths to all absolute or all relative
commands. The program below does that.

https://lea.verou.me/blog/2019/05/utility-convert-svg-path-to-all-relative-or-all-absolute-commands/

## License
MIT\
copyright 2024 Pierre-Emmanuel Lévesque
