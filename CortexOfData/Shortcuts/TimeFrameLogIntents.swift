//
//  TimeFrameLogIntents.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-12-02.
//

import AppIntents

enum TimeFrameLogType: String, CaseIterable {
  case fasting,
       sleeping,
       walking
  
  var title: String {
    switch self {
    case .fasting:
      return "Fast Log"
    case .sleeping:
      return "Sleep Log"
    case .walking:
      return "Walk Log"
    }
  }
}

struct StartTimeFrameIntent: AppIntent {
  static let title: LocalizedStringResource = "Start Log"
  static var openAppWhenRun: Bool = false
  
  @Parameter(title: "Log Type")
  var logType: String?
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let logInput: String
    
    if let logType {
      logInput = logType
    } else {
      logInput = try await $logType.requestDisambiguation(
        among: TimeFrameLogType.allCases.map { $0.rawValue },
        dialog: "What type of log would you like to start?"
      )
    }
    
    guard let logToStart = TimeFrameLogType(rawValue: logInput) else {
      return .result(dialog: "That is not a supported log type. Try fasting, sleeping or walking.")
    }
    
    let context = CoreDataProvider.shared.viewContext
    
    switch logToStart {
    case .fasting:
      let incompleteLog: FastLog?
      do {
        incompleteLog = try TimeFrameLog.getIncompleteLog(of: FastLog.self, using: context)
      } catch {
        return .result(dialog: "Failed to retrieve incomplete Fast logs from Core Data.")
      }
      
      guard incompleteLog == nil else {
        return .result(dialog: "There is already an active Fast log. Complete or remove it first.")
      }
      
      _ = TimeFrameLog.createPartialLog(of: FastLog.self, using: context)
      return .result(dialog: "Created a Fast Log, get moving!")
    case .sleeping:
      let incompleteLog: SleepLog?
      do {
        incompleteLog = try TimeFrameLog.getIncompleteLog(of: SleepLog.self, using: context)
      } catch {
        return .result(dialog: "Failed to retrieve incomplete Sleep logs from Core Data.")
      }
      
      guard incompleteLog == nil else {
        return .result(dialog: "There is already an active Sleep log. Complete or remove it first.")
      }
      
      _ = TimeFrameLog.createPartialLog(of: SleepLog.self, using: context)
      return .result(dialog: "Created a Sleep Log, get moving!")
    case .walking:
      let incompleteLog: WalkLog?
      do {
        incompleteLog = try TimeFrameLog.getIncompleteLog(of: WalkLog.self, using: context)
      } catch {
        return .result(dialog: "Failed to retrieve incomplete Walk logs from Core Data.")
      }
      
      guard incompleteLog == nil else {
        return .result(dialog: "There is already an active Walk log. Complete or remove it first.")
      }
      
      _ = TimeFrameLog.createPartialLog(of: WalkLog.self, using: context)
      return .result(dialog: "Created a Walk Log, get moving!")
    }
  }
}
