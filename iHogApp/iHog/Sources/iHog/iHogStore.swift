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
import Foundation
import Show

public struct iHog: ReducerProtocol {
    private var showManager: ShowManager

    public init() {
        self.showManager = ShowManager()
    }

    public struct State: Equatable {
        @BindableState public var navLocation: Routes? = nil
        @BindableState public var isAddingShow = false
        @BindableState public var showName = "New Show"

        public var shows: [Show] = []
        public var showState: ShowStore.State
        public var selectedShow: Show? = nil

        public init(navLocation: Routes? = nil) {
            self.navLocation = navLocation
            self.showState = ShowStore.State()
        }
    }

    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case addShowButtonTapped
        case saveButtonTapped(String)
        case saveShowResponse(TaskResult<Show>)
        case fetchShows
        case fetchShowsResponse(TaskResult<[Show]>)
        case showTapped(Show)
        case show(ShowStore.Action)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                case .show(let showAction):
                    switch showAction {
                        case .showSelected(let show):
                            state.showState.selectedShow = show
                    }
                    return .none
                case .showTapped(let selectedShow):
                    state.navLocation = .show
                    state.selectedShow = selectedShow
                    return .none
                case .fetchShows:
                    return .task { [] in
                        .fetchShowsResponse(
                            TaskResult(showManager.fetchShows())
                        )
                    }
                case .fetchShowsResponse(.success(let shows)):
                    state.shows = shows
                    return .none
                case .fetchShowsResponse(.failure(let error)):
                    print(error)
                    return .none
                case .saveButtonTapped(let showName):
                    return .task { [] in
                        .saveShowResponse(
                            TaskResult(
                                showManager.save(
                                    show: Show(
                                        name: showName,
                                        dateCreated: Date(),
                                        dateLastModified: Date(),
                                        icon: "folder",
                                        note: ""
                                    )
                                )
                            )
                        )
                    }
                case .saveShowResponse(.success(let show)):
                    print("show saved correctly: \(show.name)")
                    state.isAddingShow = false
                    return .none
                case .saveShowResponse(.failure):
                    print("ERROR SAVING SHOW")
                    return .none
                case .addShowButtonTapped:
                    state.isAddingShow = true
                    return .none
                default:
                    return .none
            }
        }
    }
}
