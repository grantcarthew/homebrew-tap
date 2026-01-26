class Webctl < Formula
  desc "CLI tool for browser automation and debugging, designed for AI agents"
  homepage "https://github.com/grantcarthew/webctl"
  url "https://github.com/grantcarthew/webctl/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "e6e47a02ea84cd5c180dd5039998fdc8d74b0f09a33adb44eda87e14c4e80ed0"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.1"), "./cmd/webctl"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/webctl --version")
  end
end
