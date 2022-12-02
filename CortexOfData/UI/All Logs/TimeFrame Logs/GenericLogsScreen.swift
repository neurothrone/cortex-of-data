//
//  GenericLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-17.
//

import SwiftUI

struct GenericLogsScreen<T: TimeFrameLog>: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  #if os(iOS)
  @AppStorage(Constants.AppStorage.datePickerDisplayMode)
  private var displayMode: DatePickerDisplayMode = .compact
  #endif
  
  @FetchRequest(fetchRequest: T.all(), animation: .default)
  private var logs: FetchedResults<T>
  
  @State private var isAddManualLogPresented = false
  
  var body: some View {
    LogListView(logs: logs)
      .navigationTitle("\(T.className) logs")
      .sheet(isPresented: $isAddManualLogPresented) {
        AddManualLogSheet<T>()
        #if os(iOS)
          .presentationDetents(
            displayMode == .compact
            ? [.fraction(0.25), .medium, .large]
            : [.large]
          )
        #endif
      }
      .toolbar {
        #if os(iOS)
        Menu {
          Button(action: { isAddManualLogPresented.toggle() }) {
            Label("Add \(T.className) log manually", systemImage: "calendar.badge.plus")
          }
        } label: {
          Image(systemName: "ellipsis.circle")
        }
        #endif
      }
  }
}

struct GenericLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    GenericLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
