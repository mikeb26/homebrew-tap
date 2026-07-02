class Ct < Formula
  desc "Chess Tools"
  homepage "https://github.com/mikeb26/chesstools"
  url "https://github.com/mikeb26/chesstools/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "96cdd8da5e56514d3a79405dbb3c27060d36e8bcbb468b4a6663ded50863192f"
  license "MIT"
  head "https://github.com/mikeb26/chesstools.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/ct/version.txt", "v0.10.2b"
    system "make", "build"
    bin.install "ct"
  end

  test do
    assert_match "ct-", shell_output("#{bin}/ct version")
  end
end
