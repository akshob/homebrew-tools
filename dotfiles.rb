require "download_strategy"

class Dotfiles < Formula
    desc "A tool that executes a command on a remote machine while syncing files back and forth"
    homepage "https://github.com/akshob/dotfiles"
    url "https://github.com/akshob/dotfiles.git", :branch => "main"
    version "1.0.0"

    def install
        mkdir $HOME/.bash
        cp ./.bash/env $HOME/.bash/env
        cp ./.bash/interactive $HOME/.bash/interactive
        cp ./.bash/login $HOME/.bash/login
        cp ./.bash/logout $HOME/.bash/logout

        mkdir $HOME/.sh
        cp ./.sh/env $HOME/.sh/env
        cp ./.sh/interactive $HOME/.sh/interactive
        cp ./.sh/login $HOME/.sh/login

        mkdir $HOME/.shell
        cp ./.shell/env $HOME/.shell/env
        cp ./.shell/env_first_run $HOME/.shell/env_first_run
        cp ./.shell/env_functions $HOME/.shell/env_functions
        cp ./.shell/interactive $HOME/.shell/interactive
        cp ./.shell/login $HOME/.shell/login
        cp ./.shell/login_utils $HOME/.shell/login_utils
        cp ./.shell/logout $HOME/.shell/logout

        mkdir $HOME/.zsh
        cp ./.zsh/env $HOME/.zsh/env
        cp ./.zsh/interactive $HOME/.zsh/interactive
        cp ./.zsh/login $HOME/.zsh/login
        cp ./.zsh/logout $HOME/.zsh/logout

        cp ./.bash_logout $HOME/.bash_logout
        cp ./.bash_profile $HOME/.bash_profile
        cp ./.bashrc $HOME/.bashrc
        cp ./.profile $HOME/.profile
        cp ./.zshenv $HOME/.zshenv
        cp ./.zshrc $HOME/.zshrc
    end
end