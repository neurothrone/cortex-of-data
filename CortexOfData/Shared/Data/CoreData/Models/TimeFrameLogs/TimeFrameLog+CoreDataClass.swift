//
//  TimeFrameLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(TimeFrameLog)
public class TimeFrameLog: NSManagedObject {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeFrameLog> {
    return NSFetchRequest<TimeFrameLog>(entityName: String(describing: TimeFrameLog.self))
  }

  @NSManaged public var id: String
  @NSManaged public var startedDate: Date
  @NSManaged public var stoppedDate: Date?
  
  public override func awakeFromInsert() {
    super.awakeFromInsert()
    
    id = UUID().uuidString
  }
}

extension TimeFrameLog : Identifiable {}
