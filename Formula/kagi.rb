class Kagi < Formula
  desc "CLI tool for querying Kagi FastGPT API"
  homepage "https://github.com/grantcarthew/kagi"
  url "https://github.com/grantcarthew/kagi/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "60980c4ced27b80281d8997f96979252331e70ff71698b3ef93e0c2dd01956da"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.0")
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/kagi --version")
  end
end
