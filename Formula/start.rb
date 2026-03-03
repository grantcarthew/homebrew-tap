class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "3af9eb43cd426612cd1e32f7b233912fe9df4f2d84833ad9235ad0f766d2c76a"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    pkg = "github.com/grantcarthew/start/internal/cli"
    commit = "6f5cdcc88b4c3d2e42f214fb49dd661478b44ddb"
    ldflags = "-s -w -X #{pkg}.cliVersion=#{version} -X #{pkg}.commit=#{commit} -X #{pkg}.buildDate=#{time.iso8601}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/start --version")
  end
end
