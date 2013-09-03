---
title: "SSH shell wrapper to provide custom prompt"
tags: [Server, Guide, SSH]
---

Or: [How do you turn off login banner for non-interactive ssh?](http://www.linuxquestions.org/questions/showthread.php?p=4871626)

I figured out two methods to accomplish this task;

## 1. Using `command` in .authorized_keys 

In `~/.ssh/authorized_keys` you add the following before a specific key

    command="/usr/local/bin/shell-wrapper" ssh-rsa AAAAB3NzaC1yc2...JZK1E8H60=

READMORE

And in `/usr/local/bin/shell-wrapper`

```bash
#!/bin/sh
    
# If there is a command given, it executes it with the users shell 
# if no command given it outputs the contents of BANNER and starts
# the user's shell.
    
BANNER=/etc/issue.net
    
if [ -n "$SSH_ORIGINAL_COMMAND" ] ; then
  $SHELL -c "$SSH_ORIGINAL_COMMAND"
else
  cat $BANNER
  $SHELL
fi
```

**Downside of this method is that you have to set this for every rsa-key in the `.authorized_keys` file**

## 2. Changing the users shell

Set shell for user (change USERNAME to your user):

    usermod --shell /usr/local/bin/shell-wrapper USERNAME

Create `/usr/local/bin/shell-wrapper` with the following content:

```bash
#!/bin/sh
    
# If there are no arguments given, it outputs the contents of
# BANNER and starts the specified shell. When there are 
# arguments given it executes that with the specified shell
    
BANNER=/etc/issue.net
SHELL=/bin/sh
    
if [ $# -eq 0 ]; then
  cat $BANNER
  $SHELL
else
  shift
  $SHELL -c "$@"
fi
```