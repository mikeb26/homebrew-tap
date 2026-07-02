class Chesstools < Formula
  desc "Chess Tools"
  homepage "https://github.com/mikeb26/chesstools"
  url "https://github.com/mikeb26/chesstools/archive/refs/tags/v0.10.5.tar.gz"
  sha256 "f14d0e418af9e8bb9bad4600c1e3556af6024e0fbfed9ec32a2a02832147b3d8"
  license "MIT"
  head "https://github.com/mikeb26/chesstools.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/ct/version.txt", "v0.10.5b"
    system "make", "build"
    bin.install "ct"
  end

  test do
    assert_match "chesstools-", shell_output("#{bin}/ct version")
  end
end
