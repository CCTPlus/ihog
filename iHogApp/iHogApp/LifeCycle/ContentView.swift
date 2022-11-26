// ContentView.swift
// iHogApp
// Copyright © 2022 CCT Plus LLC. All rights reserved.
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website   cctplus.dev

import Components
import ComposableArchitecture
import CoreData
import Frontpanel
import SwiftUI
import iHog

struct ContentView: View {
    let store: StoreOf<iHog>

    @State private var nav: Routes = .osc
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationSplitView {
                List(
                    selection:
                        viewStore.binding(
                            get: \.navLocation,
                            send: { .navRowPressed($0) }
                        )
                ) {
                    // -MARK: Hardware
                    Section {
                        NavigationLink(value: Routes.playback) {
                            RowWithIcon(
                                labelText: "Playback",
                                color: .teal,
                                symbol: .sliderVertical3
                            )
                        }
                        NavigationLink(value: Routes.programmer) {
                            RowWithIcon(
                                labelText: "Programmer",
                                color: .teal,
                                symbol: .cooktop
                            )
                        }
                    }
                    // -MARK: Shows
                    Section {
                        Text("Shows")
                    }
                    // -MARK: Settings
                    Section {
                        NavigationLink(value: Routes.osc) {
                            RowWithIcon(labelText: "OSC Settings", color: .green, symbol: .wifi)
                        }
                        NavigationLink(value: Routes.programmerSettings) {
                            RowWithIcon(
                                labelText: "Programmer Settings",
                                color: .teal,
                                symbol: .cooktopFill
                            )
                        }
                        NavigationLink(value: Routes.showSettings) {
                            RowWithIcon(labelText: "Show Settings", color: .gray, symbol: .folder)
                        }
                    }
                    // -MARK: About
                    Section {
                        NavigationLink(value: Routes.feedback) {
                            RowWithIcon(
                                labelText: "Request a feature",
                                color: .blue,
                                symbol: .lightbulb
                            )
                        }
                        NavigationLink(value: Routes.feedback) {
                            RowWithIcon(labelText: "Report a bug", color: .red, symbol: .ladybug)
                        }
                        Button {
                            print("Request a review")
                        } label: {
                            RowWithIcon(
                                labelText: "Rate and Review iHog",
                                color: .yellow,
                                symbol: .starFill
                            )
                        }

                        Button {
                            print("Share")
                        } label: {
                            RowWithIcon(
                                labelText: "Share with a friend",
                                color: .yellow,
                                symbol: .squareAndArrowUp
                            )
                        }

                    }

                    // -Mark: Footer
                    VStack {
                        Text("App version: \(AppInfo.version) (\(AppInfo.buildNumber))")
                        Text("Made with ☕ in Austin")
                    }
                    .frame(maxWidth: .infinity)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.insetGrouped)
                .navigationTitle("iHog")
                .navigationBarTitleDisplayMode(.large)
            } detail: {
                switch viewStore.navLocation {
                    case .programmer:
                        FPProgrammerView()
                    case .playback:
                        Text("Playback")
                    case .osc:
                        Text("OSC")
                    default:
                        Text("Hello")
                }
            }

        }
        .debug()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
