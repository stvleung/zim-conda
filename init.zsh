MINICONDA_PREFIX="${MINICONDA_PREFIX:-$HOME/miniconda3}"

__conda_aliases() {
    # From Oh My Zsh
    # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/conda/conda.plugin.zsh
    alias cna='conda activate'
    alias cnab='conda activate base'
    alias cncf='conda env create -f'
    alias cncn='conda create -y -n'
    alias cnconf='conda config'
    alias cncp='conda create -y -p'
    alias cncr='conda create -n'
    alias cncss='conda config --show-source'
    alias cnde='conda deactivate'
    alias cnel='conda env list'
    alias cni='conda install'
    alias cniy='conda install -y'
    alias cnl='conda list'
    alias cnle='conda list --export'
    alias cnles='conda list --explicit > spec-file.txt'
    alias cnr='conda remove'
    alias cnrn='conda remove -y -all -n'
    alias cnrp='conda remove -y -all -p'
    alias cnry='conda remove -y'
    alias cnsr='conda search'
    alias cnu='conda update'
    alias cnua='conda update --all'
    alias cnuc='conda update conda'
}

# Activate miniconda
__conda_setup="$("${MINICONDA_PREFIX}/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
    __conda_aliases
else
    if [ -f "${MINICONDA_PREFIX}/etc/profile.d/conda.sh" ]; then
        . "${MINICONDA_PREFIX}/etc/profile.d/conda.sh"
        __conda_aliases
    else
        export PATH="${MINICONDA_PREFIX}/bin:$PATH"
    fi
fi
unset __conda_setup

unset -f __conda_aliases
