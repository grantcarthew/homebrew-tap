class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "4c171b7e59da78beb4ef16b9ca2e936d354b621369291e56e52e1b494b80e3b4"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.2.0", output: bin/"acon")
  end

  test do
    assert_match "1.2.0", shell_output("#{bin}/acon --version")
  end
end
