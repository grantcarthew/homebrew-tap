class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "cfb026ba55b1d5547a3fe427e0ed5d9d4cdff9f53c8243e752341600ca1f97d0"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.1", output: bin/"acon")
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/acon --version")
  end
end
