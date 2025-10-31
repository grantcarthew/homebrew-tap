class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "4705f4f7d2f1357e09208d20c235cf02f05e5745357fe510f62cf730f8c24726"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.6", output: bin/"snag")
  end

  test do
    assert_match "0.0.6", shell_output("#{bin}/snag --version")
  end
end
