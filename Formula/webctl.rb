class Webctl < Formula
  desc "CLI tool for browser automation and debugging, designed for AI agents"
  homepage "https://github.com/grantcarthew/webctl"
  url "https://github.com/grantcarthew/webctl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "233eec65d70a68a8a75d39376f57716678b1baaf7a6c8880d303df7058825864"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/webctl/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/webctl"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/webctl --version")
  end
end
