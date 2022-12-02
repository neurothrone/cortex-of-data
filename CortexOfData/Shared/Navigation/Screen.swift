//
//  Screen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-12-01.
//

import SwiftUI

enum Screen: String {
  case activeLogs = "Active Logs"
  case allLogs = "All Logs"
  case settings = "Settings"
}

extension Screen: Identifiable, CaseIterable {
  var id: Self { self }
  
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
