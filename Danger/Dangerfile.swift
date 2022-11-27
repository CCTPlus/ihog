import Danger
let danger = Danger()

// MARK: Constants
let hasChangelog = danger.git.modifiedFiles.contains("CHANGELOG.md")
let bodyText = danger.github.pullRequest.body ?? ""
let titleText = danger.github.pullRequest.title
let isTrivial = (bodyText + titleText).contains("#trivial")
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
let bigPRThreshold: Int = 600;
let additions: Int = danger.github.pullRequest.additions ?? 0
let deletions: Int = danger.github.pullRequest.deletions ?? 0

// MARK: Changelog

if (!hasChangelog && !isTrivial) {
    warn("Please add a changelog entry for your changes.")
}

// MARK: PR Count

if (additions > bigPRThreshold) {
  warn("> Pull Request size seems relatively large. If this Pull Request contains multiple changes, please split each into separate PR will helps faster, easier review.");
}
if (bodyText.count == 0) {
  fail("Every PR deserves some kind of description. Please make sure to give this a good description.")
}