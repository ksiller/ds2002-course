# Linux Command Line Interface (CLI) and Filesystem

The goal of this activity is to familiarize you with the fundamental commands used in Unix-like environments (Linux and macOS). These commands are essential for navigating the filesystem, managing files and directories, and manipulating data efficiently. 

> **Note:** Go to your ***forked course repository*** and start Codespaces as described in the [course's general setup instructions](../../setup/README.md). If you haven't forked the repo yet, do it now. 

> **Advanced: Optional** - If you set up software tools on your own computer, for an additional challenge, complete these exercises on your local laptop using either the MacOS Terminal (Mac) or Git Bash (Windows). You may need to modify some commands accordingly. Please be aware that these commands will not work in Windows PowerShell as is.

If you encounter an error message, don't be discouraged—errors are learning opportunities. Help each other when you can, and reach out to your instructor for help when needed.

* Start with the **In-class Exercises**.
* Continue with the **Additional Practices** section on your own time. 
* **Optional:** Explore the **Advanced Concepts** if you wish to explore CLI and filesystem in more depth.

## In-class exercises

Today we will walk through the first lab assignment together. 

- Work through CLI commands: [Lab 01](../../labs/01-cli/README.md) (You may see a 404 error until the lab is released)
- Submit your work as Lab 1 on Canvas. See [submission instructions](../../labs/README.md).

## Additional Practice

### Finding Help

A few places you can find explanations and examples for various commands:

1. Use the `man` tool in the terminal! For instance, to learn about `cp` and all of its features, options, etc., type `man cp` and read the documentation. Use the up and down arrows to navigate, then press `Q` to return to the prompt.
2. Look at **Linux in a Nutshell** or the **Linux Pocket Guide** in Canvas Module 1. They include all the details!
   

### Getting Oriented to your Home Directory

Change directories to your home directory (see the "Navigating the file system" section below for more `cd` options):

```
cd ~
```

Learn the location of your home directory by issuing the `pwd` command. `pwd` is short for "print working directory". 

```
pwd
```

### Listing Files and Directories (`ls`)

The `ls` command displays the contents of a directory. It's one of the most frequently used commands for exploring the filesystem.

Basic listing:

```bash
ls
```

This shows only visible (non-hidden) files and directories in a simple list format, sorted alphabetically.

**Long listing format (`ls -l`):**

```bash
ls -l
```

This displays detailed information about files and directories including:
- File permissions and type (first column: `-` for file, `d` for directory)
- Number of hard links
- Owner username
- Group name
- File size in bytes
- Last modification date and time
- File or directory name

**Listing all files including hidden ones (`ls -a` or `ls -la`):**

Hidden files and directories start with a `.` (such as `.ssh` or `.bashrc`). To see them:

```bash
ls -a
```

Or combine with the long format:

```bash
ls -la
```

Note that the `-al` flags (or options) do not have to be in any particular order, so `ls -la` and `ls -al` are equivalent.

In the output, you'll see:
- `.` represents the current directory
- `..` represents the parent directory
- Files starting with `.` are hidden configuration files

**Using wildcards with `ls`:**

Wildcards allow you to match multiple files or directories based on patterns:

- `*` (asterisk) - matches any sequence of characters (including zero characters)
- `?` (question mark) - matches exactly one character

**List all files ending with `.pdf`:**
```bash
ls -al *.pdf
```

**List files matching a pattern:**
```bash
ls file?.txt
```

This finds files like `file1.txt`, `file2.txt` (where `?` matches a single character), but not `file10.txt` (which has two characters).

**Listing a specific directory:**

You can list the contents of any directory without changing into it by providing the path:

```bash
ls -al /usr/bin
```

This lists all files in `/usr/bin` with detailed information, including hidden files.

### Navigating the file system

#### cd (Change Directory)

**Going back to last directory:**

```bash
cd -
```

The `-` is a special argument that takes you back to the previous directory you were in. Useful for quickly switching between two directories.

**Changing directly to directory (absolute path):**

Remember, a path designates a file or directory, separating subdirectories (sub-folders) with the `/` character.

```bash
cd /workspaces/ds2002-course/practice/01-env
```

An absolute path starts with `/` and specifies the complete path from the root of the filesystem. This works from any location.

What happens if the path you entered does not exist? Let's find out.
```bash
cd bogus/path/
```

You should see the following output:
```bash
cd: no such file or directory: /bogus/path/
```

**Changing directory using a relative path:**

```bash
cd practice/01-env
```

A relative path doesn't start with `/` and is relative to your current directory. If you're in `/workspaces/ds2002-course`, then `practice/01-env` refers to `/workspaces/ds2002-course/practice/01-env`.

You can use `..` to go up a directory, or even multiple directories. Let's assume you're in `/workspaces/ds2002-course/practice/01-env/`. (Run `pwd` to confirm)

Then execute this command:
```bash
cd ../../labs
```

The `cd` command took you two levels up to `/workspaces/ds2002-course/` and then one directory down into `labs`. You can run the `pwd` command to confirm the full path of the directory you're in now. 

Keep experimenting with this so you get comfortable with the concept of relative and absolute paths.    

> **Note:** Remember, if you ever get lost use the `pwd` command to print the current working directory you're in. And you can execute `cd` without any arguments to go back to your home directory.

### Creating new directories and files

**Before proceeding with the activities I highly recommend you change to your home directory and create a new subdirectory `cli_exercises`.** That will ensure that you're not polluting your forked Git repository.

```bash
cd # go to your home directory
mkdir cli_exercises
```

**Create some test files using `touch`:**

```bash
touch file1 file2
```

**Add text contents to a file with `echo`:**

You can use `echo` to pass some data into a file like this:
```bash
echo "Hi there everybody, my name is <YOUR NAME>" > file1
```

This command uses a "redirect" to take the `echo` command and push it into `file1`. You could actually just use `echo` to output anything you want, at any time, but it only prints to the screen and isn't recorded anywhere. Try it for yourself:

```bash
echo "Today is Friday"
echo "A man a plan a canal Panama"
```

#### mkdir (Make Directory)

Use the `mkdir` command to create new directories (folders). You can create single or multiple directories at once.

Create a single directory:
```bash
mkdir cli_exercises
```

This creates a new directory called `cli_exercises` in the current location. You can verify it was created with `ls`.

Create multiple directories at once:
```bash
mkdir dir1 dir2 dir3
```

This creates three directories (`dir1`, `dir2`, and `dir3`) in the current location.

Create nested directories (parent and child):
```bash
mkdir -p parent/child/grandchild
```

The `-p` flag creates parent directories as needed. If `parent` doesn't exist, it will be created first, then `child`, then `grandchild`.

> **Note:** `mkdir` will fail if you try to create a directory that already exists, unless you use the `-p` flag (which won't error if the directory already exists).

#### touch (Create Empty File or Update Timestamp)

Use the `touch` command to create new empty files or update the access/modification timestamp of existing files. It's commonly used to create placeholder files or trigger file-based operations.

Create a single empty file:
```bash
touch newfile.txt
ls -l newfile.txt
```

Output:
```bash
-rw-r--r-- 1 codespace codespace 0 Jan 15 15:30 newfile.txt
```

The result is a new empty file (0 bytes) named `newfile.txt`. If the file already exists, `touch` updates its modification timestamp without changing the file contents.

Create multiple files at once:
```bash
touch script.sh data.csv notes.md
```

If the file already exists, `touch` updates its access and modification times to the current time *without* modifying the file contents. Useful for triggering file-based operations or resetting timestamps.

### Copying Files and Directories

The `cp` command copies files and directories. Unlike `mv`, which moves files, `cp` creates a duplicate while keeping the original.

**Copy a file:**
```bash
cp file1 file2
```

This creates a copy of `file1` named `file2` in the same directory. Both files will exist after the command completes.

**Copy a directory (recursive):**

For directories, we need the `-r` flag to indicate a recursive copy:
```bash
cp -r dir1 dir2
```

The `-r` (or `-R`) flag tells `cp` to copy directories recursively, including all files and subdirectories inside them.

**Copy multiple files:**
```bash
cp file1.txt file2.txt file3.txt destination/
```

This copies all three files into the `destination` directory.

**Copy with wildcards:**
```bash
cp *.txt backup/
```

This copies all `.txt` files in the current directory to the `backup` directory.

> **Note:** It's a good practice to leave the trailing `/` off of directory names when using `cp`.

> **Note:** `cp` overwrites existing files without warning (unless using `-i` for interactive mode). Use `cp -i` to prompt before overwriting.

### Deleting Files and Directories

Use the `rm` command to delete files or directories. **Warning:** Deleted files cannot be easily recovered, so use with caution.

**Delete a single file:**

From the earlier activities, you should have `markdown.md`, and a few other files in your current directory. Confirm with `ls` command. Now, let's delete it
```bash
rm markdown.md
```

The file is removed from the filesystem and cannot be recovered through normal means. Confirm with `ls`.

**Delete multiple files:**
```bash
rm file10.txt notes.txt newfile.txt
```

**Delete files matching a pattern:**

To delete all files ending in `*.txt`, run this:
```bash
rm *.txt
```

The `*` wildcard matches all files ending in `.txt`. Use with caution as this can delete many files at once.

**Delete a directory (empty):**

```bash
rmdir dir1
```

`rmdir` only removes empty directories. If the directory contains files, it will fail. You can delete multiple empty directories: `rmdir dir2 dir3`.

**Delete a directory and its contents:**

```bash
rm -r newdir
```

- The `-r` flag (recursive) deletes the directory and all its contents
- Works for both files and subdirectories
- Very dangerous - use carefully!

**Delete directory with confirmation:**
```bash
rm -ri newdir
```

- `-i` flag (interactive) prompts before each deletion
- Combined with `-r` for recursive deletion with confirmation
- Safer option when deleting directories

**Force delete (no prompts):**

```bash
rm -f script.sh
```

- `-f` flag (force) removes files without prompting, even if they're write-protected
- Overrides `-i` if both are specified
- Use with extreme caution, particularly when used in combination with `-r`.

**Common combinations:**
```bash
rm -rf directory/    # Recursive force delete (no prompts) - VERY DANGEROUS
rm -ri directory/    # Recursive with prompts (safer)
rm -r directory/     # Recursive delete (may prompt for write-protected files)
```

> **Note:** Safety tips:
    - Always double-check the path before running `rm`
    - Use `ls` first to verify what you're about to delete
    - Use `-i` flag for interactive mode when unsure
    - Consider using `rm -i` as an alias in your `.bashrc` for safer defaults
    - **Never run `rm -rf /` or `rm -rf ~`** - this will delete everything!
  
### Moving and Renaming Files

The `mv` command can both move and rename files/directories. 

**Renaming:**

Let's rename `notes.md` file (created by touch command above) 
```bash
mv notes.md new_notes.md
```
The file has been renamed `notes.md` -> `new_notes.md`. You can confirm with the `ls` command.

**Move a file to a directory:**

Let's move `new_notes.md` to the `myproject` directory (created above).
```bash
mv new_notes.md myproject/
```

When you run `ls myproject` to list the directory's content, you should see the `new_notes.md` file inside `myproject` now. 

**Move and rename at the same time:**

Let's move it back and rename it at the same time:
```bash
mv myproject/new_notes.md renamed_notes.md
```

**Move multiple files:**

The files `file1.txt` and `file2.txt` were created earlier. Let's also create `file3.txt` and then move them all at once:
```bash
touch file3.txt
mv file1.txt file2.txt file3.txt myproject/
```

You may also use a wildcard, like so:
```bash
mv file*.txt myproject/
```

> **Note:** This wildcard pattern `file*.txt` will move all files starting with "file" and ending with ".txt", including `file1.txt`, `file2.txt`, `file10.txt`, and `file3.txt`. The file `notes.txt` won't be moved because it doesn't start with "file".

**Move a directory:**

It is just as easy to move entire directories:
```bash
mv myproject newdir
```

What happens depends on whether `newdir` exists:
- (a) If `newdir` doesn't exist: The directory `myproject` is renamed to `newdir`. The directory and all its contents are moved/renamed.
- (b) If `newdir` is an existing directory: The directory `myproject` (and all its contents) is moved *inside* the existing `newdir` directory. The result is `newdir/myproject/`.
- (c) If `newdir` is an existing file: The command will fail with an error because you cannot move a directory to overwrite a file. You would need to remove the file first or choose a different name.

> **Note:** Important notes:
    - `mv` overwrites existing files without warning (unless using `-i` for interactive mode)
    - Use `mv -i` to prompt before overwriting
    - `mv` preserves file permissions and timestamps when possible
    - Moving files within the same filesystem is instant (just updates directory entries)

Practice creating, renaming, and deleting directories (see the "Creating new directories and files" section below for comprehensive coverage of `mkdir`, `mv`, and `rm`):

```bash
mkdir mynewdir
ls -al
mv mynewdir another-newdir
rm -r another-newdir
```

Can you already guess the full path of a directory you create? Use `cd` and `pwd` to verify.

### Working with Text Files

#### Creating and Editing Text Files with `nano`

A simple, built-in text editor is called `nano`. To open `nano` with an empty, blank document, simply invoke the `nano` program:

```bash
nano
```

Within the page you see blank space where you will write contents, and a series of possible commands at the bottom marked with the `^` character. This stands for the CONTROL key. If you open a blank document, try writing several lines of text, complete with paragraph breaks and punctuation. When you're done, press `^X` to exit. Upper/lower case does not matter.

This will give you the following prompt:

```bash
Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES) ? 
```

To save your buffer (your open document) just press the `Y` key. This will give you a final prompt:

```bash
File Name to write : 
```

Here you can name your file anything you want. It will be saved to the directory you were in when you opened up `nano`.

> **Note:** Do not use word processors like Microsoft Word to edit raw data or code files. The word processor inserts hidden formatting instructions that can mess up your file's contents.

#### cat (Concatenate)

Use the `cat` command to display the entire contents of a file on the screen. It's best for small files. The name comes from "concatenate" because it can combine multiple files.

```bash
cat README.md
```

Your output may look like this:
```bash
# Getting Started

This is a sample README file.
It contains multiple lines of text.
```

`cat` prints the entire file contents to the terminal. Useful for quick viewing of small files, but for large files, use `less` instead to avoid overwhelming the terminal.

**Output multiple files:**

Let's assume you have a file `list1.txt` that contains:
```bash
apple
banana
```

And `list2.txt` containing:
```bash
cherry
date
```

Run this command:
```bash
cat list1.txt list2.txt
```

 And you should get:
```bash
apple
banana
cherry
date
```

`cat` can read multiple files in sequence and combine their contents. This is the "concatenate" functionality that gives `cat` its name. The files are combined in the order they appear in the command. When used with `>`, it redirects the combined output to a new file (see **Redirecting Output** section below).

#### less (is more)

Use the `less` command to view file contents one screen at a time with the ability to scroll up and down. It's ideal for reading large files without flooding the terminal. It is an advanced version of the `more` command, hence `less` is more.

```bash
less README.md
```

Example output (interactive view):
```bash
# Getting Started

This is a sample README file.
It contains multiple lines of text.
More content here...
(END)
```

- `less` opens an interactive viewer
- Use arrow keys or Page Up/Down to navigate
- Press `q` to quit
- Press `/` to search (type search term, press Enter)
- Press `h` for help with all commands
- Much better than `cat` for large files because you can scroll and search

#### grep (Global Regular Expression Print)

Use the `grep` command to search for patterns (text strings) within files. It's extremely useful for finding specific content in files or filtering command output.

```bash
grep "pattern" filename
```

Example:
```bash
grep "README" *.md
```

Your output may look like this:
```bash
README.md:# Getting Started with README
practice/01-env/README.md:## Getting Started
practice/02-cli/README.md:# Exercises: Linux CLI
```

- Searches for the word "README" in all `.md` files in the current directory
- Output shows: `filename:line containing the match`
- Each line shows which file contained the pattern and the matching line

Useful grep options:
```bash
grep -i "pattern" file    # Case-insensitive search
grep -r "pattern" .       # Recursive search in current directory and all subdirectories
grep -n "pattern" file    # Show line numbers
grep -v "pattern" file    # Show lines that DON'T match (invert)
```

You can combine multiple options as is typical for shell commands. For example, try the following:
```bash
grep -rin "linux" . 
```

#### wc (Word Count)

Use the `wc` command to count lines, words, and characters in files. It's useful for getting statistics about file content, checking file sizes, or verifying data.

Count lines, words, and characters:
```bash
wc README.md
```

Your output may look like this:
```bash
  42  156  1234 README.md
```

The output shows three numbers followed by the filename:
- First number (`42`): Number of lines
- Second number (`156`): Number of words
- Third number (`1234`): Number of characters (bytes)

Count only lines:
```bash
wc -l README.md
```

Your output may look like this:
```bash
42 README.md
```

The `-l` flag counts only the number of lines. Useful for quickly checking how many lines a file contains.

Count only words:
```bash
wc -w README.md
```

Your output may look like this:
```bash
156 README.md
```

The `-w` flag counts only the number of words (separated by whitespace).

Count only characters:
```bash
wc -c README.md
```

Your output may look like this:
```bash
1234 README.md
```

The `-c` flag counts only the number of characters (bytes) in the file.

Count multiple files:
```bash
wc *.md
```

Your output may look like this:
```bash
  42  156  1234 README.md
  28   89   567 practice/01-env/README.md
  70  245  1801 practice/02-cli/README.md
 140  490  3602 total
```

When given multiple files, `wc` shows statistics for each file and a total at the end. Useful for comparing file sizes or getting overall statistics.

Common use cases:
- Checking the size of log files
- Verifying data file line counts
- Getting word counts for text analysis
- Comparing file sizes before processing

**Practice combining commands:**

View and work with files using pipes:

```bash
cat hello.txt
cat hello.txt | wc
cat mobydick.txt | grep "Captain"
cat mobydick.txt | grep "Captain" | wc -l
```

See the [Connecting Commands with Pipes](#connecting-commands-with-pipes) section below for more details.

### Compressing files

> **Note**: Windows users with `git-bash` have `unzip` available but not `zip`. I suggest you work with `tar` instead.

Compressing or decompressing archives like zips or tarballs is not too difficult:

To create a zip bundle, assuming we are in a directory with `file1` and `file2` we want to zip up:


```bash
zip archive.zip file1 file2
```

This creates a zip file named `archive.zip` containing the two files. To unzip, the command is
quite simple:

```bash
unzip archive.zip
```

To create a tarball (the common nickname for a tar compressed archive) we often use it in conjunction with the `gzip` and `gunzip` options to keep the archive as small as possible. Again assuming we have two files in the current directory named `file1` and `file2` we want to put in the bundle:

```bash
tar -czvf archive.tar.gz file1 file2
```

The `-czvf` options mean: `-c` for CREATE an archive, `-z` for `gzip` the archive,
`-v` for verbose output, and `-f` for write the archive to a file.

To decompress the same archive:

```bash
tar -xzvf archive.tar.gz
```
The only difference in options is the use of `-x` which means "expand"

> **Note:** It's extremely useful to know that in the world of the command line you can always add or remove files from archives without re-creating them! They are editable objects using when using either the `zip` or `tar` commands.

### Finding Files

Use the `find` command to search for files and directories in a directory hierarchy based on various criteria (name, size, type, modification date, etc.). It's a powerful tool for locating files.

Let's fetch a large text from a remote source so that we can search through it:

```bash
curl https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt > mobydick.txt
```

Find files by file name. Use the `find` command for this. The syntax is:

```bash
find . -name "mobydick.txt"
```

This issues the find command, searching the present directory (signified by the `.`)
with the name `"mobydick.txt"`. Note that the filename must be an exact match.

To search across all home directories, for example, you would change the path option

```bash
find /home -name "filename.txt"
```

**Find files matching a pattern:**
Use the wildcard `*` character at the beginning, middle, or end of a term to extend
matching. For example, if you only knew that `moby` was in the name of the file and
nothing more, this command would work:

```
find . -name '*moby*'
```

Or if you wanted to file all text files by suffix in a directory

```
find . -name '*.txt'
```

**Command structure:**
- `.` - Start searching from current directory
- `-name "*.md"` - Find files matching the pattern (all `.md` files)
- Output shows the relative paths to all matching files

**Other useful find examples:**
```bash
find . -type f -name "*.py"    # Find all Python files
find . -type d -name "practice" # Find directories named "practice"
find . -size +1M                # Find files larger than 1MB
```

### Sorting

The `sort` command arranges lines of text in a file. By default, it sorts alphabetically (lexicographically), but it can also sort numerically.

#### Sorting character sequences

A character sequence, also referred to as a "string", is something like "Good morning". It can contain digits but they are not interpreted as numbers in a mathematical sense. See the next section **Sorting numbers**.

Use the `sort` command to sort a list of fruit names alphabetically.

Create a file `fruits.txt` containing:
```bash
banana
apple
strawberry
cherry
BLUEBERRY
```

```bash
sort fruits.txt
```

The output should show this:
```bash
BLUEBERRY
apple
banana
cherry
strawberry
```

- `sort` arranges the lines alphabetically (string sorting)
- "BLUEBERRY" comes first because uppercase letters (A-Z) come before lowercase letters (a-z) in ASCII/lexicographic sorting
- "apple" comes before "banana" because 'a' comes before 'b' in the alphabet
- This is lexicographic sorting - it compares characters from left to right based on ASCII values
- Useful for organizing text data alphabetically

Case-insensitive sorting:

If you want to ignore case differences when sorting, use the `-f` flag:

```bash
sort -f fruits.txt
```

The output should show this:
```bash
apple
banana
BLUEBERRY
cherry
strawberry
```

- The `-f` flag (or `--ignore-case`) makes sorting case-insensitive
- "apple" comes before "BLUEBERRY" because 'a' and 'A' are treated as the same
- When case is ignored, the order is: apple, banana, BLUEBERRY, cherry, strawberry
- Useful when you want to sort alphabetically regardless of capitalization

Save case-insensitive sorted output:
```bash
sort -f fruits.txt > sorted_fruits.txt
```

#### Sorting numbers (string vs numerical sorting)

Use the `sort` command to understand the difference between string sorting and numerical sorting.

Create a file `numbers.txt` containing:
```bash
1
6
2
8
10
5
```

Run this command to sort the content of the file:
```bash
sort numbers.txt
```

The output should show this:
```bash
1
10
2
5
6
8
```

- By default, `sort` treats everything as text (strings)
- It compares character by character from left to right
- "10" comes before "2" because '1' < '2' when comparing the first character
- This is **not** what we want for numbers!

Numerical sorting:
```bash
sort -n numbers.txt
```

The output should show this:
```bash
1
2
5
6
8
10
```

- The `-n` flag tells `sort` to interpret values as numbers
- Now it sorts by numerical value, not by character
- "1" comes before "2", and "10" comes after "8" (as expected)

Key differences:
- String sorting (`sort`): Compares characters, so "10" < "2" (incorrect for numbers)
- Numerical sorting (`sort -n`): Compares values, so 1 < 2 < 10 (correct for numbers)

### Utility Commands

These commands are used a bit less frequently but can help with basic tasks.

#### `top`

`top` or `htop` shows you current processes, memory and CPU usage. They allow you
to see the `pid` (process ID) for any process, so that you can monitor it or stop (kill) it.

#### `w`

`w` (who) shows you current users of your system. Typically if you are on a laptop
or desktop computer you own, you will be the only user. But large HPC computers may
have hundreds of users logged in concurrently.

#### `which`

`which` shows you the path to a specific application (see the "Finding commands" section below for comprehensive coverage):

```bash
which python3
```

You may want to list the contents of the `/usr/bin` directory to get a sense for all the 
built-in commands within the Linux kernel and `bash` shell:

```bash
ls -al /usr/bin
```

#### `history`

Do you remember all the commands you ran? If not, don't worry. Use the `history` command to get a list in chronological order.

```bash
history
```

The end of your output may look like this:
```bash
 ...
   50  ls
   51  rm -ri newdir
   52  rm -f script.sh
   53  find . -name "*.md"
   54  find . -type f -name "*.py"
   55  find . -type d -name "practice"
   56  find . -size +1M
   57  which ls
   58  whereis ls
   59  whereis -b ls
   60  history
```

- `history` displays all commands you've run in your current `bash` session
- Each command is numbered sequentially
- Often this is limited to 1000 commands but that can be changed in your `.bashrc` file
- The history is stored in `~/.bash_history` file

When viewing your history, notice the line number with each command. To repeat an item in your history, prefix that number with `!`:

```bash
!999
```

This will re-execute command number 999 from your history.

### hostname

Use the `hostname` command to display the hostname (network name) of the system. It's useful for identifying which machine you're working on, especially in remote or cloud environments.

```bash
hostname
```

Your output may look like this:
```bash
codespaces-57da94
```

The output shows the unique hostname assigned to your codespace. In this case, `codespaces-57da94` indicates this is a GitHub Codespaces instance with identifier `57da94`. Each codespace gets a unique hostname.

### uptime

Use the `uptime` command to see how long the system has been running, along with the current time, number of users, and system load averages. It's useful for monitoring system health and uptime.

```bash
uptime
```

Your output may look like this:
```bash
 14:30:45 up 2 days,  3:15,  1 user,  load average: 0.05, 0.10, 0.15
```

- `14:30:45` - Current time
- `up 2 days, 3:15` - System has been running for 2 days and 3 hours 15 minutes
- `1 user` - Number of users currently logged in
- `load average: 0.05, 0.10, 0.15` - Average system load over 1, 5, and 15 minutes. Lower values indicate less system activity.

### Networking / Internet

The Linux OS has several built-in tools for helping check networking, or interacting with remote resources on the Internet.

#### `ping`

`ping` is a simple tool that, like its submarine counterpart, simply bounces a message off of a remote host and tells you if it is reachable:

```
$ ping google.com
PING google.com (142.251.167.138): 56 data bytes
64 bytes from 142.251.167.138: icmp_seq=0 ttl=57 time=6.479 ms
64 bytes from 142.251.167.138: icmp_seq=1 ttl=57 time=4.430 ms
64 bytes from 142.251.167.138: icmp_seq=2 ttl=57 time=4.407 ms
64 bytes from 142.251.167.138: icmp_seq=3 ttl=57 time=4.518 ms
```

Press Ctrl+C to stop the `ping`s. Be aware that `ping` just verified two things for us:

1. The host `google.com` is alive and well; and
2. Our current host has an active Internet connection.

#### `curl`

`curl` is a basic tool for fetching something from the Internet - a file, web page, zip or tar bundle, CSV or JSON datafile, etc. You used `curl` above to fetch the Moby Dick text. Try it yourself with this list of songs:

```
curl http://nem2p-dp1-api.pods.uvarc.io/songs
```

By default, `curl` displays the contents of what was retrieved. In the case above, you can see the JSON values of a song list. If you wanted to "capture" the data file, you could redirect this command to a file, or use the `-O` flag (Oh, not zero) to save the file.

Note that you cannot use `curl` to fetch password-restricted resources (i.e. from Canvas, or Gmail, etc.)

Another useful trick with `curl` is to find your public IP address:

```
$ curl ifconfig.me
199.111.240.7
```

#### `ssh`

`ssh` is the Secure Shell, a method for making secure connections into the terminal of another computer. This might be a computing instance running in the cloud, a supercomputer, or another machine.

SSH connections look very similar to email addresses, in the form of USER @ HOST. (This is no coincidence since email and shell connections are very early Internet tools.)

Try a connection using a password:

```
ssh ds2002@34.201.203.207
```
Connect using the password given to you in the Canvas instructions for this lab.

1. Within the home directory of this shared user account, create a subdirectory named from your UVA computing ID, i.e. `mst3k`. Create a `README.md` file within that folder that includes your full name.
2. Check the login status of other users with the command `last -i`.
3. View the `history` of this account. Since all students are sharing a single account name, you'll see the history of other students included.
4. To leave the SSH session, type `exit`.

### date

The `date` command displays the system date and time. It's useful for checking the current time, scheduling tasks, or timestamping operations.

```bash
date
```

Your output may look like this. 
```bash
Mon Jan 11 14:30:45 UTC 2026
```

It shows the current date and time in the format: day of week, month, day, time (24-hour format), timezone, and year. UTC (Coordinated Universal Time) is the standard timezone used in many cloud environments.

### What's the operating system version? 

Use the `cat /etc/os-release` command to display operating system identification information. It's essential for understanding what Linux distribution and version you're working with.

```bash
cat /etc/os-release
```

Your output may look like this:
```bash
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.22.2
PRETTY_NAME="Alpine Linux v3.22"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://gitlab.alpinelinux.org/alpine/aports/-/issues"
```

- `NAME` - Full name of the operating system
- `ID` - Short identifier for the distribution
- `VERSION_ID` - Specific version number
- `PRETTY_NAME` - Human-readable name and version
- `HOME_URL` - Official website for the distribution
- `BUG_REPORT_URL` - Where to report issues

### Finding commands

When you type a command like `ls` or `python`, the shell needs to find the executable file. These commands help you locate where commands are stored on your system.

#### which

Use the `which` command to find the location of an executable command in your PATH. It shows the full path to the command that would be executed.

```bash
which ls
```

Your output may look like this:
```bash
/usr/bin/ls
```

- `which` searches for the command in directories listed in your `$PATH` environment variable (see **Environment Variables** below)
- Returns the full path to the first executable found
- Useful for verifying which version of a command will run
- If the command is not found, `which` returns nothing (no output)

#### whereis

Use the `whereis` command to locate the binary, source, and manual page files for a command. It's more comprehensive than `which` as it searches standard directories, not just PATH.

```bash
whereis ls
```

Your output may look like this:
```bash
ls: /usr/bin/ls /usr/share/man/man1/ls.1
```

- `whereis` searches in standard system directories (not just PATH)
- Shows binary location, source files (if available), and manual pages
- More thorough than `which` but may find multiple versions

Find only the binary:
```bash
whereis -b ls
```

Your output may look like this:
```bash
ls: /usr/bin/ls
```

Key differences between `which` and `whereis`:
- `which`: Searches only in PATH, returns the first executable found, simpler output
- `whereis`: Searches standard system directories, shows binaries/manuals/sources, more comprehensive

When to use each:
- Use `which` when you want to know which command will actually run (respects PATH order)
- Use `whereis` when you want to find all related files (binary, manual, source) for a command

### Connecting Commands with Pipes

A pipe (`|`) connects the output of one command to the input of another command. This allows you to chain commands together to perform complex operations by combining simple tools.

Basic pipe example:

Navigate to the top level directory of this repository, `ds2002-course`. Then run:
```bash
ls -l | grep "README"
```

Your output may look like this:
```bash
-rw-r--r-- 1 codespace codespace  1234 Jan 15 14:30 README.md
```

- `ls -l` lists all files with details
- The `|` (pipe) sends that output to `grep`
- `grep "README"` filters the output to show only lines containing "README"
- Result: You see only files with "README" in their name

Count lines in a file:

```bash
cat README.md | wc -l
```

Your output may look like this:
```bash
42
```

- `cat README.md` outputs the file contents
- `|` pipes that output to `wc -l`
- `wc -l` counts the number of lines
- Result: You get the total line count of the file

**Key concept:** The pipe takes the standard output (stdout) of the left command and feeds it as standard input (stdin) to the right command. This is a fundamental way to combine commands in Linux/Unix systems.

### Redirecting output

Output redirection allows you to send command output to a file instead of (or in addition to) displaying it on the screen. This is essential for saving results, creating logs, and processing data.

#### > (Overwrite redirect)

You can use `>` after a command to send output to a file. **The output file will be overwritten if it exists.** If it doesn't exist, it will be created.

Basic redirect:
```bash
echo "Hello World" > greeting.txt
```

Check the file contents:
```bash
$ cat greeting.txt
Hello World
```

The `>` operator redirects the output of `echo` to `greeting.txt`. If the file already exists, its contents will be completely replaced.

Combine multiple files:

```bash
cat list1.txt list2.txt > biglist.txt
```

If `list1.txt` contains:
```bash
apple
banana
```

And `list2.txt` contains:
```bash
cherry
date
```

After running the command, `biglist.txt` will contain:
```bash
apple
banana
cherry
date
```

`cat` can read multiple files in sequence and combine their contents. When used with `>`, it redirects the combined output to a new file (see Redirecting Output section below). This is the "concatenate" functionality that gives `cat` its name. The files are combined in the order they appear in the command.

Redirect find output:
```bash
find . -name "*.md" > markdown_files.txt
```

**Example output in file:**
```bash
$ cat markdown_files.txt
./README.md
./practice/01-env/README.md
./practice/02-cli/README.md
./labs/lab01-cli.md
...
```

All markdown files found by the `find` command are saved to `markdown_files.txt` instead of being displayed.

#### >> (Append redirect)

Use the `>>` to append command output to the end of a file without overwriting existing content. If the file doesn't exist, it will be created.

**Append to file:**
```bash
echo "First line" > log.txt
echo "Second line" >> log.txt
echo "Third line" >> log.txt
```

Check the file contents:
```bash
cat log.txt
```

You should get:
```bash
First line
Second line
Third line
```

The first `echo` uses `>` to create/overwrite the file. Subsequent `echo` commands use `>>` to append, preserving previous content.

### Key differences `>` vs `>>`

- **`>` (overwrite):** Replaces file contents completely. Use when you want a fresh file.
- **`>>` (append):** Adds to the end of the file. Use for logging or accumulating results.

**Important notes:**
- If the target file doesn't exist, both `>` and `>>` will create it
- Redirecting output doesn't display anything on screen (unless you also use `tee`)
- Errors are not redirected by default (they go to stderr, not stdout)

### Environment Variables

**What are environment variables?**

Environment variables are named values that store configuration information for your system and applications. They're accessible to all programs running in your shell session and help programs know where to find things or how to behave.

**View a specific environment variable:**

```bash
echo $HOME
```

Your output may look like this:
```bash
/home/codespace
```

The `$` symbol tells the shell to expand the variable name. `$HOME` is a built-in environment variable that contains the path to your home directory.

**Common built-in environment variables:**

Run the following echo commands one after another:
```bash
echo $HOME
echo $USER
echo $PWD
echo $PATH
```

Example output:
```bash
/home/codespace
vscode
/workspaces/ds2002-course
/usr/local/bin:/usr/bin:/bin
```

- `$HOME` - Your home directory path
- `$USER` - Your username
- `$PWD` - Current working directory (same as `pwd` command output)
- `$PATH` - List of directories where the system searches for executable programs (separated by `:`)

**View all environment variables:**

Run this command to see all environment variables:
```bash
env
```

Example Output:
```bash
HOME=/home/codespace
USER=vscode
PATH=/usr/local/bin:/usr/bin:/bin
SHELL=/bin/bash
... # many more
```

The `env` command displays all environment variables currently set in your session. This is useful for debugging or understanding your system configuration.

**Set an environment variable (current session only):**

You can set your own environment variables like so: 
```bash
export MY_VAR="Hello World"
echo $MY_VAR
```

**Output:**
```bash
Hello World
```

**Consider:** 
- `export` makes the variable available to child processes
- Variable names are typically UPPERCASE (convention, not required)
- The value is assigned with `=` (no spaces around `=`)
- Use quotes if the value contains spaces
- This variable only exists in the current terminal session
- **Note**: When assigning a value to an environment variable you don't use the `$` (e.g. MY_VAR="Hello World"); but you have to use the `$` when you want to get its values (we call that referencing the variable), e.g. `echo $MY_VAR`.

**Use environment variables in commands:**

You can use environment variables as placeholders in your commands. They will be evaluated when you execute the command. Try this:
```bash
cd $HOME
ls $HOME
```

The shell replaces the variable with its value before executing the command.

**Why are environment variables useful?**
- They provide a way to configure programs without hardcoding paths
- They allow scripts to work across different systems
- They store user preferences and system settings
- They're essential for many development tools and applications

**Understanding KEY and VALUE:**

Each environment variable is made of a `KEY` and a `VALUE`. The key is the variable name, and the value is what it stores. You can fetch any value by calling it by key name using `$KEY`.

**Setting variables without export (local to current shell):**

You can set a variable temporarily within your current session without using `export`:

```bash
FNAME="Waldo"
echo $FNAME
```

However, variables set this way are only available in the current shell session and won't be accessible to child processes or scripts. To make a variable available to other processes, you must use `export` (see above).

**Making environment variables persistent:**

By default, environment variables set with `export` only exist in the current terminal session. If you restart the computer or open a new terminal, they will be erased.

To make an environment variable persist in your account, you can store it in a configuration file:

**For your user account (persistent across sessions):**

Assuming that `bash` is your default shell, you can edit a hidden file in your home directory, `.bashrc`, and insert the export command:

```bash
export FNAME="Waldo"
```

Upon your next login or when you start a new terminal session, that variable will be available. You can also reload it in your current session by running:

```bash
source ~/.bashrc
```

**For system-wide configuration (requires root/sudo):**

If you can become `root` or use the `sudo` command, there is also a system-wide file for these exports. Simply insert your KEY=VALUE environment variable there (no `export` needed). That file can be found at:

```bash
/etc/environment
```

This makes the variable available to all users on the system.

## Advanced Concepts (Optional)

If you like to dive a bit deeper, explore the following commands. **The content in the Advanced section is not part of any quizzes.**

### The `man` command in detail (Manual Pages)

Use the `man` command to display the manual (help documentation) for commands. Manual pages are the built-in documentation system in Linux/Unix systems.

```bash
man ls
```

Example output (interactive view):
```
LS(1)                    User Commands                   LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about  the FILEs (the current directory by
       default).  Sort entries alphabetically if none of -cftuvSUX nor
       --sort is specified.

       Mandatory  arguments  to  long  options are mandatory for short
       options too.

       -a, --all
              do not ignore entries starting with .
...
(END)
```

- `man` opens the manual page for the specified command
- Manual pages are comprehensive documentation with syntax, options, examples, and descriptions
- Use arrow keys or Page Up/Down to navigate
- Press `q` to quit
- Press `/` to search within the manual (type search term, press Enter)
- Press `h` for help with navigation

**Search for a keyword in manual pages:**
```bash
man -k "list directory"
```

Your output may look like this:
```bash
ls (1)              - list directory contents
dir (1)             - list directory contents
vdir (1)            - list directory contents in long format
```

- `-k` (or `--apropos`) searches manual page names and descriptions
- Useful when you know what you want to do but not the command name
- Returns all manual pages matching the keyword

**View specific section of manual:**
```bash
man 1 ls
```

- Manual pages are organized into sections (1 = user commands, 2 = system calls, 3 = library functions, etc.)
- Some commands appear in multiple sections
- `man 1 ls` explicitly requests section 1

**Common manual sections:**
- **Section 1**: User commands (most common)
- **Section 2**: System calls
- **Section 3**: Library functions
- **Section 5**: File formats and conventions
- **Section 8**: System administration commands

**Quick reference (whatis):**
```bash
whatis ls
```

Your output may look like this:
```bash
ls (1)              - list directory contents
```

- `whatis` shows a one-line description from the manual page
- Quick way to see what a command does without opening the full manual
- Faster than `man` when you just need a brief description

**Find manual page location:**
```bash
man -w ls
```

Your output may look like this:
```bash
/usr/share/man/man1/ls.1.gz
```

- `-w` (or `--path`) shows the file path of the manual page
- Useful for finding where manual pages are stored
- Similar to what `whereis -m` shows

**Key concepts:**
- Manual pages are the primary documentation source for Linux/Unix commands
- Every standard command should have a manual page
- Use `man command` to learn about any command's options and usage
- Manual pages are more comprehensive than `--help` flags
- Essential for understanding command-line tools

### More `touch`

**Create file with specific timestamp:**
```bash
touch -t 202401151430 file.txt
```

The `-t` flag allows you to set a specific timestamp. Format: `[[CC]YY]MMDDhhmm[.ss]` where:
- `202401151430` = January 15, 2024 at 14:30

**Common use cases:**
- Creating placeholder files for scripts or programs
- Creating log files before they're written to
- Updating file timestamps for build systems
- Creating empty files to test file operations

### Advanced Sorting

#### Reverse sorting

Use the `sort -r` command to sort in descending order (reverse alphabetical or numerical order).

```bash
sort -r fruits.txt
```

The output should show this:
```bash
strawberry
cherry
banana
apple
BLUEBERRY
```

- The `-r` flag (or `--reverse`) sorts in descending order
- For text: Z to A, then z to a
- For numbers: highest to lowest (when used with `-n`)
- Useful when you want the largest values or last items first

**Reverse numerical sort:**
```bash
sort -rn numbers.txt
```

The output should show this:
```bash
10
8
6
5
2
1
```

`-rn` combines reverse (`-r`) and numerical (`-n`) sorting to get highest numbers first.

#### Removing duplicates

Use the `sort` and `uniq` commands to sort and remove duplicate lines, keeping only unique entries.

**Create a file `duplicates.txt` containing:**
```bash
apple
banana
apple
cherry
banana
strawberry
```

```bash
sort -u duplicates.txt
```

The output should show this:
```bash
apple
banana
cherry
strawberry
```

- The `-u` flag (or `--unique`) removes duplicate lines after sorting
- Only one instance of each unique line is kept
- Useful for cleaning up data with duplicates

**Alternative approach:**
```bash
sort duplicates.txt | uniq
```

`uniq` also removes duplicates, but requires sorted input (hence the pipe from `sort`).

#### Sorting by specific columns

Use the `sort` command with the `-k` option to sort structured data (like CSV or tab-separated files) by a specific column.

**Create a file `students.txt` containing (tab-separated):**
```bash
Alice	25	Math
Bob	22	Science
Charlie	25	History
Diana	23	Math
```

**Sort by the first column (name):**
```bash
sort students.txt
```

**Sort by the second column (age) numerically:**
```bash
sort -k2 -n students.txt
```

The output should show this:
```bash
Bob	22	Science
Diana	23	Math
Alice	25	Math
Charlie	25	History
```

- `-k2` specifies sorting by the second field (column)
- `-n` makes it numerical sorting
- By default, fields are separated by whitespace (spaces or tabs)
- Useful for sorting tabular data by any column

**Sort by the third column (subject):**
```bash
sort -k3 students.txt
```

The output should show this:
```bash
Charlie	25	History
Alice	25	Math
Diana	23	Math
Bob	22	Science
```

**Specify a delimiter:**

**Create a CSV file `data.csv`:**
```bash
Name,Age,City
Alice,25,New York
Bob,22,Los Angeles
Charlie,25,Chicago
```

**Sort by the second column (Age) in a CSV:**
```bash
sort -t',' -k2 -n data.csv
```

The output should show this:
```bash
Name,Age,City
Bob,22,Los Angeles
Alice,25,New York
Charlie,25,Chicago
```

- `-t','` specifies comma as the field delimiter
- `-k2` sorts by the second field
- `-n` for numerical sorting
- Essential for working with CSV files or other delimited data

#### Sorting large files: Handling memory limitations

Use the `sort` command with memory management options to sort very large files that might exceed available memory.

```bash
sort -T /tmp largefile.txt > sorted_largefile.txt
```

- The `-T` option specifies a temporary directory for sorting
- When memory is limited, `sort` uses disk space in the temp directory
- `/tmp` is a common temporary directory (you can use any writable directory)
- This allows sorting files larger than available RAM

**Specify buffer size:**
```bash
sort -S 1G -T /tmp hugefile.txt > sorted_hugefile.txt
```

- `-S 1G` sets the buffer size to 1 gigabyte
- Adjust based on available memory
- Useful for optimizing performance on large files

#### Combining multiple sort options

Use the `sort` command to combine multiple sorting options for complex sorting needs.

**Sort numerically, in reverse, and remove duplicates:**
```bash
sort -nru numbers.txt
```

**Sort case-insensitively and remove duplicates:**
```bash
sort -fu fruits.txt
```

**Sort by column, numerically, in reverse:**
```bash
sort -t',' -k2 -rn data.csv
```

You can combine multiple flags:
- `-n` (numerical) + `-r` (reverse) + `-u` (unique)
- `-f` (case-insensitive) + `-u` (unique)
- `-t` (delimiter) + `-k` (column) + `-n` (numerical) + `-r` (reverse)

**Key advanced sorting options:**
- `-r` / `--reverse` - Sort in reverse order
- `-u` / `--unique` - Remove duplicate lines
- `-k FIELD` - Sort by specific field/column
- `-t DELIMITER` - Specify field delimiter
- `-T DIR` - Use directory for temporary files
- `-S SIZE` - Set buffer size for sorting
- Combine flags as needed for your specific use case

### Command Chaining with `&&` and `||`

The `&&` (AND) and `||` (OR) operators chain commands based on their success or failure.

#### `&&` (AND operator)

Executes the next command only if the previous command succeeds (exits with status code 0).

```bash
mkdir newdir && cd newdir
```

Creates `newdir` and only changes into it if creation succeeds. If `mkdir` fails, `cd` won't execute.

**Multiple commands:**
```bash
mkdir project && cd project && touch README.md && ls -l
```

Each command executes only if the previous one succeeds. If any fails, the chain stops.

#### `||` (OR operator)

Executes the next command only if the previous command fails (exits with non-zero status code).

```bash
mkdir backup || echo "Directory already exists"
```

Attempts to create `backup`. If it fails, prints the message instead.

**Fallback commands:**
```bash
python3 script.py || python script.py || echo "Python not found"
```

Tries `python3`, then `python`, then prints error if both fail.

#### Combining `&&` and `||`

```bash
mkdir project && cd project && touch README.md || echo "Failed to set up project"
```

Creates directory, changes into it, creates file. If any step fails, prints error message.

**Key differences from pipes:**
- **Pipes (`|`)**: Pass output from one command to another as input
- **`&&`**: Execute next command only if previous succeeds
- **`||`**: Execute next command only if previous fails

### Redirecting Input and Output (Advanced)

**File Descriptors**

In Linux/Unix, every process has three standard file descriptors:
- **0 (stdin)** - Standard input (where commands read data from, typically the keyboard)
- **1 (stdout)** - Standard output (where commands write normal output, typically the terminal)
- **2 (stderr)** - Standard error (where commands write error messages, typically the terminal)

Understanding these file descriptors allows you to control where input comes from and where output goes.

**Redirecting input with `<`**

Create a text file `unsorted.txt` that contains:
```bash
banana
apple
strawberry
cherry
BLUEBERRY
```

Execute this command:
```bash
sort < unsorted.txt > sorted.txt
```

Observe the content in the output file `sorted.txt`. It should contain:
```bash
apple
banana
cherry
strawberry
```

- `< unsorted.txt` redirects the file contents to stdin (input) of the `sort` command
- `> sorted.txt` redirects stdout (output) to the file
- The command reads from the file instead of waiting for keyboard input

This works universally for any command. Try this: 
```bash
grep "berry" < logfile.txt > errors.txt
```

- `< logfile.txt` - Input comes from `logfile.txt`
- `grep "berry"` - Searches for lines containing "berry"
- `> errors.txt` - Output goes to `errors.txt`
- This filters the log file and saves matching lines to a new file

**Redirecting stderr with `2>`:**

```bash
find /nonexistent 2> errors.log
```

**Example output in `errors.log`:**
```bash
find: '/nonexistent': No such file or directory
```

- `2>` redirects stderr (file descriptor 2) to the file
- Normal output (stdout) still goes to the terminal
- Error messages are captured in the file instead of displaying on screen

**Redirecting both stdout and stderr:**

**Method 1: Redirect both separately**
```bash
command > output.txt 2> errors.txt
```

- `> output.txt` redirects stdout to `output.txt`
- `2> errors.txt` redirects stderr to `errors.txt`
- Normal output and errors go to different files

**Method 2: Redirect stderr to stdout with `2>&1`**
```bash
command > output.txt 2>&1
```

**Example:**
```bash
find . -name "*.txt" > results.txt 2>&1
```

- `> results.txt` redirects stdout to `results.txt`
- `2>&1` redirects stderr (2) to wherever stdout (1) is going
- Both normal output and errors go to the same file
- `&1` means "the same place as file descriptor 1"

**Redirect everything to /dev/null:**

```bash
command > /dev/null 2>&1
```

- `/dev/null` is a special device that discards all data
- `> /dev/null` discards stdout
- `2>&1` sends stderr to the same place (also discarded)
- Useful when you want to run a command but don't care about its output

**Combining input and output redirection:**

```bash
python script.py < input.txt > output.txt 2> errors.txt
```

- `< input.txt` - Script reads input from `input.txt`
- `> output.txt` - Script writes output to `output.txt`
- `2> errors.txt` - Script writes errors to `errors.txt`
- This is a complete I/O redirection setup

**Key concepts:**
- File descriptors: `0` (stdin), `1` (stdout), `2` (stderr)
- `<` redirects input (stdin)
- `>` redirects output (stdout)
- `2>` redirects errors (stderr)
- `2>&1` redirects stderr to wherever stdout is going
- `/dev/null` discards output

### User and Group Information

In codespace you're running your terminal session in an isolated single user environment. The prompt shows `@ksiller` which indicates the **GitHub username** of the codespace owner. But is that my user account on the system? Let's find out with the `whoami` command.

```bash
whoami
```

Your output may look like this:
```bash
vscode
```

The `whoami` command displays the username of the current user. In Codespaces, the system assigns a user account `vscode` (or similar) regardless of your GitHub username. The `@ksiller` in the prompt is just a display name, not the actual system user.

**What about the group?** You can check with the `groups` command.

```bash
groups
```

Your output may look like this:
```bash
vscode
```

Shows all groups that the current user belongs to. In this case, the user `vscode` belongs to the group `vscode`. Groups are used for managing file permissions and access control.

**Who else is in my group?**

```bash
getent group vscode   # replace vscode with your group name
```

Your output may look like this:
```bash
vscode:x:1000:vscode
```

- `vscode` - Group name
- `x` - Password field (usually `x` means password is stored elsewhere)
- `1000` - Group ID (GID)
- `vscode` - List of users in this group (comma-separated if multiple)

The `getent` command queries system databases (like `/etc/group`) to get information about groups, users, hosts, etc.

### Process Information

**View running processes:**

```bash
ps aux
```

Your output may look like this:
```bash
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
vscode       1  0.0  0.1  12345  6789 ?        Ss   14:30   0:00 /bin/bash
vscode      42  0.1  2.3  45678 12345 ?        S    14:31   0:05 python script.py
```

- `USER` - User running the process
- `PID` - Process ID (unique identifier)
- `%CPU` - CPU usage percentage
- `%MEM` - Memory usage percentage
- `COMMAND` - Command that started the process

**Find a specific process:**

```bash
ps aux | grep python
```

Your output may look like this:
```bash
vscode      42  0.1  2.3  45678 12345 ?        S    14:31   0:05 python script.py
```

- `ps aux` lists all running processes
- The `|` (pipe) sends that output to `grep`
- `grep python` filters to show only processes containing "python"
- Result: You see only Python-related processes, making it easier to find specific programs running on your system

### System Resources

**Monitor system resources interactively:**

```bash
htop
```

An interactive process viewer (if installed). Press `q` to quit. Shows CPU, memory usage, and running processes in real-time. More user-friendly than `top`.

**Check disk usage:**

```bash
df -h
```

Your output may look like this:
```bash
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        20G  5.2G   14G  28% /
```

- `-h` flag shows sizes in human-readable format (GB, MB)
- Shows filesystem size, used space, available space, and mount point
- Useful for checking if you're running out of disk space

**Check disk usage of current directory:**

```bash
du -sh .
```

Your output may look like this:
```bash
125M    .
```

- `-s` - Summary (total size only)
- `-h` - Human-readable format
- `.` - Current directory
- Shows total size of all files in the current directory and subdirectories

### File Permissions

1. Touch a file named `permission_test` and echo some content into it. 

2. Use `ls -al` to see it listed in your directory.

3. Now change its permissions to `000` like this:

```
chmod 000 permission_test
```

Try to `cat` the contents of the file. You should get a permission denied message.

4. Now change its permissions so that only you can read and write the file:

```
chmod 600 permission_test
```

Use `ls -al` again to see the permission bits for the file.

5. Finally, let's grant other members of your group read access, along with the access
we already gave you:

```
chmod 640 permission_test
```

List the directory contents once more with `ls -al` and notice the permission bits for the file.

Notice the full set of characters in the far left column:

```
-rw-r-----   1 nmagee  staff     0B Jan 16 09:27 permission_test
```

The first character represents what type of object it is, i.e. file (`-`), directory (`d`), link (`s`), etc.

The next 9 characters represent permissions for the USER (i.e. the owner), GROUP, and OTHER machine users.

Each of those entities can have any combination of `rwx` permissions, which stands for READ, WRITE, and EXECUTE. This applies both to files and directories.

So to see `rwxrwxrwx` means the user, group, and other users all have full permissions to read, write, and execute the file/folder. [**Read more here**](https://www.redhat.com/en/blog/linux-file-permissions-explained) about POSIX permissions.

As practice, you should now determine what command is required to allow the USER and GROUP read/write permissions to a file, but no access to OTHER users.

### File Permissions and Ownership

**Change file permissions:**

```bash
chmod 755 script.sh
```

- `755` means: owner can read/write/execute (7), group can read/execute (5), others can read/execute (5)
- `7` = 4 (read) + 2 (write) + 1 (execute)
- `5` = 4 (read) + 1 (execute)

**Change file ownership:**

```bash
chown user:group filename
```

Changes the owner and group of a file. Usually requires `sudo` (superuser privileges) unless you own the file.

**Create directory with specific permissions:**

```bash
mkdir -m 755 mydir
```

- The `-m` flag sets the permissions mode when creating a directory
- `755` means: owner can read/write/execute (7), group can read/execute (5), others can read/execute (5)
- `7` = 4 (read) + 2 (write) + 1 (execute)
- `5` = 4 (read) + 1 (execute)
- Useful when you need specific permissions from the start, rather than changing them later with `chmod`

These advanced commands help you understand and manage your system at a deeper level!

## Resources

[UVA Research Computing's Unix Tutorial](https://learning.rc.virginia.edu/tutorials/unix-tutorial/)