# Contributing to FlycheckOrgVale:

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to FlycheckOrgVale.
These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Code of Conduct

This project and everyone participating in it is governed by the [FlycheckOrgVale Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [the admin](mailto:grant@wisdomandwonder.com).

## What should I know before I get started?

### FlycheckOrgVale and Packages

FlycheckOrgVale is a tiny open source project &mdash; it only uses one package.

FlycheckOrgVale is intentionally very simple. It connects [Org](https://orgmode.org/) with [Vale](https://vale.sh/) via
[FlyCheck](https://www.flycheck.org/en/latest/). Anything else belongs outside this package.

### Design Decisions

When we make a significant decision in how we maintain the project and what we can or cannot support, we will document it in the [Design Decisions](https://github.com/grettke/flycheck-org-vale/blob/main/DESIGN.org). If you have a question around how we do things, check to see if it is documented there. If it is *not* documented there, please open a [new feature request](https://github.com/grettke/flycheck-org-vale/issues/new/choose).

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for FlycheckOrgVale. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check [this list](https://github.com/grettke/flycheck-org-vale/issues) as you might find out that you don't need to create one. When you are creating a bug report, please fill out the template as best you can.  The information it asks for helps us resolve issues faster.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for FlycheckOrgVale, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](https://github.com/grettke/flycheck-org-vale/issues) as you might find out that you don't need to create one. When you are creating a enhancement request, please fill out the template as best you can.  The information it asks for helps us resolve issues faster.

### Your First Code Contribution

#### Local development

FlycheckOrgVale can be developed locally by cloning this repository.

### Pull Requests

The process described here has several goals:

- Maintain FlycheckOrgVale's quality
- Fix problems that are important to users
- Engage the community in working toward the best possible Atom
- Enable a sustainable system for FlycheckOrgVale's maintainers to review contributions

Please follow these steps to have your contribution considered by the maintainers:

1.The Emacs Lisp code should follow the [Emacs Lisp conventions](https://www.gnu.org/software/emacs/manual/html_node/elisp/Tips.html) and the [Emacs Lisp Style Guide](https://github.com/bbatsov/emacs-lisp-style-guide)
2. Pass [checkdoc](https://www.gnu.org/software/emacs/manual/html_node/elisp/Tips.html) and [package-lint](https://github.com/purcell/package-lint)
3. `byte-compile-file` either without errors or including them with explanation.
4. Documentation Spell and Grammar checking with [Vale](https://vale.sh/) for which this project is configured.

While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.
