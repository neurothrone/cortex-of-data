//
//  GenericLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-17.
//

import SwiftUI

struct GenericLogsScreen<T: TimeFrameLog>: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @AppStorage(Constants.AppStorage.datePickerDisplayMode)
  private var displayMode: DatePickerDisplayMode = .compact
  
  @FetchRequest(fetchRequest: T.all(), animation: .default)
  private var logs: FetchedResults<T>
  
  @State private var isAddManualLogPresented = false
  
  var body: some View {
    LogListView(logs: logs)
      .navigationTitle("\(T.name) logs")
      .sheet(isPresented: $isAddManualLogPresented) {
        AddManualLogSheet<T>()
          .presentationDetents(
            displayMode == .compact
            ? [.fraction(0.25), .medium, .large]
            : [.large]
          )
      }
      .toolbar {
        Menu {
          Button(action: { isAddManualLogPresented.toggle() }) {
            Label("Add \(T.name) log manually", systemImage: "calendar.badge.plus")
          }
        } label: {
          Image(systemName: "ellipsis.circle")
        }
      }
  }
}

struct GenericLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    GenericLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
