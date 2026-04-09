class Webctl < Formula
  desc "CLI tool for browser automation and debugging, designed for AI agents"
  homepage "https://github.com/grantcarthew/webctl"
  url "https://github.com/grantcarthew/webctl/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "02576e88d09ab71b784246bc16374c8610a65e3a5a96ef4de4d1f9ca67b27104"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/webctl/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/webctl"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/webctl --version")
  end
end
