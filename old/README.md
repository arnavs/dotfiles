# dotfiles

Scripts and dotfiles for a new OSX machine. 

I got the idea from my former classmate [Michael Cai](https://github.com/caimichael/dotfiles) and his colleague [Pearl Li](https://github.com/pearlzli/dotfiles).

## Install 

```
./init.sh /path/to/repo
```

(might need to `chmod +x` the script and `init_utils.sh`)

And install `prefs.terminal` if you want to try my color scheme.

## Notable Features

* **Touch ID to sudo**: Add the line in `etc-pam.d-sudo` to `/etc/pam.d/sudo`.

* **Tab-Complete Branches**: Add the `.git-completion.bash` script to your home directory, and add this to your `.bashrc`:

```
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
```

* **Delete Secondary Git Branches**: Add `alias gbr="git branch | grep -v "main" | xargs git branch -D"` to your `.bashrc`.

* **`umbrella-breaker`**: Script (in `/scripts`) to disable Cisco Umbrella packet filtering when you're not connected to VPN. (See this blog post: ["Cisco Umbrella is Malware"](https://kymidd.medium.com/cisco-umbrella-is-spyware-a24f82706849).)

* **Wifi-Password**: Run `brew "wifi-password"`, and it gives you a utility to display the password of whatever network you're on from Terminal.