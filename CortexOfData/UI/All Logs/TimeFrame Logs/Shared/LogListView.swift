//
//  LogListView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-15.
//

import SwiftUI

struct LogListView<T: TimeFrameLog>: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  let logs: FetchedResults<T>
  
  var body: some View {
    List {
      SwipeableLogView(for: T.self)
      
      if logs.isNotEmpty {
        ForEach(logs) {
          LogListRowView(log: $0)
        }
        .onDelete(perform: delete)
      }
    }
  }
}

extension LogListView {
  private func delete(atOffsets: IndexSet) {
    guard let index = atOffsets.first else { return }
    
    CoreDataProvider.delete(object: logs[index], using: viewContext)
  }
}
