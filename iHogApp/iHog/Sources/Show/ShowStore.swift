// ShowStore.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import ComposableArchitecture
import DataStore
import Foundation

public struct ShowStore: ReducerProtocol {

    public init() {}

    public struct State: Equatable {
        public var selectedShow: Show?

        public init(show: Show?) {
            self.selectedShow = show
        }
    }

    public enum Action {
        case showSelected(Show)
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
            case .showSelected(let show):
                state.selectedShow = show
                return .none
        }
    }
}
