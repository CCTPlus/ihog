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

    var name: String { self.rawValue }
}
