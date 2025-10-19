class Snag < Formula
  desc "Intelligently fetch web pages using Chrome via CDP"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "450534e4e2eafb8653da8a8ef68b0ef6c554d8e49ae2778292e57061c9597536"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.1", output: bin/"snag")
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/snag --version")
  end
end
