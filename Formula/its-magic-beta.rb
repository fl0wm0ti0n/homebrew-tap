class ItsMagicBeta < Formula
  desc "its-magic - AI dev team workflow (beta)"
  homepage "https://github.com/USER/its-magic"
  # UPDATE: url and sha256 after each beta release
  url "https://github.com/fl0wm0ti0n/gsd_cursor/archive/refs/tags/v0.1.2-4.tar.gz"
  sha256 "2d88b74aafffb8e6282559b0038889a4c9179d5db2a12bffd7822b082425aa09"
  version "0.1.2-4"
  license "MIT"

  depends_on "node"

  conflicts_with "its-magic", because: "beta and stable share the same binary"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/its-magic.js" => "its-magic"
  end

  test do
    system "#{bin}/its-magic", "--help"
  end
end










