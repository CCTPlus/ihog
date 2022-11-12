// iHogStore.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import Foundation
import ComposableArchitecture

public struct iHog: ReducerProtocol {
    public init() {
    }

    public struct State: Equatable {
        public var navLocation: Routes? = nil

        public init(navLocation: Routes? = nil) {
            self.navLocation = navLocation
        }
    }

    public enum Action: Equatable {
        case navRowPressed(Routes?)
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .navRowPressed(let newRoute):
            state.navLocation = newRoute
            return .none
        }
    }
}
