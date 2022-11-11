//
//  FastLog+Preview.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-08.
//

import CoreData
import Foundation

extension FastLog {
  enum Preview {
    static func createSample(using context: NSManagedObjectContext) {
      let fastLog = FastLog(context: context)
      fastLog.startedDate = .now.subtracting(hours: 2)
      CoreDataProvider.save(using: context)
    }
  }
}
