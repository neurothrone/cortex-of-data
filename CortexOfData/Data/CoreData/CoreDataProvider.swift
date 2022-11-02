//
//  CoreDataProvider.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import CoreData

private struct CKConfig {
  private init() {}
  
  static let containerName = "Entities"
  static let sharedAppGroup = "group.cortexOfData"
  static let cloudContainerID = "iCloud.cortexOfData"
}

final class CoreDataProvider {
  static let shared: CoreDataProvider = .init()
  static let preview: CoreDataProvider = {
    let provider = CoreDataProvider(inMemory: true)
    let viewContext = provider.viewContext
    // TODO: Generate preview items using viewContext
    return provider
  }()
  
  private let inMemory: Bool
  
  private lazy var container: NSPersistentCloudKitContainer = {
    let container = NSPersistentCloudKitContainer(name: CKConfig.containerName)
    
    let storeURL = URL.storeURL(
      for: CKConfig.sharedAppGroup,
      databaseName: CKConfig.containerName
    )
    
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    } else {
      let storeDescription = NSPersistentStoreDescription(url: storeURL)
      storeDescription.setOption(
        true as NSNumber,
        forKey: NSPersistentHistoryTrackingKey
      )
      storeDescription.setOption(
        true as NSNumber,
        forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey
      )
      
      storeDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(
        containerIdentifier: CKConfig.cloudContainerID)
      container.persistentStoreDescriptions = [storeDescription]
    }
    
    container.loadPersistentStores { store, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
    
    container.viewContext.automaticallyMergesChangesFromParent = true
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    
    return container
  }()
  
  var viewContext: NSManagedObjectContext {
    container.viewContext
  }
  
  init(inMemory: Bool = false) {
    self.inMemory = inMemory
  }
}
