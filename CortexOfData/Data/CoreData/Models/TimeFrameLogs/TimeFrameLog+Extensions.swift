//
//  TimeFrameLog+Extensions.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import CoreData

extension TimeFrameLog {
  var startedAt: String {
    startedDate.formatted()
  }
  
  var stoppedAt: String {
    stoppedDate?.formatted() ?? ""
  }
  
  var duration: TimeInterval {
    guard let stoppedDate = stoppedDate
    else { return .zero }
    
    return startedDate.distance(to: stoppedDate)
  }
}

extension TimeFrameLog {
  static func all<T: TimeFrameLog>() -> NSFetchRequest<T> {
    let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
    request.sortDescriptors = [NSSortDescriptor(keyPath: \T.startedDate, ascending: false)]
    return request
  }
  
  static func firstIncompleteLog<T: TimeFrameLog>() -> NSFetchRequest<T> {
    let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
    request.fetchLimit = 1
    request.sortDescriptors = [NSSortDescriptor(keyPath: \T.startedDate, ascending: false)]
    request.predicate = NSPredicate(format: "stoppedDate == nil")
    return request
  }
}
