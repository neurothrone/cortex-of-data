//
//  FastLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct FastLogsScreen: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(fetchRequest: FastLog.all(), animation: .default)
  private var fastLogs: FetchedResults<FastLog>
  
  var body: some View {
    LogListView(logs: fastLogs)
  }
}

struct FastLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    FastLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
