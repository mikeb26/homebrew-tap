class Chesstools < Formula
  desc "Chess Tools"
  homepage "https://github.com/mikeb26/chesstools"
  url "https://github.com/mikeb26/chesstools/archive/refs/tags/v0.10.6.tar.gz"
  sha256 "e026c0b2fc9f2de2591d1fcf3cd4a8e34031ec86402740b9edc59c2b25b1f21c"
  license "MIT"
  head "https://github.com/mikeb26/chesstools.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/ct/version.txt", "v0.10.6b"
    system "make", "build"
    bin.install "ct"
  end

  test do
    assert_match "chesstools-", shell_output("#{bin}/ct version")
  end
end
