// ShowView.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import ComposableArchitecture
import SwiftUI

public struct ShowView: View {
    var store: StoreOf<ShowStore>

    public init(store: StoreOf<ShowStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text(viewStore.selectedShow?.name ?? "No name")
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowView()
//    }
//}
