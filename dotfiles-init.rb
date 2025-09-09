class DotfilesInit < Formula
  desc "Initialize shell startup files"
  homepage "https://github.com/akshob/dotfiles"
  url "https://github.com/akshob/dotfiles/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "b41b7f5f846180af0d0e100444cd83ef0798a8a3223a2fb7c0d5ba80947b52fc"
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
    assert_path_exists testpath/".bash"
    assert_path_exists testpath/".sh"
    assert_path_exists testpath/".shell"
    assert_path_exists testpath/".zsh"
    assert_path_exists testpath/".bash_logout"
    assert_path_exists testpath/".bash_profile"
    assert_path_exists testpath/".bashrc"
    assert_path_exists testpath/".profile"
    assert_path_exists testpath/".zshenv"
    assert_path_exists testpath/".zprofile"
    assert_path_exists testpath/".zshrc"
  end
end
