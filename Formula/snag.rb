class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d62100b7e026b0b8208083b701866b52ac79e6a3ff060e81ce2381f6e2a4ee81"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.1.0", output: bin/"snag")
  end

  test do
    assert_match "1.1.0", shell_output("#{bin}/snag --version")
  end
end
