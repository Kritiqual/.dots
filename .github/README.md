# <center>.dots</center>
```lua
return {
	os = { "Archlinux", tool = "kasis" }, --btw
	wm = function(rep)
		pure = {
			main = "awesome-git",
			compositor = {
				name = "picom-git",
				fork = { "jonaburg" },
			},
		}
		per = { "rofi", "eww", "polybar" }
		if rep then
			return { pure, per }
		end
		return pure
	end,

	shell = { "zsh", plugins_manager = "zi" },
	editor = {
		gui = { "vscode", "vscode-insiders" },
		cli = { "neovim-git", gui = "neovide" },
	},
	monitor = { "bpytop" },
	music = { "mpd", { "ncmpcpp" } },
	file_manager = { { "ranger" }, { "thunar" } },
	useful_app = {
		{ "fd", "rg", "exa" },
		{ "fzf", "pacman_fzf" },
	},
}

```

# THEME
| Theme        | Link                                                    | AUR                                                                                   | Note                                                              |
|--------------|---------------------------------------------------------|---------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| GRUB theme   | [sleek orange](https://www.gnome-look.org/p/1414997/)   | N/A                                                                                   | using install script in its folder                                |
| Cursor theme | [Sweet cursor](https://www.gnome-look.org/p/1393084/)   | [sweet-cursor-theme-git](https://aur.archlinux.org/packages/sweet-cursor-theme-git)   | Use lxappearance to set theme                                     |
| Icons theme  | [candy icons](https://www.gnome-look.org/p/1305251/)    | [candy-icons-git](https://aur.archlinux.org/packages/candy-icons-git)                 | Use lxappearance to set this first,                               |
| -            | [Sweet folders](https://www.gnome-look.org/p/1284047/)  | [sweet-folders-icons-git](https://aur.archlinux.org/packages/sweet-folders-icons-git) | then set this                                                     |
| Color theme  | [GTK sweet dark](https://www.gnome-look.org/p/1253385/) | [gtk-theme-sweet-dark](https://aur.archlinux.org/packages/sweet-gtk-theme-dark)       | Use lxappearance to set theme                                     |
| -            | [Sweet kvantum](https://store.kde.org/p/1294013/)       | [kvantum-theme-sweet-git](https://aur.archlinux.org/packages/kvantum-theme-sweet-git) | Use qt5ct to set icons theme and <br>kvantum manager to set theme |
