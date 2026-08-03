cask "claude-launcher" do
  version "1.0.4"
  sha256 "c8ef11ece97a4804ad85c9c53849723415b1f0afb775e75c6e8f98c56b004d05"

  url "https://github.com/jamisonhill/claude-launcher/releases/download/v#{version}/Claude-Launcher-#{version}.dmg"
  name "Claude Launcher"
  desc "GUI for starting Claude Code sessions in Terminal"
  homepage "https://github.com/jamisonhill/claude-launcher"

  # Section(isExpanded:), which drives the collapsible sidebar, is macOS 14+.
  depends_on macos: :sonoma

  app "ClaudeLauncher.app"

  # Leaves the user's curated library alone unless they explicitly `brew zap`.
  zap trash: [
    "~/Library/Application Support/ClaudeLauncher",
  ]

  caveats <<~EOS
    Claude Launcher needs the Claude Code CLI on your PATH:

      https://claude.com/claude-code

    Picking a Terminal colour theme installs profiles named "Claude — <theme>"
    into Terminal. Your own profiles are read but never modified; remove ours in
    Terminal → Settings → Profiles.
  EOS
end
