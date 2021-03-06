## pip
pip_folder="$HOME/.local/bin"
##
## yarn/npm
prefix_folder="$HOME/.node-packages"
prefix_bin="$prefix_folder/bin"
mkdir -p "$prefix_bin"
export PREFIX="$prefix_folder"
##
## composer
export COMPOSER_HOME="$HOME/.config/composer"
composer_folder="$COMPOSER_HOME/vendor/bin"
##
## sicstus
sicstus_folder_inc='/opt/sicstus'
sicstus_folder="$(ls -dvr "$sicstus_folder_inc"* | head -n 1)/bin"
##
## ruby
ruby_folder="$(ruby -e "print Gem.user_dir")/bin"
##
## colorgcc
colorgcc_folder='/usr/lib/colorgcc/bin/'
##
## golang
export GOPATH="$HOME/data/golang"
##
## pre-compiled binaries from other sources
home_opt_bin_folder="$HOME/data/opt/bin"
##

export PATH="$HOME/data/bin:$pip_folder:$prefix_bin:$composer_folder:$sicstus_folder:$ruby_folder:$colorgcc_folder:$GOPATH/bin:$home_opt_bin_folder:$PATH"

export CCACHE_PATH='/usr/bin'
export CCACHE_DIR='/tmp/ccache'
export PAGER='less'
export LESS=' -x4RFsXmgiJ '
export LESSOPEN="| $(which highlight) %s --out-format xterm256 --line-numbers --quiet --force --style solarized-dark"
export EDITOR=nvim
export BROWSER=chromium
export _JAVA_AWT_WM_NONREPARENTING=1
# export SWT_GTK3=0

export CHROMIUM_USER_FLAGS="$(cat "$HOME/.config/chromium-flags.conf" | tr '\n' ' ')"

export TMPDIR="/tmp/$LOGNAME"
mkdir -p -m 700 "$TMPDIR/tmpDownloads"
export TMPPREFIX="${TMPDIR%/}/zsh"
mkdir -p -m 700 "$TMPPREFIX"

# Add nix profile to path
nix_init_script="$HOME/.nix-profile/etc/profile.d/nix.sh"
if [[ -f "$nix_init_script" ]]; then
  source "$nix_init_script"
fi

xrandr --setprovideroffloadsink 0x41 0x68
