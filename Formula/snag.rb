class Snag < Formula
  desc "Intelligently fetch web pages using Chrome via CDP"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "2dd03ab153492a34f408607aa1b95a871953179aa192cf9498cf311ee9d50456"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.4", output: bin/"snag")
  end

  test do
    assert_match "0.0.4", shell_output("#{bin}/snag --version")
  end
end
