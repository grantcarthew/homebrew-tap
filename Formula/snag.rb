class Snag < Formula
  desc "Intelligently fetch web pages using Chrome via CDP"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "d3b8996df67f9581d420197c1827ac3da86dc26fa34c9421638447aab44757ad"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.1", output: bin/"snag")
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/snag --version")
  end
end
