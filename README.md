# iHog

iHog is an iOS app that is used to control [Hog 4](https://etcconnect.com) lighting consoles.

## 🥞 Stack

iHog uses Core Data and CloudKit to store data, Swift Package Manager for third party libraries and [dependencies](#Dependencies).

## Running the app

iHog has linting and environment variables that need to be added/managed to run the app.

### Environment Variables and API Keys

The following API Keys will be needed to run iHog.

| Variable | Purpose | Type | Notes |
| --- | --- | --- | --- |
| `telemetryDeck` | Analytics | UUID | You can input any UUID as the text and it should work. Telemetry Deck is an analytics platform. |

These API keys are stored in Xcode's environment variables.

### Code Formatting and Linting

iHog uses `swift-format` for code linting and formatting. Currently, linting is a build phase and needs to be installed on your computer. @heyJayWilson suggests using Homebrew to nistall `swift-lint` and then sym linking it to your bin. Here is the command that worked for them.

```bash
sudo ln -s /opt/homebrew/opt/swift-format/bin/swift-format /usr/local/bin/swift-format
```

Make sure the code is following the formatter. Here is the command to format the code. Run this from the terminal in the `ihog` folder.

```bash
 swift-format format . -r --configuration .swift-format.json -i
```

## Dependencies

These are third party dependencies that are used in the app. @heyjaywilson has made the decision to use these for ease of development, best practices, or they wanted to learn how to use the package.

- [Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)
- [SFSafeSymbols](https://github.com/SFSafeSymbols/SFSafeSymbols)
- [swift-format](https://github.com/apple/swift-format)
## Twitch Redemptions

- MikaelaCaron Nov 8 2022
