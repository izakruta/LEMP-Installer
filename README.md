# Quick LEMP stack Installer srcipt

Supported Operating Systems:

- Arch
- Debian/Ubuntu
- Linux mint
- Raspbian
- Mac [Feature Request](https://github.com/thamaraiselvam/LEMP-Installer/issues/7) - Feel free to contribute

Steps:

1. Clone this repository
2. `cd LEMP-install`
3. `chmod +x lemp.sh` this command makes bash script executable
4. `./lemp.sh` or `./lemp.sh $YOUR_MYSQL_ROOT_PASSWORD` (only for debian based distributions)

That's it :)

PHP latest version - v7.3

Mysql version - Latest Stable

Note: The default mysql `root` user password is empty unless you provide it as an argument to the script.
