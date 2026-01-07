class Ajira < Formula
  desc "Jira from your terminal - because browser tabs are overrated"
  homepage "https://github.com/grantcarthew/ajira"
  url "https://github.com/grantcarthew/ajira/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "96189279e7b6b448c3de30dcee507ef3612444f45125437cba0f09c3781c24b1"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/gcarthew/ajira/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ajira"
  end

  test do
    assert_match "0.0.1", shell_output("#{bin}/ajira --version")
  end
end
