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
import Components
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
                Section {
                    NavigationLink(value: Routes.playback) {
                        RowWithIcon(labelText: "Playback", color: .teal, symbol: .sliderVertical3)
                    }
                    NavigationLink(value: Routes.programmer) {
                        RowWithIcon(labelText: "Programmer", color: .teal, symbol: .cooktop)
                    }
                }
                Section {
                    Text("Shows")
                }
                Section {
                    NavigationLink(value: Routes.osc) {
                        RowWithIcon(labelText: "OSC Settings", color: .green, symbol: .wifi)
                    }
                    NavigationLink(value: Routes.programmerSettings) {
                        RowWithIcon(labelText: "Programmer Settings", color: .purple, symbol: .cooktopFill)
                    }
                    NavigationLink(value: Routes.showSettings) {
                        RowWithIcon(labelText: "Show Settings", color: .gray, symbol: .folder)
                    }
                }

                VStack {
                    Text("App version: \(AppInfo.version) (\(AppInfo.buildNumber))")
                    Text("Made with ☕ in Austin")
                }.frame(maxWidth: .infinity)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .listRowBackground(Color.clear)
            }.listStyle(.insetGrouped)
                .navigationTitle("iHog")
                .navigationBarTitleDisplayMode(.large)
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
