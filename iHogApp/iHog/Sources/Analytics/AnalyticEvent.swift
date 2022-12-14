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
    case appLoaded = "appLoaded"
    case dataLoadFailed = "dataLoadFailed"
    case addShow = "addShow"
    case showIconTapped = "showIconTapped"

    /// Errors
    case errorSavingShow = "errorSavingShow"

    var name: String { self.rawValue }
}
