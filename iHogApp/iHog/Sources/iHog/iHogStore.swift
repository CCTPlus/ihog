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

public struct iHog: ReducerProtocol {
    private var storageProvider: StorageProvider
    private var showManager: ShowManager

    public init() {
        self.storageProvider = StorageProvider.shared
        self.showManager = ShowManager()
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
        case saveButtonTapped(String)
        case saveShowResponse(TaskResult<Show>)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
                case .saveButtonTapped(let showName):
                    state.isAddingShow = false
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
            case let .saveShowResponse(.success(show)):
                print("show saved correctly: \(show.name)")
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
