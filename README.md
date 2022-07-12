# .dots

[WIP] This repo contain all my dotfiles for my Arch linux, including config for AwesomeWM and Neovim

<details>
  <summary>PERSONAL'S NOTE</summary>

  <details>
    <summary>Noatime</summary>

Change in `/etc/fstab`:

```
UUID="UUID" "mount point" "file system" rw,noatime,...
```

  </details>

  <details>
    <summary>Use Google DNS</summary>

In `/etc/resolv.conf`, add this:

```
options timeout:1
options single-request

nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 1.1.1.1
```

  </details>

  <details>
    <summary>Silent boot</summary>

Follow silent boot guide on arch linux wiki

  </details>

  <details>
    <summary> Dotdrop </summary>

Setup and install

```
cd ~/.dots
pip3 install -r dotdrop/requirements.txt --user
./dotdrop.sh --cfg=~/.dots/cconfig.yaml install
```

  </details>

  <details>
  <summary> GTK Theme I use </summary>

-   GRUB theme: [Sleek orange](https://www.gnome-look.org/p/1414997/) (using install script in the package)
-   Cursor theme: [sweet cursor (git)](https://aur.archlinux.org/sweet-theme-nova-git.git), [breeze hacked](https://github.com/clayrisser/breeze-hacked-cursor-theme)
-   Install via aur, use lxappearance to set, breeze hacked must have all dependencies installed
-   Icons: [candy icons](https://aur.archlinux.org/candy-icons-git.git`)
-   Install via aur, use lxappearance to set

  </details>

  <details>
  <summary> Writing vietnamese in arch </summary>

Download ibus and ibus-bamboo:

```
$ sudo pacman -S ibus
and
$ yay -S ibus-bambo
```

Open terminal, run `ibus-setup`

-   On tab "Input Method"
-   You can remove another method and keep "English - English (US)"
-   Click "Add"
-   Click on the three dot
-   Choose Vietnamese or type "Vietnamese" in the search bar
-   Choose "Bamboo"
-   Now you can close

Back to terminal:

```
$ sudo $EDITOR ~/.bashrc (or .zshrc, etc)
[...]
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=xim
```

Add this in your start up application (i.e i'm using awesomewm):

```
[...]
awful.spawn.with_shell("ibus-daemon -drx")
[...]
```

Reboot, enjoy!

  <details>
  <summary><i>IBBB's Note</i></summary>

<i>If you encountered a problem, I suggest first visit [Ibus-bamboo Wiki](https://github.com/BambooEngine/ibus-bamboo/wiki)</i>

Some other window manager have different syntax of autostart, the program to execute is 'ibus-daemon -drx'

To fix facebook bug, click on any input box, press `Shift + ~` and choose the third one (or the forth one)

If you still can't type Vietnamese, run:

```
$ ibus-daemon -drx

and

$ ibus restart
```

and restart your DE or WM

Autofill bug in firefox: open `about:config`, change `browser.urlbar.autofill` to <i>`false`</i>

</details>
  </details>
</details>
