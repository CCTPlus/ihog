// StorageProvider.swift
//
// Follow Jay on mastodon @heyjay@iosdev.space
//              twitter   @heyjaywilson
//              github    @heyjaywilson
//              website   cctplus.dev

import Analytics
import CoreData
import Foundation

public class StorageProvider {
    let persistentContainer: NSPersistentCloudKitContainer

    public static let shared = StorageProvider()

    private init() {
        let objectModelURL = Bundle.module.url(forResource: "iHog", withExtension: "momd")
        let mom = NSManagedObjectModel(contentsOf: objectModelURL!)

        persistentContainer = NSPersistentCloudKitContainer(name: "iHog", managedObjectModel: mom!)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                Analytics.shared.capture(event: .dataLoadFailed)
                fatalError("Cloudkit store failed with error: \(error)")
            }
            print("Core data loaded: \(description)")
        }
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
}
