// EnvironmentVariables.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import Foundation

@propertyWrapper
public struct EnvVar {
    let name: String
    let defaultValue = "NO ENV VAR FOUND"

    public init(name: String) {
        self.name = name
    }
    
    public var wrappedValue: String {
        get {
            return ProcessInfo.processInfo.environment[name] ?? defaultValue
        }
    }
}
