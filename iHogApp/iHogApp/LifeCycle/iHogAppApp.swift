// iHogAppApp.swift
// iHogApp
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github   @heyjaywilson
//              website  cctplus.dev
// Supporters:
// MikaelaCaron Nov 8 2022
//
//

import Analytics
import ComposableArchitecture
import SwiftUI
import Utilities
import iHog

@main
struct iHogAppApp: App {
    @EnvVar(name: EnvVarNames.telemetryDeck) var telemetryDeckAPI: String

    let analytics = Analytics.shared

    init() {
        analytics.config(appID: telemetryDeckAPI)
    }
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: iHog.State(),
                    reducer: iHog()
                )
            )
        }
    }
}
