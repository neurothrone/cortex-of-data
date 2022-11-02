//
//  BiometricLog+CoreData.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//
//

import CoreData
import Foundation

@objc(BiometricLog)
public class BiometricLog: NSManagedObject {
  @nonobjc public class func fetchRequest() -> NSFetchRequest<BiometricLog> {
    return NSFetchRequest<BiometricLog>(entityName: String(describing: BiometricLog.self))
  }
  
  @NSManaged public var id: String
  @NSManaged public var measuredDate: Date
  
  public override func awakeFromInsert() {
    super.awakeFromInsert()
    
    id = UUID().uuidString
    measuredDate = .now
  }
}

extension BiometricLog : Identifiable {}
