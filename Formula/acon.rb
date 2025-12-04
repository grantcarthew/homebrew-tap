class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "33b3d06f2b4c5e25df948c8389a66aa95825f841e8a310111c87ed36cb45bab8"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.1.0", output: bin/"acon")
  end

  test do
    assert_match "1.1.0", shell_output("#{bin}/acon --version")
  end
end
