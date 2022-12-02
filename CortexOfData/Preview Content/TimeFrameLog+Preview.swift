//
//  TimeFrameLog+Preview.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-12-01.
//

import CoreData
import Foundation

extension TimeFrameLog {
  enum Preview {
    static func createSamples(
      using context: NSManagedObjectContext
    ) {
      let fastLog = TimeFrameLog.createPartialLog(of: FastLog.self, using: context)
      let sleepLog = TimeFrameLog.createPartialLog(of: SleepLog.self, using: context)
      let walkLog = TimeFrameLog.createPartialLog(of: WalkLog.self, using: context)
      
      for log in [fastLog, sleepLog, walkLog] {
        log.startedDate = .now.subtracting(hours: Int.random(in: 2...6))
        log.save(using: context)
      }
    }
  }
}

