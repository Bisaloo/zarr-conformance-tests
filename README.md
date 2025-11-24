# Zarr conformance tests

<!-- badges: start -->
![lifecycle: experimental](https://raw.githubusercontent.com/r-lib/lifecycle/90d60c06e43d1a5389ed4323b7a7dbeb654854ae/man/figures/lifecycle-experimental.svg)
<!-- badges: end -->

This repository contains a suite of conformance tests for Zarr implementations.
The tests are designed to ensure that different Zarr libraries and tools adhere
to the Zarr specification.

**This is only a proof of concept at this stage.**
**Please see the roadmap issue to learn what is needed to make this usable in practice.**

## Design considerations

### Requirements

- It should be possible for each individual tool to run the conformance tests in
  their own continuous integration check suite.
- This repository should provide infrastructure that is independent of any
  particular Zarr implementation. It should be future-proof in the sense that
  any new Zarr implementation should be able to use it without requiring changes
  in this repository.

### Consequences

- The tests are run on a minimal CLI interface provided by each implementation.
- A reusable GitHub Action installing only the testing framework and running the
  tests is provided. Each individual implementation is responsible for creating
  a custom GitHub Actions workflow that uses:
  - installs their tools and its dependencies
  - provides the CLI interface path as the `zarr-cli` input in the GitHub Action
  - runs the GitHub Action defined in this repository

## Repository structure

```
.
├── README.md
├── action.yml      # GitHub Action to be used in CI workflows of Zarr implementations
├── data/           # Test data files used in the tests
└── tests.sh        # Definition of the tests and expectations, using the bats framework
```

## Usage

1. Create a minimal CLI wrapper around your implementation defining the
   following actions/verbs:
   - TBD
2. Create the following GitHub Actions workflow file in your Zarr implementation
   repository:

```yaml
name: Zarr Conformance Tests
on:
  workflow_dispatch:
  schedule:
    - cron: '17 3 * * 0'

jobs:
  conformance-tests:
    runs-on: ubuntu-latest
    env:
      GITHUB_PAT: ${{ secrets.GITHUB_TOKEN }}
    steps:
      - uses: actions/checkout@v5

      - name: Install implementation and its dependencies
      # Customize this step to install the tool being tested

      - uses: Bisaloo/zarr-conformance-tests@main
        with:
          zarr-cli: # Provide the path to the CLI wrapper for your implementation
```

## Examples

Live examples of the conformance tests being run against an actual
implementation can be found in the following repositories:

- [Rarr R implementation](https://github.com/Bisaloo/Rarr-cli)
- [Zarr python implementation (unofficial minimal CLI wrapper around the official lib)](https://github.com/Bisaloo/zarr-python-cli)
