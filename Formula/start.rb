class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "cbde070fb2b664060c570f3ac86eb737c0878867cd8c1c33d35988ed142f6be8"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/start/internal/cli.cliVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.0.3", shell_output("#{bin}/start --version")
  end
end
