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
                        }.count + 1
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
                    /// 3. Add object to Core Data `ObjectEntity`
                    ///     orrrrr
                    ///     Update the show entity object
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
