// Object.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation
import SwiftUI
import Utilities

public struct ShowObject: Equatable, Identifiable, Hashable {
    public var id: UUID
    public var isOutlined: Bool
    public var name: String
    public var number: Double
    public var objColor: ObjectColor
    public var objType: ObjectType

    public var color: Color {
        switch objColor {
            case .red:
                return .red
            case .green:
                return .green
            case .blue:
                return .blue
            case .yellow:
                return .yellow
            case .gray:
                return .gray
            case .orange:
                return .orange
            case .pink:
                return .pink
            case .purple:
                return .purple
        }
    }

    public var rawName: String {
        return "\(objType.rawValue.capitalized) \(number.removeZerosFromEnd())"
    }

    public init(
        id: UUID = UUID(),
        isOutlined: Bool,
        name: String,
        number: Double,
        objColor: ObjectColor = .blue,
        objType: ObjectType
    ) {
        self.id = id
        self.isOutlined = isOutlined
        self.name = name
        self.number = number
        self.objColor = objColor
        self.objType = objType
    }

    public init(from entity: ShowObjectEntity) {
        self.name = entity.name ?? "NAME_NOT_FOUND"
        self.isOutlined = entity.isOutlined
        self.id = entity.id ?? UUID()
        self.number = entity.number
        self.objType = ObjectType(rawValue: entity.objType ?? "list") ?? .list
        self.objColor = ObjectColor(rawValue: entity.objColor ?? "blue") ?? .blue
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

extension ShowObject {
    public static let mockList = Self(
        id: UUID(),
        isOutlined: true,
        name: "List 1",
        number: 1.0,
        objColor: ObjectColor.blue,
        objType: ObjectType.list
    )
    public static let mockList2 = Self(
        id: UUID(),
        isOutlined: true,
        name: "List 2",
        number: 2.0,
        objColor: ObjectColor.blue,
        objType: ObjectType.list
    )
    public static let mockScene = Self(
        id: UUID(),
        isOutlined: false,
        name: "BLACK OUT",
        number: 1.0,
        objColor: .purple,
        objType: .scene
    )
}
