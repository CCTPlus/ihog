// ContentView.swift
// iHogApp
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website   cctplus.dev

import SwiftUI
import CoreData
import iHog
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<iHog>

    @State private var nav: Routes = .osc
    var body: some View { WithViewStore(self.store, observe: { $0 }) { viewStore in
        NavigationSplitView {
            List(
                selection:
                    viewStore.binding(
                        get: \.navLocation,
                        send: { .pressRow($0)}
                    )
            ) {
                NavigationLink(value: Routes.playback) {
                    Text("Playback")
                }
            }
        } detail: {
            switch viewStore.navLocation {
            case .programmer:
                Text("Programmer")
            case .playback:
                Text("Playback")
            case .osc:
                Text("OSC")
            default:
                Text("Hello")
            }
        }

    }.debug()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
