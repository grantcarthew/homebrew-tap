class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ee1aba283f579282b5758329ec9209a2db3939561b6177d1a9562726ce8090fe"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/start/internal/cli.cliVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/start --version")
  end
end
