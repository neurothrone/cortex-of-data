//
//  SleepLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct SleepLogsScreen: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(fetchRequest: SleepLog.all(), animation: .default)
  private var sleepLogs: FetchedResults<SleepLog>
  
  var body: some View {
    LogListView(logs: sleepLogs)
  }
}

struct SleepLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    SleepLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
