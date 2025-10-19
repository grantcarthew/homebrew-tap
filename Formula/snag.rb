class Snag < Formula
  desc "Intelligently fetch web pages using Chrome via CDP"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "a33e43b6f2e0099a74699486287b8f252eb563a02f6d8d17c92ee65fec05cb87"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.3", output: bin/"snag")
  end

  test do
    assert_match "0.0.3", shell_output("#{bin}/snag --version")
  end
end
