// TestShowStore.swift
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

struct TestShowStore {
    static let show = Show(
        name: "TS Eras",
        dateCreated: Date(),
        dateLastModified: Date(),
        icon: "folder",
        note: "Ticketmaster messed this up"
    )
}
