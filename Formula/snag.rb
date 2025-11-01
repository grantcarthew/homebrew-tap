class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4485994a734a0902e83062f83a75434a9414f3b4a290f91e338ced87c04b5ca4"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.0", output: bin/"snag")
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/snag --version")
  end
end
