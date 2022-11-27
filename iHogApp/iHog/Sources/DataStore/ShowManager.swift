// ShowManager.swift
//
//
//
// Follow Jay on mastodon @heyjay@iosdev.space
//               twitter  @heyjaywilson
//               github   @heyjaywilson
//               website  cctplus.dev

import Foundation

public class ShowManager {
    let provider = StorageProvider.shared

    public init() {}

    public func fetchShows() -> Result<[Show], Error> {
        do {
            let showEntities = try provider.fetchShows()
            return Result.success(
                showEntities.map { showEntity in
                    Show(from: showEntity)
                }
            )
        } catch {
            return Result.failure(error)
        }
    }

    public func save(show: Show) -> Result<Show, Error> {
        let entity = ShowEntity(context: provider.persistentContainer.viewContext)
        entity.name = show.name
        entity.dateCreated = show.dateCreated
        entity.dateLastModified = show.dateLastModified
        entity.icon = show.icon
        entity.id = show.id
        entity.note = show.note

        do {
            try provider.saveShow(entity: entity)
            return Result.success(show)
        } catch {
            return Result.failure(error)
        }
    }
}

extension Show {
    init(from entity: ShowEntity) {
        self.name = entity.name ?? "NAME_NOT_FOUND"
        self.dateCreated = entity.dateCreated ?? Date()
        self.dateLastModified = entity.dateLastModified ?? Date()
        self.icon = entity.icon ?? "folder"
        self.id = entity.id ?? UUID()
        self.note = entity.note ?? ""
    }
}
