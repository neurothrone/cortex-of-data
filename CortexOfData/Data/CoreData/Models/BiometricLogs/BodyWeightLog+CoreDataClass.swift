//
//  BodyWeightLog+CoreDataClass.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(BodyWeightLog)
public class BodyWeightLog: BiometricLog {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<BodyWeightLog> {
    return NSFetchRequest<BodyWeightLog>(entityName: String(describing: BodyWeightLog.self))
  }
  
  @NSManaged public var bodyWeightInKg: Float
}
