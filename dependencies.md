# Rice Stack Dependencies

## Required Taps

```bash
brew tap nikitabobko/tap
brew tap felixkratz/formulae
brew tap bjarneo/cliamp
```

## Formulae

```bash
brew install nikitabobko/tap/aerospace   # Tiling window manager
brew install felixkratz/formulae/sketchybar  # Custom menu bar
brew install felixkratz/formulae/borders     # Window borders (JankyBorders)
brew install fastfetch                       # System info display
brew install imagemagick                     # Required for fastfetch image rendering (kitty-direct)
brew install media-control                   # macOS Now Playing media integration
brew install jq                              # JSON parsing (used by media scripts)
brew install bjarneo/cliamp/cliamp           # CLI music player
```

## Casks

```bash
brew install --cask ghostty                          # Terminal emulator
brew install --cask cmux                             # Ghostty-based terminal with vertical tabs for AI coding agents
brew install --cask aerospace                        # AeroSpace (cask component)
brew install --cask font-sketchybar-app-font         # Icon font for sketchybar
brew install --cask font-jetbrains-mono-nerd-font    # Terminal font (JetBrainsMono Nerd Font)
```

## One-liner Install

```bash
# Add taps
brew tap nikitabobko/tap && brew tap felixkratz/formulae && brew tap bjarneo/cliamp

# Install everything
brew install nikitabobko/tap/aerospace felixkratz/formulae/sketchybar felixkratz/formulae/borders fastfetch imagemagick media-control jq bjarneo/cliamp/cliamp && \
brew install --cask ghostty cmux font-sketchybar-app-font font-jetbrains-mono-nerd-font
```
