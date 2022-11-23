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
        @BindableState public var navLocation: Routes? = nil
        @BindableState public var isAddingShow = false
        @BindableState public var showName = "New Show"

        public init(navLocation: Routes? = nil) {
            self.navLocation = navLocation
        }
    }

    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case addShowButtonTapped
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .addShowButtonTapped:
                state.isAddingShow = true
                return .none
            default:
                return .none
            }
        }
    }
}
