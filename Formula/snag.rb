class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "d773bc704a69b37a7cbd9f84e6871f6c90b635cfbc57247a9294be16474bb034"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.2", output: bin/"snag")
  end

  test do
    assert_match "1.0.2", shell_output("#{bin}/snag --version")
  end
end
