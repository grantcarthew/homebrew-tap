class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "594ab965dee662b6865d695b3403a7cf06cf90b901adb7e9276d5279deae0a89"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.0", output: bin/"acon")
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/acon --version")
  end
end
