class Snag < Formula
  desc "Intelligently fetch web pages using Chrome via CDP"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "802dece924a5cbd260234c0fdb465656ebda61060a545ee93165a54dc16aaefb"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.2", output: bin/"snag")
  end

  test do
    assert_match "0.0.2", shell_output("#{bin}/snag --version")
  end
end
