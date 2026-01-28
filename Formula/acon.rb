class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "29b54f293e278f35be2af79568608334d91c0cc7440ce8efc63f4764c3718182"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.4.0", output: bin/"acon")
  end

  test do
    assert_match "1.4.0", shell_output("#{bin}/acon --version")
  end
end
