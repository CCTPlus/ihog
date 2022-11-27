// StorageProvider.swift
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter  @heyjaywilson
//              github     @heyjaywilson
//              website  cctplus.dev

import CoreData
import Foundation

public class StorageProvider {
    let persistentContainer: NSPersistentCloudKitContainer

    public static let shared = StorageProvider()

    init() {
        persistentContainer = NSPersistentCloudKitContainer(name: "iHog")

        persistentContainer.loadPersistentStores { desrcription, error in
            if let error = error {
                fatalError("Cloudkit store faileddddd with error: \(error)")
            }
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
}
