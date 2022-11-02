//
//  FeedLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(FeedLog)
public class FeedLog: TimeFrameLog {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<FeedLog> {
    return NSFetchRequest<FeedLog>(entityName: String(describing: FeedLog.self))
  }
}
