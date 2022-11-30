import ComposableArchitecture
import XCTest

@testable import iHog

@MainActor
final class iHogTests: XCTestCase {
    func testNavRowPressed() async {
        let store = TestStore(
            initialState: iHog.State(),
            reducer: iHog()
        )
//
//        await store.send(.navRowPressed(.osc)) {
//            $0.navLocation = .osc
//        }
    }
}
