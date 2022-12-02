//
//  ContentView.swift
//  CortexOfData watchOS Watch App
//
//  Created by Zaid Neurothrone on 2022-12-01.
//

import SwiftUI

struct NavigationListRow: View {
  let text: String
  let systemImage: String
  
  var body: some View {
    HStack {
      Image(systemName: systemImage)
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text(text)
    }
  }
}

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List(Screen.allCases) { screen in
        NavigationLink(destination: screen.view) {
          NavigationListRow(text: screen.rawValue, systemImage: screen.systemImage)
        }
      }
      .navigationTitle(Constants.App.name)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
