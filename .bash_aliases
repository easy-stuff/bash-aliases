alias nano='nano --smarthome --multibuffer --const --autoindent'

# systemctl
alias services='systemctl list-units --type=service --state=running,failed'
alias servicesall='systemctl list-units --type=service'
alias servicefailed='systemctl --failed'
alias servicestatus='sudo systemctl status'
alias serviceenable='sudo systemctl enable --now'
alias servicedisable='sudo systemctl disable'
alias servicestart='sudo systemctl start'
alias servicestop='sudo systemctl stop'
alias servicekill='sudo systemctl kill'
alias servicerestart='sudo systemctl restart'
alias servicereload='sudo systemctl reload'
alias boottime='systemd-analyze' # Tell how long it took to boot the system
alias boottimelist='systemd-analyze blame' # Tell how long it took to boot the system
alias bootchart='systemd-analyze plot > ./boot.svg && echo "Boot chart saved to ${PWD/#$HOME/~}/boot.svg"' # Generate a visual boot time analysis chart as a graphic SVG image
alias bootmessages='journalctl -b -k' # View kernel messages from current boot
alias bootprevious='journalctl -b -1 -k' # View kernel messages from previous boot
alias booterrors='journalctl -b -k -p warning..emerg' # Filter for warning and errors
alias bootlist='journalctl --list-boots' # List boots
alias clearsystemlogs='echo -ne "${BRIGHT_BLUE}Before${RESET}: "; journalctl --disk-usage; sudo journalctl --rotate; sudo journalctl --vacuum-time=1s; echo -ne "${BRIGHT_BLUE}After${RESET}: "; journalctl --disk-usage' # Clear system log entries from the systemd journal
alias rebootfast='systemctl soft-reboot' # Fast reboot user space and not the kernel

# ls
alias ls='lsd -AF --group-dirs first'
alias ll='lsd --almost-all --header --long --group-dirs first'
alias labc='lsd -lAv --header'
alias lx='lsd -lAXh --header'
alias lk='lsd -lASrh --header'
alias lt='lsd -lAtrh --header'
alias lc='command ls -lAcrh --color=always --header'
alias lu='command ls -lAurh --color=always --header'
alias new='lsd -lAtr --almost-all | tail -10 | tac'
alias ltree='command lsd --almost-all --blocks permission,user,size,date,name --group-dirs first --header --long --tree'

# dir
alias dir='dir --color=auto  --almost-all --human-readable --group-directories-first -F'
alias vdir='vdir --color=auto'

# navigation
alias ..='up 1'
alias ...='up 2'
alias ....='up 3'
alias .....='up 4'
alias ......='up 5'
alias ..1='up 1'
alias ..2='up 2'
alias ..3='up 3'
alias ..4='up 4'
alias ..5='up 5'

# file management
alias mkdir='mkdir -p'
alias rmd='rm --recursive --force --verbose'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias mx='chmod a+x'


# disk space stuffs
alias lll='duf -only local' # sudo pacman -S duf
alias totalsize='du -sh'
alias folders='du -kh --max-depth=1'

# tail (for logs)
alias logview='sudo tail -f'
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# datetime stuff
alias now='date +"%T"'
alias today='date +"%Y-%m-%d"'

# termdown / sudo pacman -S termdown
alias termdown='termdown --blink --end --critical 10 --font doh'
alias countdown="termdown --help | sed -n '/Options\:/q;p'"
alias timer='termdown'
alias clock='termdown --time'

# hardware resources
alias free='free -h'
alias cpu='ps aux | sort -r -nk +4 | head | $PAGER'
alias cpuinfo='lscpu | $PAGER'
alias usb='lsusb -t'
alias pci='lspci -tv'

# network stuff
alias ping='ping -c 5'
alias fastping='ping -c 100 -i.2' # no 1 second interval
alias ports='netstat -tulanp'
alias {iplocal,ipprivate}="ip -br -c a"
alias ippublic='wget -O - -q icanhazip.com && echo'
alias iotop='sudo iotop -o -a' # sudo pacman -S iotop


# visual
alias dmesg='dmesg --color'
alias cls='clear'

# MISCELLANEOUS
alias kernelerrors='sudo dmesg | grep -iE "error|fail|warn|critical|panic|oops|segfault|timeout|refused|denied|unable|cannot|invalid|corrupt|bad|broken|missing|not found|no such|permission denied"'
alias whichtty='tty | sed -e "s:/dev/::"'

alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias base64='openssl base64'
alias md5sum='openssl md5'
alias sha1='openssl sha1'

# pacman -S glow
alias glow='glow --all --pager'
alias glowsafe='glow --all --pager --local'
alias json='jless'

# flatpak
alias flatpakhas='flatpak info'
alias flatpakcheck='flatpak update --appstream && flatpak remote-ls --updates'
alias flatpakupdate='flatpak update --appstream && flatpak update'
alias flatpakinstall='flatpak install'
alias flatpakremove='flatpak uninstall'
alias flatpakwipe='flatpak uninstall --delete-data'
alias flatpakclean='flatpak repair && flatpak uninstall --unused'
alias flatpaksearch='flatpak search'
alias flatpaklist='flatpak list --columns=name,app:f,version:e,description:e --app'
alias flatpaksize='flatpak list --columns=app:f,name,size:f,installation:e'
alias flatpakremotes='flatpak remotes --show-details'
if [ -d "/var/lib/flatpak/exports/share/applications/" ]; then
	alias flatpakmakeicons='command cp /var/lib/flatpak/exports/share/applications/*.desktop ~/.local/share/applications/'
else
	alias flatpakmakeicons='find /var/lib/flatpak/app/ -type f -iname "*.desktop" -exec cp {} ~/.local/share/applications \;'
fi


# alias xxxxx='xxxx'