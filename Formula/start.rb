class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "c941147230df70b57eefa4864beb82ab531cd0524d8f0c23625aa10dbab1bd74"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    pkg = "github.com/grantcarthew/start/internal/cli"
    commit = "a9aaada6b558c0d291bf920c2bb3d958532341df"
    ldflags = "-s -w -X #{pkg}.cliVersion=#{version} -X #{pkg}.commit=#{commit} -X #{pkg}.buildDate=#{time.iso8601}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.9.0", shell_output("#{bin}/start --version")
  end
end
