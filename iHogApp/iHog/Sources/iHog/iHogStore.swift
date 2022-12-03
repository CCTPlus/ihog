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
    private var symbolHelper: SymbolHelper

    public init() {
        self.showManager = ShowManager()
        self.symbolHelper = SymbolHelper()
    }

    public struct State: Equatable {

        @BindableState public var navLocation: Routes? = nil
        @BindableState public var isAddingShow = false
        @BindableState public var showName = "New Show"

        @BindableState public var showIcon = "folder"

        public var iconsInCategories: [String: [String]] = [:]
        public var categories: [Category] = []
        public var selectedCategory: String = ""
        public var selectedIcon: String = "folder"

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
        case saveButtonTapped(Show)
        case saveShowResponse(TaskResult<Show>)
        case fetchShows
        case fetchShowsResponse(TaskResult<[Show]>)
        case showTapped(Show)
        case show(ShowStore.Action)
        case selectCategory(String)
        case selectIcon(String)
        case onAppear
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
                case .onAppear:
                    if state.categories.isEmpty {
                        state.categories = symbolHelper.getCategoies()
                        state.iconsInCategories = symbolHelper.sortSymbolsIntoCategories()
                    }
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
                case .addShowButtonTapped:
                    state.isAddingShow = true
                    return .none
                case .saveButtonTapped(let show):
                    return .task { [] in
                        return .saveShowResponse(
                            TaskResult(
                                showManager.save(show: show)
                            )
                        )
                    }
                case .saveShowResponse(.success(let show)):
                    print("show saved correctly: \(show.name)")
                    state.shows.append(show)
                    state.isAddingShow = false
                    return .none
                case .saveShowResponse(.failure):
                    print("ERROR SAVING SHOW")
                    return .none
                case .selectCategory(let key):
                    state.selectedCategory = key
                    return .none
                case .selectIcon(let icon):
                    state.selectedIcon = icon
                    return .none
                default:
                    return .none
            }
        }
    }
}
