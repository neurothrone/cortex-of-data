//
//  WalkLogIntents.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-12-01.
//

import AppIntents
import CoreData

@available(iOS 16, *)

struct StartWalkLogIntent: AppIntent {
  static var title: LocalizedStringResource = "Start walk log"
  static var description = IntentDescription("Starts a new Walk log")
  static var openAppWhenRun: Bool = false
  
  static var parameterSummary: some ParameterSummary {
    Summary("Saves the current time you started walking to a new Walk log")
  }
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let context = CoreDataProvider.shared.viewContext
    
    let incompleteLog: WalkLog?
    do {
      incompleteLog = try TimeFrameLog.getIncompleteLog(of: WalkLog.self, using: context)
    } catch {
      return .result(dialog: "Failed to retrieve incomplete Walk logs from Core Data.")
    }
    
    guard incompleteLog == nil else {
      return .result(dialog: "There is already an active Walk log. Complete or remove it first.")
    }
    
    TimeFrameLog.createPartialLog(of: WalkLog.self, using: context)
    return .result(dialog: "Created a Walk Log, get moving!")
  }
}

struct StopWalkLogIntent: AppIntent {
  static var title: LocalizedStringResource = "Stop walk log"
  static var description = IntentDescription("Completes your walk log")
  static var openAppWhenRun: Bool = false
  
  static var parameterSummary: some ParameterSummary {
    Summary("Saves the current time you stopped walking to an existing Walk log")
  }
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let context = CoreDataProvider.shared.viewContext

    let incompleteLog: WalkLog?
    do {
      incompleteLog = try TimeFrameLog.getIncompleteLog(of: WalkLog.self, using: context)
    } catch {
      return .result(dialog: "Failed to retrieve incomplete Walk logs from Core Data.")
    }
    
    if let incompleteLog {
      TimeFrameLog.completePartialLog(for: incompleteLog, using: context)
      return .result(dialog: "Completed a Walk Log, see how much you walked.")
    } else {
      return .result(dialog: "No incomplete log found. You must create a Walk log first.")
    }
  }
}

struct ResetWalkLogIntent: AppIntent {
  static var title: LocalizedStringResource = "Reset walk log"
  static var description = IntentDescription("Resets the start time of your active walk log")
  static var openAppWhenRun: Bool = false
  
  static var parameterSummary: some ParameterSummary {
    Summary("Resets the start time of your active walk log if it exists")
  }
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let context = CoreDataProvider.shared.viewContext

    let incompleteLog: WalkLog?
    do {
      incompleteLog = try TimeFrameLog.getIncompleteLog(of: WalkLog.self, using: context)
    } catch {
      return .result(dialog: "Failed to retrieve incomplete Walk logs from Core Data.")
    }
    
    if let incompleteLog {
      TimeFrameLog.completePartialLog(for: incompleteLog, using: context)
      return .result(dialog: "Resetted the start time of your active Walk Log.")
    } else {
      return .result(dialog: "No incomplete log found. You must create a Walk log first.")
    }
  }
}
