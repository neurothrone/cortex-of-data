//
//  ActiveLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct ActiveLogsScreen: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    fetchRequest: TimeFrameLog.incompleteLogs(),
    animation: .default
  )
  private var incompleteLogs: FetchedResults<TimeFrameLog>
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(incompleteLogs) { log in
          Section {
            Text(log.startedDate.inReadableFormat)
          } header: {
            Text("Active \(log.name) log")
          }
        }
        .onDelete(perform: deleteLog)
      }
      .navigationTitle("Active Logs")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

extension ActiveLogsScreen {
  private func deleteLog(atOffsets: IndexSet) {
    guard let index = atOffsets.first else { return }
    
    incompleteLogs[index].delete(using: viewContext)
  }
}

struct ActiveLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    ActiveLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
