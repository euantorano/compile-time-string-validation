# Compile Time String Validation

Companion repository for my blog post ["Compile Time String Validation"](https://www.euantorano.co.uk/posts/compile-time-string-validation/)

This repository contains code for a couple of implementations of a dummy `pledge` function (based upon the [`pledge(2)`](https://man.openbsd.org/pledge.2) system call in OpenBSD) that validates its arguments at compile time rather than run time.

The aim is to explore the compile time facilities of different languages.

## CI Status

| Language | Status |
| -------- | ------ |
| D | [![builds.sr.ht status](https://builds.sr.ht/~euantorano/compile-time-string-validation/commits/d.yml.svg)](https://builds.sr.ht/~euantorano/compile-time-string-validation/commits/d.yml?) |
| Nim | [![builds.sr.ht status](https://builds.sr.ht/~euantorano/compile-time-string-validation/commits/nim.yml.svg)](https://builds.sr.ht/~euantorano/compile-time-string-validation/commits/nim.yml?) |
| Zig | [![builds.sr.ht status](https://builds.sr.ht/~euantorano/compile-time-string-validation/commits/zig.yml.svg)](https://builds.sr.ht/~euantorano/compile-time-string-validation/commits/zig.yml?) |