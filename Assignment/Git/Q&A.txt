Q1. How do you set up a script to run every time a repository receives new commits through push?

Ans:  To run a script every time a repository receives new commits through a push, you can use a Git hook called a post-receive hook. The post-receive hook is triggered after the push operation has completed successfully.

      Here's a step-by-step guide to setting up a post-receive hook:

      1. Access the server or the machine where your Git repository is hosted. This could be a remote server or your local machine acting as a server.

      2. Navigate to the repository's Git directory. This is typically located in the `.git` folder within your repository's root directory.

      3. Look for the `hooks` directory inside the `.git` folder. If it doesn't exist, create it.

      4. Inside the `hooks` directory, create a new file called `post-receive` (no file extension). You can use a command-line text editor like `nano` or `vim` to create the file.

      5. Open the `post-receive` file and add the necessary code or commands that you want to run whenever new commits are pushed. This can be any shell script or command that you want to execute.

         For example, if you want to run a shell script located in the repository's root directory, you can use the following code in the `post-receive` file:

         ```bash
         #!/bin/bash

         # Change to the repository's root directory
         cd /path/to/repository

         # Execute your script
         ./your-script.sh
         ```

         Make sure to replace `/path/to/repository` with the actual path to your repository and `./your-script.sh` with the actual command or script you want to run.

      6. Save the `post-receive` file and exit the text editor.

      7. Make the `post-receive` file executable by running the following command:

         ```bash
         chmod +x post-receive
         ```

      8. Test the hook by pushing new commits to the repository. The `post-receive` hook should now be triggered, and your script or commands will run.

      Remember that the `post-receive` hook is executed on the server-side after the push operation, so make sure the necessary dependencies, paths, and permissions are correctly set up for your script to run successfully.


Q2. How do you find a list of files that have changed in a particular commit?

Ans:  To find a list of files that have changed in a particular commit, you can use the `git diff` command with the `--name-only` option. Here's how you can do it:

      1. Open a terminal or command prompt.

      2. Navigate to the repository's directory using the `cd` command.

      3. Run the following command, replacing `commit_hash` with the hash or identifier of the commit you're interested in:

         ```bash
         git diff --name-only commit_hash^ commit_hash
         ```

         The `commit_hash^` notation represents the commit before `commit_hash`. This command compares the changes between the specified commit and its parent commit.

         If you want to compare the commit with the previous commit on the same branch, you can use the following command instead:

         ```bash
         git diff --name-only commit_hash~1 commit_hash
         ```

      4. Press Enter to execute the command.

      Git will then display a list of file paths that have changed in the specified commit. Each file path will be listed on a separate line.

      Note that the `--name-only` option instructs Git to only display the names of the changed files without additional context or diff details. If you want to see the actual changes in the files, you can omit the `--name-only` option from the command.

      Additionally, if you want to see the changed files between two specific commits (not necessarily the current commit), you can replace `commit_hash^` or `commit_hash~1` with the corresponding commit hashes or identifiers.