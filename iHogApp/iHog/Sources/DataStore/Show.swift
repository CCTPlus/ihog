// Show.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation

public struct Show: Equatable, Identifiable {

    public var name: String
    public var dateCreated: Date
    public var dateLastModified: Date
    public var icon: String
    public var id: UUID
    public var note: String
    public var objects: [ShowObject]

    public init(
        name: String,
        dateCreated: Date,
        dateLastModified: Date,
        icon: String,
        id: UUID = UUID(),
        note: String,
        objects: [ShowObject] = []
    ) {
        self.name = name
        self.dateCreated = dateCreated
        self.dateLastModified = dateLastModified
        self.icon = icon
        self.id = id
        self.note = note
        self.objects = objects
    }

    public init(from entity: ShowEntity) {
        self.name = entity.name ?? "NAME_NOT_FOUND"
        self.dateCreated = entity.dateCreated ?? Date()
        self.dateLastModified = entity.dateLastModified ?? Date()
        self.icon = entity.icon ?? "folder"
        self.id = entity.id ?? UUID()
        self.note = entity.note ?? ""
        self.objects = Array(_immutableCocoaArray: entity.objects ?? NSSet())
    }
}

extension Show {
    static let mock = Self(
        name: "TS Eras",
        dateCreated: Date(),
        dateLastModified: Date(),
        icon: "folder",
        id: UUID(),
        note: "Hello",
        objects: [.mockList, .mockList2]
    )
}
