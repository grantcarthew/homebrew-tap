class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "12d431176672d3a374bed9eecb125a1a5014d63917318c8621df0f3607fb12e2"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.1", output: bin/"snag")
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/snag --version")
  end
end
