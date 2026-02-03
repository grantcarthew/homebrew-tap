class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "38e13e92fa060c8f5b97f51ef8d61c7ac9b725e5eb39f3c19a6a462bf1a5f8f3"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/start/internal/cli.cliVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/start --version")
  end
end
