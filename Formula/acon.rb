class Acon < Formula
  desc "CLI for Confluence - because the web editor is not it"
  homepage "https://github.com/grantcarthew/acon"
  url "https://github.com/grantcarthew/acon/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "cb628cbbe030f4d181306fa401b26bc74b823e2ba045acb4e27c9b897c324698"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=2.0.0", output: bin/"acon")
  end

  test do
    assert_match "2.0.0", shell_output("#{bin}/acon --version")
  end
end
