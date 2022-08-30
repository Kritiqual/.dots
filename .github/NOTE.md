# <center>This is my personal note</center>

## TODO track list
| What?                     | Done? |     On going?      |
| ------------------------- | :---: | :----------------: |
| Wezterm config            |   -   | :heavy_check_mark: |
| Zsh plugins customization |   -   | :heavy_check_mark: |
| Kasis                     |   -   | :heavy_check_mark: |
| Pacman_fzf                |   -   | :heavy_check_mark: |
| Dotdrop for etc/root      |   -   | :heavy_check_mark: |
| Use dotbare?              |   -   | :heavy_check_mark: |

## Stuff
| **What?**   | **Where?**                      | **How?**                                                                                                                     |
| ----------- | ------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Noatime     | `/etc/fstav`                    | `UUID="UUID" "mount point" "file system" rw,noatime,...`                                                                     |
| Google DNS  | `/etc/resolv.conf`              | <pre>options timeout:1<br>options single-request<br><br>nameserver 8.8.8.8<br>nameserver 8.8.4.4<br>nameserver 1.1.1.1</pre> |
| Silent boot | -                               | Follow Arch wiki on Silent boot article                                                                                      |
|             |                                 |                                                                                                                              |
| Dotdrop     | Cd into dotfiles repo           | `$ cd ~/.dots`                                                                                                               |
|             | Install required python library | `$ pip3 install-r dotdrop/requirements.txt --user`                                                                           |
|             | Install dotfiles                | `$ ./dotdrop.sh --cfg=~/.dots/config.yaml install`                                                                           |
