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
}
