class Elgato < Formula
  desc "Control Elgato Key Light Air devices from your terminal"
  homepage "https://github.com/grantcarthew/elgato"
  url "https://github.com/grantcarthew/elgato/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "887f82bc7d5ab8d1e589862617e7d9bd3da7730f230cf0974b77d45273581db5"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/grantcarthew/elgato/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/elgato"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/elgato --version")
  end
end
