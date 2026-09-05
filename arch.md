-------------------------------------------------------------------------------
## Prerequites
-------------------------------------------------------------------------------
# Disable UEFI secure boot
# Disable fast startup and hibernation
- powercfg /H off

-------------------------------------------------------------------------------
## Arch-Linux configuration
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
## Internet (wifi via iwctl)
-------------------------------------------------------------------------------
# List network interfaces
-> ip link set 'wlan0' up
# Interface via internet wireless control utility
-> iwctl
-> station wlan0 connect 'wifi-name'
# Test connection
-> ping google.com

-------------------------------------------------------------------------------
## Partition Drive
-------------------------------------------------------------------------------
# List current partitions
->  lsblk

# Create arch linux partitions 
# EFI System (1G)
# Swap (2x ram size)
# Linux file system (Remaining memory)
->  cfdisk 'drive-name'

-------------------------------------------------------------------------------
## Format partitions
-------------------------------------------------------------------------------
# Format EFI system partition
-> mkfs.vfat -F32 'drive-name/paritition-name'
# Format swap parition
-> mkswap 'drive-name/paritition-name'
# Activate swap partition
-> swapon 'drive-name/paritition-name'
# Format linux file system (ext4 or btrfs)
-> mkfs.ext4 'drive-name/paritition-name'
-> mkfs.btrfs 'drive-name/paritition-name'

-------------------------------------------------------------------------------
## Configure archinstall
-------------------------------------------------------------------------------
-> archinstall
# Mirror
-> USA
# Disk Config (ensure to modify for erasure/formatting)
-> Manual parition
--> EFI (mount /boot)
--> LinuxFS (mount /)
# Encryption
-> LUKS (password and select drive)

-> Grub
-> Linux-Hardened or Linux-Zen
# Profile
-> admin -> password
# Network Configuration
-> Use/import current settings
# Additional Packages
-> base base-devel os-prober git git-cli zsh neovim tmux vivaldi

-------------------------------------------------------------------------------
## Post-install internet (wifi via NetworkManager)
-------------------------------------------------------------------------------
# List devices
-> nmcli device wifi list
# Interface via NetworkManager
-> nmcli device wifi connect 'wifi-name' password 'password'

-------------------------------------------------------------------------------
## Hyprland configuration
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
# Install arch user repository
-------------------------------------------------------------------------------
# Create repositories folder
-> mkdir -p ~/Repositories/
# Clone paru
-> git clone https://aur.archlinux.ord/paru.git
--> cd paru && makepkg -si

-------------------------------------------------------------------------------
# Install hyprland configuration
-------------------------------------------------------------------------------
# Clone hyprdots configuration 
-> gh repo clone sudoCompetence/.dotfiles
# Run hyprland configuration 
-> ./setup install

-------------------------------------------------------------------------------
## Post-install configuration
-------------------------------------------------------------------------------
-> paru -S zotero notion-app-electron notion-calendar-electron
-> paru -S zsh-theme-powerlevel10k zsh-autosuggestions zsh-syntax-highlighting
# Zsh
-> gh repo clone sudoCompetence/zsh ~/.config/zsh
--> move .zshenv to $HOME/.zshenv
-> chsh -s /bin/zsh
# Neovim
-> gh repo clone sudoCompetence/NvChadConfig ~/.config/nvim
# Tmux
-> gh repo clone sudoCompetence/OhMyTmuxConfig ~/.config/tmux

-------------------------------------------------------------------------------
## Grub (Startup)
-------------------------------------------------------------------------------
# Intall theme
-> /boot/grub/themes/
# Configure GRUB
-> nvim /etc/default/grub
--> GRUB_DISABLE_OS_PROBER=false
--> GRUB_THEME="/boot/grub/themes/Xenlism-Arch/theme.txt"
-> sudo os-prober && grub-mkconfig -o /boot/grub/grub.cfg

-------------------------------------------------------------------------------
# SDDM (Login)
-------------------------------------------------------------------------------
# Intall theme
-> /usr/share/sddm/themes/
# Configure theme
-> sudo nvim /etc/sddm.conf
-> sudo nvim /usr/lib/sddm/sddm.conf.d/default.conf
--> Current=theme-name

