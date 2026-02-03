class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "4a809832f6806541184afddc92202ee8979ebad2cfd27eda42a61d09caafd9cd"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.5.0", output: bin/"acon")
  end

  test do
    assert_match "1.5.0", shell_output("#{bin}/acon --version")
  end
end
