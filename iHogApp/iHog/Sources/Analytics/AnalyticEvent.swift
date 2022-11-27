// AnalyticEvent.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import Foundation

public enum AnalyticEvent: String {
    case appLoaded = "AppLoaded"
    case dataLoadFailed = "dataLoadFailed"

    var name: String { self.rawValue }
}
