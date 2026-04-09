class Kagi < Formula
  desc "CLI tool for querying Kagi FastGPT API"
  homepage "https://github.com/grantcarthew/kagi"
  url "https://github.com/grantcarthew/kagi/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ab7582b96ff3001e7da82c05b5435848159ff602895d5b6b2c47c4a0ad30aa63"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=1.0.0")
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/kagi --version")
  end
end
