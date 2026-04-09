class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "11410ebe616b54e700b177a39b0ffb334db4c1074a38094ed51f2ff25209f08f"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    pkg = "github.com/grantcarthew/start/internal/cli"
    commit = "cab34f562232346339a054fa2b9068baef2e0b25"
    ldflags = "-s -w -X #{pkg}.cliVersion=#{version} -X #{pkg}.commit=#{commit} -X #{pkg}.buildDate=#{time.iso8601}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.9.2", shell_output("#{bin}/start --version")
  end
end
