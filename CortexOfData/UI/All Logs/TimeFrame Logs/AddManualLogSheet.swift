//
//  AddManualLogSheet.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-17.
//

import SwiftUI

struct AddManualLogSheet<T: TimeFrameLog>: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\.managedObjectContext) private var viewContext
  
  #if os(iOS)
  @AppStorage(Constants.AppStorage.datePickerDisplayMode)
  private var displayMode: DatePickerDisplayMode = .compact
  #endif
  
  @State private var startedDate: Date = .now
  @State private var stoppedDate: Date = .now
  
  var body: some View {
    NavigationStack {
      Form {
        #if os(iOS)
        CustomDatePicker(
          selection: $startedDate,
          label: "Started date",
          displayMode: displayMode
        )
        
        CustomDatePicker(
          selection: $stoppedDate,
          label: "Stopped date",
          displayMode: displayMode
        )
        #endif
      }
      .navigationTitle("Add Manual Log")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        #if os(iOS)
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel", role: .cancel, action: { dismiss() })
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done", action: addManualLog)
            .disabled(stoppedDate <= startedDate)
        }
        #endif
      }
    }
  }
}

extension AddManualLogSheet {
  private func addManualLog() {
    let log = T(context: viewContext)
    log.startedDate = startedDate
    log.stoppedDate = stoppedDate
    log.save(using: viewContext)
    
    dismiss()
  }
}

struct AddManualLogSheet_Previews: PreviewProvider {
  static var previews: some View {
    AddManualLogSheet()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
