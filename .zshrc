export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source "$HOME/.cargo/env"


alias nvim-lunar="lvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"

function nvims() {
  # items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  items=("default" "kickstart")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config="kickstart"
  fi
  NVIM_APPNAME=$config nvim $@
}

function proxy() {
  items=("set" "test" "unset")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt="proxy config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config="set"
  fi
  source ~/proxy.sh $config
}

bindkey -s ^a "nvims\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
