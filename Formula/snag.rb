class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "969e3133cae8c931ffb6d9fbc550e009cbac13709962682328f223b45fcf6c82"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.1.1", output: bin/"snag")
  end

  test do
    assert_match "1.1.1", shell_output("#{bin}/snag --version")
  end
end
