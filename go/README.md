# Go

## Formatter

Format with `goimports`.

## Linter

Lint with:

- `errcheck -blank -ignoretests ./...`
- `go vet ./...`
- `go test -race ./...`

Fix all reported issues before submitting a PR.

- [ ] **TODO:** create a config for [gometalinter][gometalinter], and use that instead of individual linters

## Style guide

Follow the following style and best practice guides in descending order of
importance:

- [Effective go](https://golang.org/doc/effective_go.html)
- [Code review comments](https://github.com/golang/go/wiki/codereviewcomments)
- [Go best practices, six years in](http://peter.bourgon.org/go-best-practices-2016/)
- [Go best practices for production environments](http://peter.bourgon.org/go-in-production/)

## Naming conventions

Follow [Andrew Gerrand's naming
conventions](https://talks.golang.org/2014/names.slide).

The naming conventions favor short names, but also:

- Think about context
- Use your judgment

Remember to optimize for readability and ease of understanding. Do not
optimize for brevity.

## Directory layout

Follow [Standard Go Project Layout](https://github.com/golang-standards/project-layout).

## Additions

### Max 120 characters per line

The `gofmt` tool does not enforce line length.

For readability's sake, especially for GitHub code reviews, we aim to keep
our lines below 120 characters.

### Avoid package-level globals

Global variables lead to code that is harder to reason about, harder to
test, and it makes an API implicitly non-thread safe.

More context:

- [Theory of modern Go](https://peter.bourgon.org/blog/2017/06/09/theory-of-modern-go.html)
- [Go without package-scoped variables](https://dave.cheney.net/2017/06/11/go-without-package-scoped-variables)

> Why are package scoped variables bad? Putting aside the problem of
> globally visible mutable state in a heavily concurrent language, package
> scoped variables are fundamentally singletons, used to smuggle state
> between unrelated concerns, encourage tight coupling and makes the code
> that relies on them hard to test.

### Imports

Group imports into two groups: standard library imports and
non-standard-library code.

Note that `goimports` will not remove single newlines between imports
for us, since it cannot decide if the newline is placed there
deliberately to separate the imports into two sematically different
groups or if it is placed there accidentally.

#### Example

```go
// good
import (
        stdlib-pkg1
        stdlib-pkg2
        stdlib-pkg3
        company-pkg1

        thirdpartylib-pkg1
        thirdpartylib-pkg2
)

// bad (standard library imports are not all in the same group)
import (
        stdlib-pkg1
        stdlib-pkg2

        stdlib-pkg3

        company-pkg1
        thirdpartylib-pkg1
        thirdpartylib-pkg2
)
```

[gometalinter]: https://github.com/alecthomas/gometalinter
[effective-go]: https://golang.org/doc/effective_go.html
[naming-conventions]: https://talks.golang.org/2014/names.slide#1
