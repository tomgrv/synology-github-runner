<!-- @format -->

# Github Runner Synology Package

## Description

This package allows you to run GitHub Actions on your Synology NAS. It uses the [myoung34/github-runner](https://github.com/myoung34/docker-github-actions-runner) GitHub Runner Docker image to execute workflows.

## Installation

1. Download the package from the [Releases](https://github.com/tomgrv/synology-github-runner/releases) page.

2. Open the Synology Package Center.

3. Click on "Manual Install" and select the downloaded `.spk` file.

4. Follow the installation instructions.

**The package installs cleanly but stays stopped: DSM 7 does not allow unsigned packages to manage Docker containers, so it needs a one-time approval to run.**

5. Approve the package from a root shell (SSH):

    ```bash
    sudo /var/packages/GithubRunner/scripts/elevate
    ```

    The command shows exactly what it is approving (image, container name, privileged mode, volume bindings) before doing anything. It then installs a root-owned broker restricted to managing this package's container — the package itself keeps running as its unprivileged user. See the [elevation documentation](https://github.com/tomgrv/synology-package-builder/blob/main/doc/elevated.md) for the full security model.

6. After approval, the package will:
    - Download the docker image (takes a while)
    - Create a Docker container in the Container Manager, named `github-runner`
    - Behave as a regular package, allowing you to start/stop it from the Package Center.

The approval survives package upgrades. When an upgrade ships a new runner image, the package asks you to re-run the command above to review and approve the change. Uninstalling the package removes the container and revokes the approval entirely.

## Security notes

- The runner container mounts the Docker socket, which is equivalent to root access on the NAS: only register it against an organisation or repositories you trust, and prefer a fine-grained token restricted to runner registration.
- The access token is only used to register the runner; it is stored in the package home and in the approved container profile, both readable by root and the package user only.

## Credits

This package is based on the work of [myoung34](https://github.com/myoung34)

This package was created using the [Synology Package Builder Github Action](https://github.com/marketplace/actions/synology-package-builder-github-action).

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

This work is not affiliated with Synology Inc. in any way. It is an independent project that aims to facilitate the development of Synology packages using GitHub Actions. It is not an official Synology product and does not have any official support from Synology Inc. Use at your own risk.
