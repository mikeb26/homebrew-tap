class Spotsh < Formula
  desc "Launch disposable AWS EC2 Spot shell boxes and SSH into them"
  homepage "https://github.com/mikeb26/spotsh"
  url "https://github.com/mikeb26/spotsh/archive/refs/tags/v0.20.3.tar.gz"
  sha256 "55260d42c26bb7e0865c1c9eebd9547f738b62a5e4dc8b4b6ee5d6bcacc52d7a"
  license "AGPL-3.0-only"
  head "https://github.com/mikeb26/spotsh.git", branch: "main"

  depends_on "make" => :build
  depends_on "go" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    File.write buildpath/"cmd/spotsh/version.txt", "v0.20.3b"
    system "make", "vendor"
    system "make", "build"
    bin.install "spotsh"
  end

  test do
    assert_match "spotsh-", shell_output("#{bin}/spotsh version")
  end
end
