// FrontPanelStore.swift
// 
// 
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github	 @heyjaywilson
//              website  cctplus.dev

import Foundation
import ComposableArchitecture

struct FrontPanelStore: ReducerProtocol {
    struct State: Equatable {
        public var commandLine: String = ""
    }

    enum Action: Equatable {
        case oscMessageReceived
        case encoderWheelIncreased(Double)
        case encoderWheelDecreased(Double)
        case buttonPressed(String)
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action, Never> {
        switch action {
        case .oscMessageReceived:
            return .none
        case .encoderWheelIncreased(let value):
            print(value)
            return .none
        case .encoderWheelDecreased(let value):
            print(value)
            return .none
        case .buttonPressed(_):
            return .none
        }
    }
}
