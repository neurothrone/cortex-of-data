//
//  WalkLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(WalkLog)
public class WalkLog: TimeFrameLog {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<WalkLog> {
    return NSFetchRequest<WalkLog>(entityName: String(describing: WalkLog.self))
  }
}
