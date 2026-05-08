class Aurex < Formula
  desc "Small build tool for Java applications"
  homepage "https://github.com/Sammers21/aurex"
  version "0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Sammers21/aurex/releases/download/0.1/ax-macos-arm64", using: :nounzip
      sha256 "045ad456bf4d3f3fda92abaa404cfdd5a85238b1c80114e951415c61b692ff5b"
    end

    on_intel do
      url "https://github.com/Sammers21/aurex/releases/download/0.1/ax-macos-x64", using: :nounzip
      sha256 "82e5eb19c214f62796b9016846fc2a0c561ad0a43b69ec79973c0f65789c254a"
    end
  end

  def install
    binary = Dir["ax-macos-*"].first
    chmod 0755, binary
    bin.install binary => "ax"
  end

  test do
    assert_match "Aurex", shell_output("#{bin}/ax --help")
  end

  def caveats
    <<~EOS
      ax uses java and javac from PATH when building or running projects.
    EOS
  end
end
