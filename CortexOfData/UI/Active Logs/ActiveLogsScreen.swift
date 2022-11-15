//
//  ActiveLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct ActiveLogsScreen: View {
  @FetchRequest(
    fetchRequest: FastLog.incompleteLogs(),
    animation: .default
  )
  private var incompleteFastLogs: FetchedResults<FastLog>
  
  @FetchRequest(
    fetchRequest: SleepLog.incompleteLogs(),
    animation: .default
  )
  private var incompleteSleepLogs: FetchedResults<SleepLog>
  
  @FetchRequest(
    fetchRequest: WalkLog.incompleteLogs(),
    animation: .default
  )
  private var incompleteWalkLogs: FetchedResults<WalkLog>
  
  var body: some View {
    NavigationStack {
      List {
        if let fastLog = incompleteFastLogs.first {
          Section {
            Text(fastLog.startedDate.inReadableFormat)
          } header: {
            Text("Active Fast Log")
          }
        }
        
        if let sleepLog = incompleteSleepLogs.first {
          Section {
            Text(sleepLog.startedDate.inReadableFormat)
          } header: {
            Text("Active Sleep Log")
          }
        }
        
        if let walkLog = incompleteWalkLogs.first {
          Section {
            Text(walkLog.startedDate.inReadableFormat)
          } header: {
            Text("Active Walk Log")
          }
        }
      }
      .navigationTitle("Active Logs")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ActiveLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    ActiveLogsScreen()
  }
}
