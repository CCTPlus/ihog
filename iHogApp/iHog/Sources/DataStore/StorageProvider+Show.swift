// Show+StorageProvider.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import CoreData
import Foundation

extension StorageProvider {
    public func fetchShows() throws -> [ShowEntity] {
        let fetchRequest = NSFetchRequest<ShowEntity>(entityName: "ShowEntity")
        return try persistentContainer.viewContext.fetch(fetchRequest)
    }

    public func saveShow(entity: ShowEntity) throws {
        persistentContainer.viewContext.insert(entity)
        try persistentContainer.viewContext.save()
    }

    public func addObjectToShow(showID id: UUID, object: ShowObject) throws {
        let show = try fetchSpecificShow(with: id)
        show.dateLastModified = Date()
        let objectToAdd = ShowObjectEntity(context: persistentContainer.viewContext)
        objectToAdd.id = object.id
        objectToAdd.objType = object.objType.rawValue
        objectToAdd.isOutlined = object.isOutlined
        objectToAdd.name = object.name
        objectToAdd.number = object.number
        objectToAdd.objColor = object.objColor.rawValue

        show.addToObjects(objectToAdd)

        try persistentContainer.viewContext.save()
    }

    private func fetchSpecificShow(with id: UUID) throws -> ShowEntity {
        let fetchRequest = NSFetchRequest<ShowEntity>(entityName: "ShowEntity")

        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        return try persistentContainer.viewContext.fetch(fetchRequest).first!
    }
}
