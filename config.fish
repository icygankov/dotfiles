if status is-interactive # Commands to run in interactive sessions can go here end
end

set XDG_SESSION_TYPE wayland
set QT_QPA_PLATFORM wayland
set QT_STYLE_OVERRIDE kvantum
set QT_QPA_PLATFORMTHEME qt5ct
set QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set QT_AUTO_SCREEN_SCALE_FACTOR 1
set MOZ_ENABLE_WAYLAND 1

bind \; accept-autosuggestion

fzf_configure_bindings --directory=\cf --variables=\e\cv
set fzf_preview_dir_cmd eza --all --color=always
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"

alias dzbmngr="/home/ivan/git/dezirepo/tools/build_scripts/manage.py"

alias ls="eza --icons=always"
alias ll="ls -l"
alias lla="ls -la"

zoxide init fish | source
starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/ivan/.ghcup/bin # ghcup-env
