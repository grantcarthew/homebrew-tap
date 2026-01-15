class Chonkometer < Formula
  desc "Measure MCP server token consumption before installation"
  homepage "https://github.com/grantcarthew/chonkometer"
  url "https://github.com/grantcarthew/chonkometer/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "46ac655dfbe17651e9f0adbacf74d1decd36417bfb75e5616a21c0ebe459bd8c"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/gcarthew/chonkometer/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/chonkometer"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/chonkometer --version")
  end
end
