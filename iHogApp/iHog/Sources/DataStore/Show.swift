// Show.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct Show {
    public var name: String
    public var dateCreated: Date
    public var dateLastModified: Date
    public var icon: String
    public var id: UUID = UUID()
    public var note: String

    public init(
        name: String,
        dateCreated: Date,
        dateLastModified: Date,
        icon: String,
        note: String
    ) {
        self.name = name
        self.dateCreated = dateCreated
        self.dateLastModified = dateLastModified
        self.icon = icon
        self.note = note
    }
}
