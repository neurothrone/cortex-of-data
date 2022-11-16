//
//  SwipeableLogView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-15.
//

import SwiftUI

struct SwipeableLogView<T: TimeFrameLog>: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    fetchRequest: T.incompleteLogs(),
    animation: .default
  )
  var incompleteLogs: FetchedResults<T>
  
  @State private var isTimerRunning = false
  
  var hasPartialLog: Bool {
    if let incompleteLog = incompleteLogs.first,
       incompleteLog.stoppedDate == nil {
      return true
    }
    
    return false
  }
  
  init(for type: T.Type) {}
  
  var body: some View {
    Group {
      if isTimerRunning,
         let incompleteLog = incompleteLogs.first {
        ActiveLogView(log: incompleteLog)
      } else {
        Text("No active log yet. Swipe in from the left to begin.")
          .padding(.vertical)
      }
    }
    .onAppear(perform: checkForPartialLog)
    .onChange(of: incompleteLogs.first) { _ in
      checkForPartialLog()
    }
    .swipeActions(edge: .leading, allowsFullSwipe: false) {
      Button(action: isTimerRunning
             ? completePartialFeedLog
             : createPartialFeedLog
      ) {
        Label(isTimerRunning
              ? "Stop"
              : "Start",
              systemImage: isTimerRunning
              ? "clock.badge.xmark"
              : "clock.badge.checkmark"
        )
      }
      .tint(.purple)
    }
    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
      Button(action: resetPartialLog) {
        Label("Reset", systemImage: "clock.arrow.circlepath")
      }
      .disabled(!isTimerRunning)
      .tint(.orange)
    }
  }
}

extension SwipeableLogView {
  private func checkForPartialLog() {
    isTimerRunning = hasPartialLog
  }
  
  private func createPartialFeedLog() {
    let newLog = T(context: viewContext)
    newLog.startedDate = .now
    CoreDataProvider.save(using: viewContext)
    
    isTimerRunning = true
  }
  
  private func completePartialFeedLog() {
    guard let incompleteLog = incompleteLogs.first else { return }
    
    isTimerRunning = false
    incompleteLog.stoppedDate = .now
    CoreDataProvider.save(using: viewContext)
  }
  
  private func resetPartialLog() {
    guard let incompleteLog = incompleteLogs.first else { return }
    
    incompleteLog.startedDate = .now
    CoreDataProvider.save(using: viewContext)
  }
}

struct SwipeableLogView_Previews: PreviewProvider {
  static var previews: some View {
    SwipeableLogView(for: TimeFrameLog.self)
  }
}
