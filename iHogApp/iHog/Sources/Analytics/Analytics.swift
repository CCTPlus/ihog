// Analytics.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import Foundation
import TelemetryClient

public class Analytics {

    private let rcID: String = ""

    public static let shared = Analytics()

    public func config(appID: String) {
        let config = TelemetryManagerConfiguration(appID: appID)
        TelemetryManager.initialize(with: config)
    }

    public func capture(event: AnalyticEvent) {
        TelemetryManager.send(event.name)
    }
}
