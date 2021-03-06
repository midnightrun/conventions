# C++

## Formatter

Format with [clang-format](https://clang.llvm.org/docs/ClangFormat.html)
using following style configuration specified in `<project_directory>/.clang-format`.

```
BasedOnStyle: Chromium
ColumnLimit: 120
```

Run: `clang-format -style=file -i [<file> ...]`

## Linter

Lint with [clang-tidy](https://clang.llvm.org/extra/clang-tidy/) using
the default config.

- [ ] Add more clang-tidy checkers (`cppcoreguidelines-*`, `modernize-*`, etc)
- [ ] LLVM sanitizers (e.g. {Thread,Address,Memory}Sanitizer)

## Style guide

Look to the [C++ Core
Guidelines](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md).
