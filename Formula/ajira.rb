class Ajira < Formula
  desc "Jira from your terminal - because browser tabs are overrated"
  homepage "https://github.com/grantcarthew/ajira"
  url "https://github.com/grantcarthew/ajira/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "429f0be1c3dc9546de76d5ca8a939d2fb8320f0417e5185414ba95a664dc1d7b"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/gcarthew/ajira/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ajira"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/ajira --version")
  end
end
