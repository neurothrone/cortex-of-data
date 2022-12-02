//
//  HeartLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(HeartLog)
public class HeartLog: BiometricLog {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<HeartLog> {
    return NSFetchRequest<HeartLog>(entityName: String(describing: HeartLog.self))
  }
  
  @NSManaged public var pulseRate: Int16
  @NSManaged public var diastolicBP: Int16
  @NSManaged public var systolicBP: Int16
}
