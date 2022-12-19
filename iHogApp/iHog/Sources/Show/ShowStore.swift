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
import Utilities

public struct ShowStore: ReducerProtocol {

    public init() {}

    public struct State: Equatable {
        public var selectedShow: Show?
        @BindableState public var selectedTab: Destination

        public init(
            show: Show?,
            tab: Destination = .objects
        ) {
            self.selectedShow = show
            self.selectedTab = tab
        }
    }

    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case showSelected(Show)
        case addObjectTapped(ObjectType)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                case .showSelected(let show):
                    state.selectedShow = show
                    return .none
                case .addObjectTapped(let type):
                    // opens sheetview
                    // i want to drive it off of a enum
                    print(type)
                    return .none
                default:
                    return .none
            }
        }
    }
}

extension ShowStore {
    public enum Destination {
        case objects
        case favorites
        case punt
        case settings
    }
}
