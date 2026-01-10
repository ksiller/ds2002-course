# Scripting in Python

The goal of this activity is to familiarize you with scripting in Python. Python scripting is essential for automating tasks, processing data, orchestrating workflows, and building reusable tools that can save time and reduce errors.

> **Note:** Work through the examples below in your terminal (Codespace or local), experimenting with each command and its various options. If you encounter an error message, don't be discouraged—errors are learning opportunities. Reach out to your peers or instructor for help when needed, and help each other when you can. 

If the initial examples feel like a breeze, challenge yourself with activities in the *Advanced Concepts* section and explore the resource links at the end of this post.

* Start with the **In-class Exercises**.
* Continue with the **Additional Practices** section on your own time. 
* Optional: Explore the **Advanced Concepts** if you wish to explore Python scripting in more depth.

## In-class exercises

Scripting in `python` is fairly similar to bash, but it has a lot more functionality in 
terms of libraries, classes, functions, etc. A few things to note:

- Unlike `bash` it is not as easy to pass `$1`, `$2` parameters in the command-line.
Refer to [Command line arguments in Python](https://stackabuse.com/command-line-arguments-in-python/) for a basic tutorial.
- Python can invoke shell scripts in other languages.
- Python has many better options for conditional logic, error handling, and logging.
- Whereas `bash` and other low-level tools (`grep`, `sed`, `awk`, `tr`, `perl`, etc.) can parse 
plain-text "flat" files fairly efficiently, Python can ingest a data file and load it 
into memory for much more complex transformations. A library like `pandas` can use 
dataframes like a staging database for you to query, scan, count, etc. Here's a great [pandas
tutorial](https://www.kaggle.com/sohier/tutorial-accessing-data-with-pandas) on Kaggle.


### Starting JupyterLab in Codespaces

JupyterLab is pre-installed in your codespace environment. To start it:

1. Open a terminal in your VSCode codespace (Terminal → New Terminal)
2. Run the following command:
   ```bash
   jupyter lab --allow-root
   ```
3. The terminal will display a URL with an authentication token. Look for a line like:
   ```
   http://127.0.0.1:8888/lab?token=...
   ```
   Copy the token info *after* the "...token=". We'll need it in the next step.

4. In VS Code, you should see a notification asking if you want to open the forwarded port, or you can:
   - Click on the "Ports" tab in the bottom panel
   - Find port 8888 in the list
   - Click the "Open in Browser" icon (globe icon) next to port 8888
5. JupyterLab will open in a new browser tab. Enter the token (from step 3) into the authentication field when prompted.

**Note:** Port 8888 is automatically forwarded in Codespaces, so you don't need to manually configure port forwarding.

Alternatively you can set up the software environment locally on your own computer, see the [setup instructions](../../setup/README.md). 

### Running a Python script

1. Open a terminal window.
2. In the terminal run:
    ```bash
    python my_script.py # add command line args as needed if the script is written to handle them.
    ```

## Additional Practice

## Advanced Concepts (Optional)

## Resources

[Command line arguments in Python](https://stackabuse.com/command-line-arguments-in-python/)
[Pandas tutorial](https://www.kaggle.com/sohier/tutorial-accessing-data-with-pandas) on Kaggle.

