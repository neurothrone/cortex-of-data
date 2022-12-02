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
  
  var name: String {
    switch Self.self {
    case is FastLog.Type:
      return "fast"
    case is SleepLog.Type:
      return "sleep"
    case is WalkLog.Type:
      return "walk"
    default:
      return "unknown"
    }
  }
  
  static var className: String {
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
  
  static func incompleteLogs<T: TimeFrameLog>(limitToOne: Bool = true) -> NSFetchRequest<T> {
    let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
    request.sortDescriptors = [NSSortDescriptor(keyPath: \T.startedDate, ascending: false)]
    request.predicate = NSPredicate(format: "stoppedDate == nil")
    
    if limitToOne {
      request.fetchLimit = 1
    }
    
    return request
  }
  
  static func getIncompleteLog<T: TimeFrameLog>(
    of logType: T.Type,
    using context: NSManagedObjectContext
  ) throws -> T? {
    let request: NSFetchRequest<T> = incompleteLogs()
    return try context.fetch(request).first
  }
  
  static func createPartialLog<T: TimeFrameLog>(of logType: T.Type, using context: NSManagedObjectContext) -> T {
    let newLog = T(context: context)
    newLog.startedDate = .now
    newLog.save(using: context)
    
    return newLog
  }
  
  static func completePartialLog<T: TimeFrameLog>(for log: T, using context: NSManagedObjectContext) {
    log.stoppedDate = .now
    log.save(using: context)
  }
  
  static func resetPartialLog<T: TimeFrameLog>(for log: T, using context: NSManagedObjectContext) {
    log.startedDate = .now
    log.save(using: context)
  }
}
