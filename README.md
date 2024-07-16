# SSH Launcher
## Why?
I have moved away from putty, or mtputty in favor for using native ssh since its available in modern windows.  I found myself always connecting to the same handful of servers and found this to be convenient.

On its own, the powershell script doesn't add much value, but when combined with Windows Terminal its great because I can set a Windows Terminal Profile to launch the script automatically and just dump me into the menu.

## RSA Keys
This script is most convenient if you use RSA Keys to authenticate, but this does take some additional effort because you need to make sure you have an RSA key pair, and make sure your public key is in the "authorized_keys" file on the destination system.  If the destination system is windows you may need to add it to the system administration profile, rather than the target user profile.

## Helpful Information/Links/Etc
### RSA Keys
- To generate a new RSA key, open powershell and run this:
  - ```ssh-keygen```
  - If desired, put a password on the RSA key, but I personally find that in most situations it just removes all convenience of using RSA keys.

- You should now have two files:
  - %userprofile%/.ssh/id_rsa (this is the private key)
  - %userprofile%/.ssh/id_rsa.pub (this is the public key)

- Copy the public key to your target computer
  - In windows this has to be done manually.
  - On your local workstation:
    - Open id_rsa.pub in notepad and copy everything.
  - Now SSH into your remote system like normal.
    - open ```~/.ssh/authorized_keys``` in whatever editor you use.
    - go to the end of the last line in the file.
    - create a new line and paste the content of your id_rsa.pub file.
    - save and close the file.
    - exit ssh.

- To test ssh into the system again, if you didn't put a password on the key you'll automatically drop to the command prompt.

#### Additional Info:
- https://www.redhat.com/sysadmin/key-based-authentication-ssh
- Note that the "ssh-copy-id" command is not available in windows.

### Terminal
- https://learn.microsoft.com/en-us/windows/terminal/customize-settings/profile-advanced
- https://windowsterminalthemes.dev/
### OpenSSH for Windows
- https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui

### Powershell 7
- https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4


