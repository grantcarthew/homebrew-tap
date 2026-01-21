class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "9c2c14b32240179151e577cbd27b24d77c1527e3340a5db375a07bbd770adde5"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.3.0", output: bin/"acon")
  end

  test do
    assert_match "1.3.0", shell_output("#{bin}/acon --version")
  end
end
