class Kagi < Formula
  desc "CLI tool for querying Kagi FastGPT API"
  homepage "https://github.com/grantcarthew/kagi"
  url "https://github.com/grantcarthew/kagi/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "6e6eb9f558527c6421902fb4c36c3fa2a1f061170ba5811e141159fdbd6d16f7"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.1")
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/kagi --version")
  end
end
