// AppInfo.swift
// iHogApp
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import Foundation

enum AppInfo {
    static let buildNumber: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "000"
    static let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "v2022.11"
}
