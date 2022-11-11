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
  
  @State private var isAddSheetPresented = false

  private var hasPartialLog: Bool {
    guard fastLogs.isNotEmpty,
          let incompleteLog = fastLogs.first,
          incompleteLog.stoppedDate == nil
    else { return false }
    
    return true
  }
  
  var body: some View {
    Group {
      if fastLogs.isEmpty {
        Text("No Fast logs yet...")
      } else {
        content
      }
    }
    .sheet(isPresented: $isAddSheetPresented) {
      HStack {
        Group {
          Button(action: createPartialFeedLog) {
            Text("Start Fast")
          }
          .tint(.blue)
          .disabled(hasPartialLog)
          
          Button(action: completePartialFeedLog) {
            Text("Stop Fast")
          }
          .tint(.orange)
          .disabled(!hasPartialLog)
        }
        .buttonStyle(.borderedProminent)
      }
      .presentationDetents([.fraction(0.25), .medium])
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { isAddSheetPresented.toggle() }) {
          Image(systemName: "plus.circle")
        }
      }
    }
  }
  
  private var content: some View {
    List {
      Group {
        if hasPartialLog {
          ActiveLogView(log: fastLogs.first!, onStopTapped: completePartialFeedLog)
        } else {
          InactiveLogView(onStartTapped: createPartialFeedLog)
        }
      }
      
      ForEach(fastLogs) { log in
        FastLogsRowView(log: log)
      }
      .onDelete(perform: delete)
    }
  }
}



extension FastLogsScreen {
  private func createPartialFeedLog() {
    let newLog = FastLog(context: viewContext)
    newLog.startedDate = .now
    CoreDataProvider.save(using: viewContext)
  }
  
  private func completePartialFeedLog() {
    guard let incompleteLog = fastLogs.first else { return }
    
    incompleteLog.stoppedDate = .now
    CoreDataProvider.save(using: viewContext)
  }
  
  private func delete(atOffsets: IndexSet) {
    guard let index = atOffsets.first else { return }
    
    CoreDataProvider.delete(object: fastLogs[index], using: viewContext)
  }
}

struct FastLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    FastLogsScreen()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
