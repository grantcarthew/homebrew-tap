class Snag < Formula
  desc "Intelligently fetch web page content using a browser engine"
  homepage "https://github.com/grantcarthew/snag"
  url "https://github.com/grantcarthew/snag/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "38cb1de9d4092179f1c800aeab8688ec88c8b7444de426d5f67da8ab36029e90"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-X main.version=0.0.5", output: bin/"snag")
  end

  test do
    assert_match "0.0.5", shell_output("#{bin}/snag --version")
  end
end
