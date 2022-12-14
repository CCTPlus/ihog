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
import Frontpanel
import SFSafeSymbols
import Show
import SwiftUI
import iHog

struct ContentView: View {
    let store: StoreOf<iHog>

    @State private var nav: Routes = .osc
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationSplitView {
                List(
                    selection: viewStore.binding(\.$navLocation)
                ) {
                    // -MARK: Hardware
                    Section {
                        NavigationLink(value: Routes.playback) {
                            Sydney(labelText: "Playback", color: .teal, symbol: .sliderVertical3)
                        }
                        NavigationLink(value: Routes.programmer) {
                            Sydney(labelText: "Programmer", color: .teal, symbol: .cooktop)
                        }
                    }
                    .onAppear {
                        viewStore.send(.fetchShows)
                    }
                    // -MARK: Shows
                    Section {
                        ForEach(viewStore.shows) { show in
                            Button {
                                viewStore.send(.showTapped(show))
                            } label: {
                                Sydney(
                                    labelText: show.name,
                                    color: .gray,
                                    symbol: SFSymbol(rawValue: show.icon)
                                )
                                .foregroundColor(.primary)
                            }
                        }
                    } header: {
                        Text("\(Image(systemSymbol: .folder)) Shows")
                    }
                    // -MARK: Settings
                    Section {
                        NavigationLink(value: Routes.osc) {
                            Sydney(labelText: "OSC Settings", color: .green, symbol: .wifi)
                        }
                        NavigationLink(value: Routes.programmerSettings) {
                            Sydney(
                                labelText: "Programmer Settings",
                                color: .teal,
                                symbol: .cooktopFill
                            )
                        }
                        NavigationLink(value: Routes.showSettings) {
                            Sydney(labelText: "Show Settings", color: .gray, symbol: .folder)
                        }
                    }
                    // -MARK: About
                    Section {
                        NavigationLink(value: Routes.feedback) {
                            Sydney(labelText: "Request a feature", color: .blue, symbol: .lightbulb)
                        }
                        NavigationLink(value: Routes.feedback) {
                            Sydney(labelText: "Report a bug", color: .red, symbol: .ladybug)
                        }
                        Button {
                            print("Request a review")
                        } label: {
                            Sydney(
                                labelText: "Rate and Review iHog",
                                color: .yellow,
                                symbol: .starFill
                            )
                        }
                        Button {
                            print("Share")
                        } label: {
                            Sydney(
                                labelText: "Share with a friend",
                                color: .yellow,
                                symbol: .squareAndArrowUp
                            )
                        }
                    }
                    Text("Made with 💙 and ☕\nin Austin, TX")
                        .frame(maxWidth: .infinity)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.insetGrouped)
                .sheet(isPresented: viewStore.binding(\.$isAddingShow)) {
                    NewShowView(store: store)
                }
                .navigationTitle("iHog")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewStore.send(.addShowButtonTapped)
                        } label: {
                            Image(systemSymbol: .folderBadgePlus)
                        }

                    }
                }
            } detail: {
                switch viewStore.navLocation {
                    case .programmer:
                        FPProgrammerView()
                    case .playback:
                        Text("Playback")
                    case .osc:
                        Text("OSC")
                    case .show:
                        ShowView(
                            store: store.scope(
                                state: \.showState,
                                action: iHog.Action.show
                            )
                        )
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
