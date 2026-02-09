class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "1f4ece37a1b36269d7960e71cb0e7df41284c7194018fd74530ee04c61c327f7"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/start/internal/cli.cliVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/start --version")
  end
end
