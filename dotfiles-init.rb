class DotfilesInit < Formula
  desc "Initialize shell startup files"
  homepage "https://github.com/akshob/dotfiles"
  url "https://github.com/akshob/dotfiles/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e6cf9422e25658a63ac6164802448fb296d7b0469be4bb43e30922efb4dcb9fa"
  license "MIT"

  def install
    include.install ".bash"
    include.install ".sh"
    include.install ".shell"
    include.install ".zsh"
    include.install ".bash_logout", ".bash_profile", ".bashrc",
                    ".profile", ".zshenv", ".zshrc"
    bin.install "dotfiles-init"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    system "false"
  end
end
  