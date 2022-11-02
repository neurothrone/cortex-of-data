//
//  SleepLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(SleepLog)
public class SleepLog: TimeFrameLog {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<SleepLog> {
    return NSFetchRequest<SleepLog>(entityName: String(describing: SleepLog.self))
  }
}
