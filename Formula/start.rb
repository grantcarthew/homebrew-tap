class Start < Formula
  desc "AI agent orchestrator for prompt composition and workflow automation"
  homepage "https://github.com/grantcarthew/start"
  url "https://github.com/grantcarthew/start/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "958cc9b450f93554f431002f1873aca5fb4719d12fe054305390df583edcc06a"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.1", output: bin/"start"), "./cmd/start"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/start --version")
  end
end
