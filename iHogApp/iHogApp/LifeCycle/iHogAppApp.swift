// iHogAppApp.swift
// iHogApp
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github     @heyjaywilson
//              website  cctplus.dev

import SwiftUI
import Analytics
import Utilities

@main
struct iHogAppApp: App {
    @EnvVar(name: "telemetryDeck") var telemetryDeckAPI: String

    let persistenceController = PersistenceController.shared
    let analytics = Analytics.shared

    init() {
        analytics.config(appID: telemetryDeckAPI)
//        print(telemetryDeckAPI)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
