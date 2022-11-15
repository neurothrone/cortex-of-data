//
//  WalkLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct WalkLogsScreen: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(fetchRequest: WalkLog.all(), animation: .default)
  private var walkLogs: FetchedResults<WalkLog>
  
  var body: some View {
    LogListView(logs: walkLogs)
  }
}

struct WalkLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    WalkLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
