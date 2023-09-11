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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/zhouhao/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/zhouhao/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/zhouhao/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/zhouhao/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<
# export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH
