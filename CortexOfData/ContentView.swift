//
//  ContentView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct ContentView: View {
  @AppStorage(Constants.AppStorage.selectedTab)
  private var selectedTab: Screen = .activeLogs
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Group {
        ForEach(Screen.allCases) { tab in
          tab.view
            .tabItem {
              Label(tab.rawValue, systemImage: tab.systemImage)
            }
        }
      }
      .toolbar(.visible, for: .tabBar)
      .toolbarBackground(.ultraThinMaterial, for: .tabBar)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.managedObjectContext, CoreDataProvider.preview.viewContext)
  }
}
