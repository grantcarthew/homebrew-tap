# AGENTS.md

## Project Overview

This is a Homebrew tap repository for grantcarthew's CLI tools. It provides formulae for installing Go-based command-line tools via Homebrew on macOS and Linux systems. The tap currently maintains two packages:

- **kagi** - CLI tool for querying Kagi FastGPT API
- **snag** - Intelligently fetch web pages using Chrome via CDP

## Repository Structure

```
homebrew-tap/
├── Formula/           # Homebrew formula files (.rb)
│   ├── kagi.rb
│   └── snag.rb
├── LICENSE           # MPL-2.0 license
└── README.md         # User-facing documentation
```

## Development Environment

### Prerequisites

- macOS or Linux system
- Homebrew installed
- Ruby (comes with macOS, used by Homebrew)
- Access to the upstream source repositories on GitHub

### Local Testing

To test formulae locally before committing:

```bash
# Install from local tap
brew install --build-from-source ./Formula/<formula-name>.rb

# Audit formula for style and correctness
brew audit --strict --online Formula/<formula-name>.rb

# Test the installed formula
brew test Formula/<formula-name>.rb

# Check for common issues
brew style Formula/<formula-name>.rb
```

## Formula Development Guidelines

### Creating a New Formula

When adding a new formula to this tap:

1. **Create the formula file** in `Formula/<name>.rb`
2. **Use the standard Homebrew Ruby DSL structure**:
   ```ruby
   class Name < Formula
     desc "Short description (max ~80 chars)"
     homepage "https://github.com/grantcarthew/<project>"
     url "https://github.com/grantcarthew/<project>/archive/refs/tags/v<version>.tar.gz"
     sha256 "<checksum>"
     license "MPL-2.0"

     depends_on "go" => :build

     def install
       system "go", "build", *std_go_args(ldflags: "-X main.version=<version>")
     end

     test do
       assert_match "<version>", shell_output("#{bin}/<name> --version")
     end
   end
   ```

3. **Calculate SHA256 checksum**:
   ```bash
   curl -L https://github.com/grantcarthew/<project>/archive/refs/tags/v<version>.tar.gz | shasum -a 256
   ```

### Updating an Existing Formula

When updating a formula to a new version:

1. **Update the version number** in the `url` field
2. **Update the sha256 checksum** (download and hash the new tarball)
3. **Update version strings** in:
   - `ldflags` parameter (if used)
   - `test` block version assertion
4. **Test locally** before committing:
   ```bash
   brew reinstall --build-from-source ./Formula/<name>.rb
   brew test Formula/<name>.rb
   brew audit --strict --online Formula/<name>.rb
   ```

### Code Style Conventions

- **Class naming**: Use PascalCase matching the formula filename (e.g., `Kagi` for `kagi.rb`)
- **Description**: Keep concise, under 80 characters, no ending period
- **Indentation**: 2 spaces (Ruby standard)
- **Quote style**: Double quotes for strings
- **Dependencies**:
  - Use `depends_on "go" => :build` for Go-based tools
  - Only specify build dependencies (`:build`) or runtime dependencies as needed
- **Installation**:
  - Disable CGO if not needed: `ENV["CGO_ENABLED"] = "0"`
  - Use `std_go_args` for standard Go build flags
  - Include version in ldflags: `ldflags: "-X main.version=<version>"`
  - Specify output binary name if different from project name
- **Testing**: Always include a version check test as minimum

### Security Considerations

- **SHA256 checksums are mandatory** - Homebrew will reject formulae without them
- **Always use HTTPS URLs** for source downloads
- **Verify source archives** before updating checksums
- **Use signed git tags** when creating upstream releases
- **License field is required** - all projects in this tap use MPL-2.0

## Workflow Guidelines

### Commit Message Format

Follow conventional commit format:

```
<type>(<scope>): <description>

Types:
- feat: New formula or major feature
- chore: Version updates, maintenance
- fix: Bug fixes or corrections
- docs: Documentation changes
```

Examples:
```
feat(kagi): add kagi CLI tool formula
chore(Formula): update snag to v0.0.6
fix(snag): correct SHA256 checksum
```

### Version Management

- **Semantic versioning**: All upstream tools should use semver (vX.Y.Z)
- **Git tags**: Source releases must be tagged in upstream repos
- **Archive URLs**: Always use GitHub release archive URLs:
  ```
  https://github.com/grantcarthew/<project>/archive/refs/tags/v<version>.tar.gz
  ```
- **Version synchronization**: Keep formula version in sync with:
  - URL version tag
  - ldflags version string
  - Test version assertion

### Testing Instructions

Before every commit:

```bash
# 1. Style check
brew style Formula/<formula-name>.rb

# 2. Audit for correctness
brew audit --strict --online Formula/<formula-name>.rb

# 3. Build from source locally
brew install --build-from-source ./Formula/<formula-name>.rb

# 4. Run formula tests
brew test Formula/<formula-name>.rb

# 5. Verify the binary works
<formula-name> --version
<formula-name> --help
```

For updates, also verify:

```bash
# Uninstall old version
brew uninstall <formula-name>

# Reinstall new version
brew install --build-from-source ./Formula/<formula-name>.rb

# Test new version
brew test Formula/<formula-name>.rb
```

## Upstream Source Projects

Each formula corresponds to an upstream Go project:

- **kagi**: https://github.com/grantcarthew/kagi
- **snag**: https://github.com/grantcarthew/snag

When updating formulae:
1. Check the upstream repo for new releases
2. Review the changelog/release notes
3. Ensure the Go build process hasn't changed
4. Update the formula accordingly

## Common Issues and Troubleshooting

### Checksum Mismatch

If you get a checksum error during install:

```bash
# Download the tarball
curl -LO https://github.com/grantcarthew/<project>/archive/refs/tags/v<version>.tar.gz

# Calculate correct checksum
shasum -a 256 v<version>.tar.gz

# Update the sha256 field in the formula
```

### Build Failures

- Check that Go version is compatible with upstream requirements
- Verify the build command matches upstream project structure
- Ensure ldflags format is correct for the project
- Check if CGO is needed (most CLI tools don't need it)

### Test Failures

- Verify version string format matches what the binary outputs
- Ensure the binary name matches the formula name
- Check that the binary is actually installed to the correct location

## Publishing to GitHub

This tap is published at: https://github.com/grantcarthew/homebrew-tap

Users install from it via:
```bash
brew tap grantcarthew/tap
brew install <formula-name>
```

No special deployment process is needed - formulae are read directly from the main branch of the GitHub repository.

## Reference Documentation

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Ruby DSL Reference](https://rubydoc.brew.sh/Formula)
- [Homebrew How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Go Language for Homebrew](https://docs.brew.sh/How-To-Build-Software-Outside-Homebrew#go)
