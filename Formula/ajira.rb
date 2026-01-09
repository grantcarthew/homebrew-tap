class Ajira < Formula
  desc "Jira from your terminal - because browser tabs are overrated"
  homepage "https://github.com/grantcarthew/ajira"
  url "https://github.com/grantcarthew/ajira/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fc085b1963ceb73595888232498a44d964574da6229726e40c453ea88e309f7c"
  license "MPL-2.0"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/gcarthew/ajira/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/ajira"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/ajira --version")
  end
end
