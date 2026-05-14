class Spotsh < Formula
  desc "Launch disposable AWS EC2 Spot shell boxes and SSH into them"
  homepage "https://github.com/mikeb26/spotsh"
  url "https://github.com/mikeb26/spotsh/archive/refs/tags/v0.20.2.tar.gz"
  sha256 "f5311161b4dd089a298e0246b4633a672cf6cf55f64e7496ba692c01d1261b66"
  license "AGPL-3.0-only"
  head "https://github.com/mikeb26/spotsh.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/spotsh/version.txt", "v0.20.2b"
    system "make", "build"
    bin.install "spotsh"
  end

  test do
    assert_match "spotsh-", shell_output("#{bin}/spotsh version")
  end
end
