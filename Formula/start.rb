class Start < Formula
  desc "AI agent CLI orchestrator built on CUE"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "32d8106b5f98f6dc06ef0382a250f0d959682558badca069c0eb31781312e446"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/start/internal/cli.cliVersion=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/start"
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/start --version")
  end
end
