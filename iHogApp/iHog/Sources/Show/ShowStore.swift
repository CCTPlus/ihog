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
    let provider = StorageProvider.shared

    public init() {}

    public struct State: Equatable {
        public var selectedShow: Show?
        @BindableState public var selectedTab: Destination
        @BindableState public var isObjectMenuOpen: Bool

        public var objectFilter: [ObjectType: Bool] = [
            .list: true,
            .scene: true,
            .beam: true,
            .colour: true,
            .intensity: true,
            .position: true,
            .effect: true
        ]

        public var objects: [ShowObject] {
            if let show = self.selectedShow {
                var objsToSend: [ShowObject] = []
                let objects = show.objects.sorted { $0.number < $1.number }

                for filter in objectFilter {
                    if filter.value {
                        objsToSend += objects.filter { $0.objType == filter.key }
                    }
                }
                return objsToSend
            }
            return []
        }

        fileprivate var objectID: UUID?

        public init(
            show: Show?,
            tab: Destination = .objects,
            isObjectMenuOpen: Bool = false,
            isFilterMenuOpen: Bool = false,
            objectID: UUID? = nil
        ) {
            self.selectedShow = show
            self.selectedTab = tab
            self.isObjectMenuOpen = isObjectMenuOpen
            self.objectID = objectID
        }
    }

    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case showSelected(Show)
        case addObjectTapped(ObjectType)
        case playButtonTapped(Double)
        case stopButtonTapped(Double)
        case menuButtonObjectTapped(UUID?)
        case filterButtonTapped(ObjectType)
    }

    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        Reduce(self.core)
    }

    private func core(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            case .showSelected(let show):
                state.selectedShow = show
                return .none
            case .addObjectTapped(let objType):
                guard var show = state.selectedShow else {
                    return .none
                }
                /// 1. create a new Object
                /// the number of the object is the last object of that type in the show +1
                let objCount =
                    show.objects
                    .filter {
                        $0.objType == objType
                    }
                    .count + 1
                let objectName = objType.rawValue.capitalized + " \(objCount)"
                let object = ShowObject(
                    isOutlined: false,
                    name: objectName,
                    number: Double(objCount),
                    objType: objType
                )
                /// 2. add it to the show's object array
                if show.objects.count == 0 {
                    show.objects = [object]
                    state.selectedShow = show
                } else {
                    state.selectedShow?.objects.append(object)
                }
                /// 3. Save to Core Data
                do {
                    try provider.addObjectToShow(showID: show.id, object: object)
                } catch {
                    print(error)
                }
                return .none
            case .playButtonTapped(let objNum):
                print(objNum)
                return .none
            case .stopButtonTapped(let objNum):
                print(objNum)
                return .none
            case .menuButtonObjectTapped(let objID):
                print(objID?.description ?? "help")
                state.objectID = objID
                return .none
            case .filterButtonTapped(let objType):
                print("hello")
                guard var currentFilter = state.objectFilter[objType] else {
                    print("inside guard")
                    return .none
                }
                currentFilter.toggle()
                state.objectFilter[objType] = currentFilter
                return .none
            default:
                return .none
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
