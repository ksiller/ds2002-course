# Lab 00: Setup

The goal of this activity is to get you set up with Codespaces for your exercises, labs, and project, and to familiarize you with the process of submitting your work for grading.

> **Note:** This lab corresponds to the [Getting started with Environments](../../practice/01-env/README.md) practice exercise. Complete this lab first, then continue with the additional practice exercises.

## Setup

You can use <a href="https://github.com/codespaces/" target="_blank" rel="noopener noreferrer">GitHub Codespaces</a> for these exercises. Open that page and click on "New Codespace" and select your ***forked course repository***, which is a copy of the course materials. Your personal fork should be <a href="https://github.com/YOUR_GITHUB_USERNAME/ds2002-course" target="_blank" rel="noopener noreferrer">https://github.com/YOUR_GITHUB_USERNAME/ds2002-course</a>. 

> If you haven't created the fork yet, go to Codespaces as described in the [course's general setup instructions](../../setup/README.md). 

**Advanced: Optional** - If you set up software tools on your own computer, for an additional challenge, complete these exercises on your local laptop using either the MacOS Terminal (Mac) or Git Bash (Windows). You may need to modify some commands accordingly.

## Instructions:

1. Start up Codespaces: On GitHub go to your forked repository, click the blue **Code** button.
   - The course repository is <a href="https://github.com/ksiller/ds2002-course" target="_blank" rel="noopener noreferrer">https://github.com/ksiller/ds2002-course</a>
   - Your personal copy (fork) should be <a href="https://github.com/YOUR_GITHUB_USERNAME/ds2002-course" target="_blank" rel="noopener noreferrer">https://github.com/YOUR_GITHUB_USERNAME/ds2002-course</a>
2. Select the **Codespaces** tab.
3. Click **Create codespace on main** (or select a branch).
4. GitHub will automatically detect and use the default devcontainer configuration.
5. Wait for the codespace to initialize (this may take several minutes).
6. Once your codespace is running, open the terminal. The terminal will show at the bottom of your Codespaces window.
   ![Terminal in Codespaces](../../docs/images/codespaces-terminal.png)

7. Check the hostname of your system: Enter this command in the terminal window, hit enter/return.
   ```bash
   hostname
   ```
   
   The output should look similar to this:
   ```bash
   codespaces-57da94
   ```

8. Post the output in the class poll (URL will be shared in class). 
   
9. **Setup a prebuild configuration for your Codespace**

   To speed up future Codespace startups, configure a prebuild. This will create a pre-built image of your Codespace environment that can be reused, significantly reducing the time it takes to start a new Codespace instance.

   Follow the [Codespace Prebuild Instructions](https://docs.github.com/en/codespaces/prebuilding-your-codespaces/configuring-prebuilds) with these specific settings:

   - **Steps 1-6**: Follow the instructions as provided.
   - **Step 7**: Select **On configuration change**. This limits rebuilds to only when the devcontainer configuration changes, which helps conserve resources since the course environment rarely needs updates.
   - **Step 8**: Choose **US East** only as the region for prebuilds.
   - **Steps 9-12**: Complete the remaining steps per the official instructions.

   > **Note:** The prebuild process will take several minutes to complete. You can move on to step 10 (Optional) or skip ahead to step 11 (Submit your work) while the prebuild runs in the background. Check the status of the prebuild process in the **Actions** tab of your repository on GitHub.

10. **Optional** - On your own computer

    If you have a terminal application installed on your own computer, you can run the `hostname` command there.

11. Submit your work on Canvas

- Create a secret Gist (a special kind of GitHub repository), name it "Lab-00-YOUR_COMPUTING_ID" (replace with your actual computing ID) as described in the [Submitting Labs](../../labs/README.md#submitting-labs) section.
- In your Gist, create a new text file `submission.txt`
- In the `submission.txt` file, add on three lines the following information
```bash
Computing id: <your computing id>
GitHub username: <your GitHub username>
Hostname: <the output from the hostname command above>
```  
- Copy and Paste the Gist URL to the Lab assignment in Canvas.

**Congratulations! You are all set for the next class activities.**

