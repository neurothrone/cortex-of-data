//
//  FastLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(FastLog)
public class FastLog: TimeFrameLog {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<FastLog> {
    return NSFetchRequest<FastLog>(entityName: String(describing: FastLog.self))
  }
}
