# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilize semantic versioning for tagging.

[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, e.g. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install The Terraform CLI

#### Linux Version Check

This project is being developed on Ubuntu. It is important to for development that everyone is running a compatible version of Linux in their develop environment (Ubuntu/Debian Distros). To check please type the following into your terminal:

```
cat /etc/os-release
```

Which should output something similar to:

```
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

[Check Linux Version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

#### Considerations with the Terraform CLI changes
The Terrafor CLI install method has changed due deprecation of old gpg keyring format. A bash script was created to conform to new install standards from Hashicorp; yaml will now run new bash install file on startup.

This bash file is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod/yml)) tidy
- Make future changes to install bash easier and cleaner
- Allow for easier debug

[Terraform Install Documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

#### Shebang (#!)

The #! dictates what kind of interpreter or shell is used when the file is executed. `#!/usr/bin/env bash` was added to the starting line of [./bin/install_terraform_cli](./bin/install_terraform_cli) to have it run as a Bash file.

[#! Shebang (SHA-bang) Info](https://en.wikipedia.org/wiki/Shebang_(Unix))

#### CHMOD

CHMOD is used to change access permissions and special mode flags. This was run in our terminal to make our bash script accessable to our .yaml file.

Example:

```sh
chmod u+x ./bin/install_terraform_cli
```

Alternativley:

```sh
chmod 777 ./bin/install_terraform_cli
```

[CHMOD info](https://en.wikipedia.org/wiki/Chmod)

### Gitpod Life Cycle

It is also important to note how Gitpod life cycles operate. In our case we needed to adjust how the we ran the startup for our Terraform CLI install. Init will not run again in a workspace that has already been started, instead it was changed to use the `before` tag to run every time.   

Also, please remember to stop workspaces before closing the browser window, as your worspace will needlessly run for 30 minutes up to 24 hours depending on settings.

[Gitpod Life Cycle](https://www.gitpod.io/docs/configure/workspaces/workspace-lifecycle)
