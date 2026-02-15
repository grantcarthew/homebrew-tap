class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "d0db354a33bf6f95de0eb7bbb82976addb0f7423875bfd7bfb22cf9664b11e2f"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    pkg = "github.com/grantcarthew/start/internal/cli"
    commit = "4624a8c06a0ac93bdc3a1d02d2e63abeb675d5f6"
    ldflags = "-s -w -X #{pkg}.cliVersion=#{version} -X #{pkg}.commit=#{commit} -X #{pkg}.buildDate=#{time.iso8601}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.6.0", shell_output("#{bin}/start --version")
  end
end
