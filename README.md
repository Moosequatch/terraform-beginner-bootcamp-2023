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


### Working with Env Vars

We can list out all Environment Variable using the ```env``` command.

We can list specific Env Vars using ```grep``` eg: ```env | grep AWS```

#### Setting and Unsetting Env Vars

Using the terminal we can:

set Env Vars:
```export HELLO='world'```

and unset Env Vars:
```unset HELLO```

We can also temporarily set an Env Var using:

```sh
HELLO='world' ./bin/print_message
```

We can also set up an Env Var within a bash script without the use of export:
```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print Vars using `echo`, eg:

```sh
echo $HELLO
```
#### Scoping of Env Vars

When you open up a new bash terminal in VScode it will not be aware of ENV VARS you have set in another window.

If you want envars to exist across all future bash terminals, you'll need to set them using a bash profile. eg `.bash_profile`

#### Persisting Env Vars

We can persist env vars by storing them in Gitpod's "secret storage".

```
gp env HELLO='world'
```

All future workspace launched will set the env vars for all bash terminals opened in these workspaces.

You can also set envars in the ``.gitpod/yaml``

#### Installing AWS CLI env
[Getting Started Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```

If it is succesful you should see a JSON payload return like this:

```json
{
    "UserId": "AIFAR76ZBLERPCPZOGGNO",
    "Account": "137358465973",
    "Arn": "arn:aws:iam::12356789421:user/terraform-bootcamp-example"
}
```

AWS credentials will need to be generated from IAM User.

### Terraform Basics

#### Terraform Registry

Terraform sources their providers from the Terraform registry which is located at [Terraform Registry](https://registry.terraform.io/).

-Providers are APIs that give templates for creating resources in Terraform
-Modules break down API into usable code snippets, making it easier to produce your own code within Terraform.

#### Terraform Init

`terraform init` is run at the beginning of a new terraform project to download binares used by providers designated in the project.

#### Terraform Plan

`terraform plan` generates a changeset, comparing existing code to a proposed change to the code.

This changeset can then be applied using `terraform apply`, a terminal prompt will require you to type `yes` to proceed. Alternatively, an auto approve flag, `terraform apply --auto-approve` will bypass the need for an additional input.

### Terraform Lock Files

`.terraform.lock.hcl` contains the locked versioning for the providers and modules used in the project. This *should be comitted* to the **Version Control System (VCS)** that the project team is using, eg. Github. 

#### Terraform Destroy

`terraform destroy` will destroy terraform resources created in terraform. `--auto-approve` flag is also valid here.


### Terraform State Files

`.terraform.tfstate` contains information about the current infrastructure's state and **should not be commited** to the VCS.

### Terraform Directory

`.terraform` directory contains binares of terraform providers.