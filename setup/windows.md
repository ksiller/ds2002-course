---
layout: default
title: Windows Setup
---

# Windows Setup

If you have a Mac or Linux computer, go to the [Mac/Linux setup instructions](mac-linux.md).

## Setting Up Your Own Computer for Course Projects (Optional)

**Note: If you are new to programming and are not familiar with installing programming tools on your computer, I highly recommend skipping this step and using [GitHub Codespaces](README.md#using-github-codespaces-for-your-projects-recommended) instead.** This will allow you to get started immediately without the hassle of troubleshooting any setup issues.

However, if you want to set up an environment for class work on your own computer, here are the basic steps. 

To set up your own computer for all course activities I highly encourage you to install all the python packages in a new environment. Think of an environment as an isolated area to install the software packages you need for a specific project, i.e. in this case the course activities. Packages in an environment are isolated from other software packages on your computer.
   - **Best practice:** Create a new environment for each of your projects.
   - **Isolation:** It is typically defined in a specific folder on your computer.
   - **Experimentation:** It allows you to tweak installation of new packages without disrupting packages in other environments. 
   - **Avoid conflict:** It allows you to manage packages that are not compatible in separate environments.

## VSCode

Download and install [Visual Studio Code](https://code.visualstudio.com/docs/setup/setup-overview) from the official website. Follow the platform-specific installation instructions for Windows.

## Tools & Python

Since we're using the Linux command line, you will need to install a Linux-like terminal program. I recommend installing Git-Bash which provides the Linux-style terminal and also Git.

### 1. Install Git-Bash

1.1 Download and install Git-Bash from the [official Git website](https://git-scm.com/downloads).

### 2. Install Miniforge

2.1. Download the Miniforge Installer. Go to the [conda-forge Miniforge GitHub repository](https://github.com/conda-forge/miniforge) and download the Windows executable file (Miniforge3-Windows-x86_64.exe).

2.2 Run the Executable Installer: Double-click the downloaded .exe file to run the installer.
   - Follow the prompts, accepting the license agreement.
   - It is highly recommended to install for "Just Me" (per user) to avoid potential permission issues later. 
   - Note the installation path: The default installation path is usually within your AppData\Local folder (e.g., `C:\Users\YOUR_USERNAME\miniforge3` or `C:\Users\YOUR_USERNAME\AppData\Local\miniforge3`). Trim it back to `C:\Users\YOUR_USERNAME\miniforge3` if needed. Copy and paste that path to your clipboard.
   - Check the "Create start menu shortcuts" option. The most convenient and tested way to use the installed software (such as commands conda and mamba) is via the "Miniforge Prompt" installed to the start menu.
   - Check the "Add Miniforge3 to my PATH environment variable" option. 

2.3. Configure bash for Python
Open a new ***Git Bash terminal*** (not the Windows PowerShell) and execute the following command:
```bash
echo 'echo "Sourcing .bashrc" && eval "$(mamba.exe shell hook --shell bash)" && mamba activate' >> ~/.bashrc
```

### 3. Create a conda (mamba) environment. 

3.1. Open a new ***Git Bash terminal*** (not the Windows PowerShell) and execute the following command:
```bash
mamba env create -n ds2002 -c conda-forge python=3.11 pip jq awscli curl git redis-py mongodb
mamba activate ds2002
pip install unzip wget
```

> **Note:** You can try and add the zip and tar packages to the pip install command, but be aware that they may fail to install on your computer.

3.2. Check your environments:
```bash
mamba env list
```

You should see:
```
# conda environments:
#
base                 * C:\Users\mst3k\miniforge3
ds2002                 C:\Users\mst3k\miniforge3\envs\ds2002
```


### 4. Restart Git Bash and Verify:

4.1. Close and reopen your Git Bash terminal for the changes to take effect.

4.2. Run `mamba activate ds2002`. The prompt should change from `base` to `ds2002` indicating the switch to your new environment.

4.3. Run the command `mamba list`. You should see a list of installed packages, and your prompt should show (ds2002) at the beginning, confirming that the ds2002 environment is active.

**Note: The first step when opening a new terminal is to run `mamba activate ds2002`.** You can add that command to the ~/.bashrc file if you wish.

**Please be aware that we have limited bandwidth to guide you through fixing broken installations on your computer. If installations fail, you can always go back to using GitHub Codespaces.**

