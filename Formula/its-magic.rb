# typed: strict
# frozen_string_literal: true

# Homebrew formula for the its-magic CLI installer.
class ItsMagic < Formula
  desc "AI development workflow toolkit for multi-agent teams"
  homepage "https://github.com/USER/its-magic"
  # UPDATE: url, version, and sha256 after each release (`curl -sL <url> | shasum -a 256`)
  url "https://github.com/fl0wm0ti0n/its-magic/archive/refs/tags/v0.1.8.tar.gz"
  version "0.1.8"
  # UPDATE sha256 when the tag tarball is published: curl -sL <url> | shasum -a 256
  sha256 "5d70a961ef378c33dfe7f4308daa180b1c7c765045188ba69a79d3a3403f3d1e"
  license "MIT"

  def install
    libexec.install Dir["*"]
    # Create a shell wrapper that calls installer.sh directly (no Node.js needed)
    (bin/"its-magic").write <<~SH
      #!/bin/bash
      exec sh "#{libexec}/installer.sh" "$@"
    SH
    chmod 0755, bin/"its-magic"
  end

  def caveats
    <<~EOS

        ██╗████████╗███████╗      ███╗   ███╗ █████╗  ██████╗ ██╗ ██████╗
        ██║╚══██╔══╝██╔════╝      ████╗ ████║██╔══██╗██╔════╝ ██║██╔════╝
        ██║   ██║   ███████╗█████╗██╔████╔██║███████║██║  ███╗██║██║
        ██║   ██║   ╚════██║╚════╝██║╚██╔╝██║██╔══██║██║   ██║██║██║
        ██║   ██║   ███████║      ██║ ╚═╝ ██║██║  ██║╚██████╔╝██║╚██████╗
        ╚═╝   ╚═╝   ╚══════╝      ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝ ╚═════╝

                           AI dev team
                      Installation complete!

      Run: its-magic --help
    EOS
  end

  test do
    system "#{bin}/its-magic", "--target", testpath, "--mode", "missing"
  end
end




