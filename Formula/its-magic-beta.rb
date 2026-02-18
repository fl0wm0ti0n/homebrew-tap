class ItsMagicBeta < Formula
  desc "its-magic - AI dev team workflow (beta)"
  homepage "https://github.com/USER/its-magic"
  # UPDATE: url and sha256 after each beta release
  url "https://github.com/fl0wm0ti0n/its-magic/archive/refs/tags/v0.1.2-13.tar.gz"
  sha256 "9835741c568d1367d482fadbcb767379bb454e5566c1459a8199d9230a5d90ea"
  version "0.1.2-13"
  license "MIT"

  conflicts_with "its-magic", because: "beta and stable share the same binary"

  def install
    libexec.install Dir["*"]
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
                   Installation complete! (beta)

      Run: its-magic --help
    EOS
  end

  test do
    system "#{bin}/its-magic", "--target", testpath, "--mode", "missing"
  end
end

















