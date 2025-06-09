<!-- @format -->

# Github Runner Synology Package

## Description

This package allows you to run GitHub Actions on your Synology NAS. It uses the [myoung34/github-runner](https://github.com/myoung34/docker-github-actions-runner) GitHub Runner Docker image to execute workflows.

## Installation

1. Download the package from the [Releases](https://github.com/tomgrv/github-runner-synology/releases) page.

2. Open the Synology Package Center.

3. Click on "Manual Install" and select the downloaded `.spk` file.

4. Follow the installation instructions.

**The package will go in error state initially, but this is expected as it needs to be elevated to run properly.**

5. Elevate the package by following the instructions from the [Synology Package Builder](https://github.com/tomgrv/synology-package-builder/blob/main/doc/elevated.md)

6. After elevation, the package will:
    - Download the docker image (takes a while, you shoud receive a notification from Container Manager when done)
    - Create a Docker container in the Container Manager. This container will be read-only and named `github-runner`
    - Behave as a regular Package, allowing you to start/stop it from the Package Center.

## Credits

This package is based on the work of [myoung34](https://github.com/myoung34)

This package was created using the [Synology Package Builder Github Action](https://github.com/marketplace/actions/synology-package-builder-github-action).

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

This work is not affiliated with Synology Inc. in any way. It is an independent project that aims to facilitate the development of Synology packages using GitHub Actions. It is not an official Synology product and does not have any official support from Synology Inc. Use at your own risk.
