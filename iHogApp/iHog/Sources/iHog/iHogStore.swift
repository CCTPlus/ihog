// iHogStore.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import ComposableArchitecture

import DataStore

public struct iHog: ReducerProtocol {
    private var storageProvider: StorageProvider

    public init() {
        self.storageProvider = StorageProvider.shared
    }

    public struct State: Equatable {
        public var navLocation: Routes? = nil
        public var isAddingShow = false
        public var showName = "New Show"

        public init(navLocation: Routes? = nil) {
            self.navLocation = navLocation
        }
    }

    public enum Action: Equatable {
        case navRowPressed(Routes?)
        case addShowButtonTapped
    }

    public func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .navRowPressed(let newRoute):
            state.navLocation = newRoute
            return .none
        case .addShowButtonTapped:
            state.isAddingShow = true
            return .none
        }
    }
}
