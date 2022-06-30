# Contributing

Thanks for contributing to this repository!

This repository follows the following conventions:

* [Semantic Versioning](https://semver.org/)
* [Keep a Changelog](https://keepachangelog.com/)
* [Conventional Commits](https://www.conventionalcommits.org/)

Development requires the Kubernetes CLI tool as well as a Kubernetes cluster.

To contribute a change:

1. Create a feature branch fork from the main branch
1. Make the changes in code.
1. Test by deploying [Big Bang](https://repo1.dso.mil/platform-one/big-bang/bigbang) to your Kubernetes cluster.
1. Make commits using the [Conventional Commits](https://www.conventionalcommits.org/) format. This helps with automation for changelog. Update `CHANGELOG.md` in the same commit using the [Keep a Changelog](https://keepachangelog.com).
1. Ensure all new commits from the `main` branch are rebased into your branch.
1. Open a merge request. If this merge request is solving a preexisting issue, add the issue reference into the description of the MR.
1. Wait for an approval.
1. Once approval is given, merge the code.
