class DotfilesInit < Formula
  desc "Initialize shell startup files"
  homepage "https://github.com/akshob/dotfiles"
  url "https://github.com/akshob/dotfiles/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "b71be14481d9263d92692f6301bb0fb2f95edb7957627a65ff5d7d836ab791da"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  def install
    include.install ".bash", ".sh", ".shell", ".zsh"
    include.install ".bash_logout", ".bash_profile", ".bashrc",
                    ".profile", ".zshenv", ".zprofile", ".zshrc"
    bin.install "dotfiles-init"
    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  def caveats
    <<~EOS
      All shell dotfiles are installed in your Cellar.
      You need to run dotfiles-init to copy them to your home directory

      If you have any private functions you want to include in your shell
      add those links to ~/.secret_links (one link per line).
      When you run dotfiles-init all valid links will be curl'd and
      appended to ~/.shell/login_secret
      (and it will be loaded automatically when you re-launch)
    EOS
  end

  test do
    system bin/"dotfiles-init"
    assert_predicate testpath/".bash", :exist?
    assert_predicate testpath/".sh", :exist?
    assert_predicate testpath/".shell", :exist?
    assert_predicate testpath/".zsh", :exist?
    assert_predicate testpath/".bash_logout", :exist?
    assert_predicate testpath/".bash_profile", :exist?
    assert_predicate testpath/".bashrc", :exist?
    assert_predicate testpath/".profile", :exist?
    assert_predicate testpath/".zshenv", :exist?
    assert_predicate testpath/".zprofile", :exist?
    assert_predicate testpath/".zshrc", :exist?
  end
end
