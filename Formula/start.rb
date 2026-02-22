class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "4447197cfa2b495848894391cd9f089e2c0216fb2c96397c7e5be3d133fdd4d5"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    pkg = "github.com/grantcarthew/start/internal/cli"
    commit = "490adffb4c6d5fa1469bb1bf30b80ed27b0e8732"
    ldflags = "-s -w -X #{pkg}.cliVersion=#{version} -X #{pkg}.commit=#{commit} -X #{pkg}.buildDate=#{time.iso8601}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.7.0", shell_output("#{bin}/start --version")
  end
end
