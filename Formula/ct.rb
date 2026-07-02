class Ct < Formula
  desc "Chess Tools"
  homepage "https://github.com/mikeb26/chesstools"
  url "https://github.com/mikeb26/chesstools/archive/refs/tags/v0.10.4.tar.gz"
  sha256 "9df26ac0eaff8925ec14462f7f9bc2d51681da9dd79095bca1dcadeafc01aab4"
  license "MIT"
  head "https://github.com/mikeb26/chesstools.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/ct/version.txt", "v0.10.4b"
    system "make", "build"
    bin.install "ct"
  end

  test do
    assert_match "ct-", shell_output("#{bin}/ct version")
  end
end
