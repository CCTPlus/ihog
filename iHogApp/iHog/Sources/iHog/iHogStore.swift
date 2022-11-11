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
        public var navLocation: Routes? = .osc

        public init(navLocation: Routes? = .osc) {
            self.navLocation = navLocation
        }
    }

    public enum Action: Equatable {
        case pressRow(Routes?)
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .pressRow(let newRoute):
            state.navLocation = newRoute
            return .none
        }
    }
}
