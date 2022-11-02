//
//  ContentView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

private extension Tab {
  @ViewBuilder
  var view: some View {
    switch self {
    case .activeLogs:
      ActiveLogsScreen()
    case .allLogs:
      AllLogsScreen()
    case .settings:
      SettingsScreen()
    }
  }
  
  var systemImage: String {
    switch self {
    case .activeLogs:
      return "clock"
    case .allLogs:
      return "list.bullet.circle"
    case .settings:
      return "gear"
    }
  }
}

struct ContentView: View {
  @AppStorage("selectedTab")
  private var selectedTab: Tab = .activeLogs
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Group {
        ForEach(Tab.allCases) { tab in
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
  }
}
