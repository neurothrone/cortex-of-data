//
//  TimeFrameLog+Extensions.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import CoreData

extension TimeFrameLog {
  var duration: TimeInterval {
    guard let stoppedDate = stoppedDate
    else { return .zero }
    
    return startedDate.distance(to: stoppedDate)
  }
  
  static var name: String {
    switch Self.self {
    case is FastLog.Type:
      return "Fast"
    case is SleepLog.Type:
      return "Sleep"
    case is WalkLog.Type:
      return "Walk"
    default:
      return "Unknown"
    }
  }
}

extension TimeFrameLog {
  static func all<T: TimeFrameLog>() -> NSFetchRequest<T> {
    let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
    request.sortDescriptors = [NSSortDescriptor(keyPath: \T.startedDate, ascending: false)]
    return request
  }
  
  static func incompleteLogs<T: TimeFrameLog>() -> NSFetchRequest<T> {
    let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
    request.sortDescriptors = [NSSortDescriptor(keyPath: \T.startedDate, ascending: false)]
    request.predicate = NSPredicate(format: "stoppedDate == nil")
    return request
  }
}
