class Chesstools < Formula
  desc "Chess Tools"
  homepage "https://github.com/mikeb26/chesstools"
  url "https://github.com/mikeb26/chesstools/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "70d6fd080bbebbad07e3d4fe5d6fc57fc094862965844ba002017cca194fc8e6"
  license "MIT"
  head "https://github.com/mikeb26/chesstools.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/ct/version.txt", "v0.11.0b"
    system "make", "build"
    bin.install "ct"
  end

  test do
    assert_match "chesstools-", shell_output("#{bin}/ct version")
  end
end
