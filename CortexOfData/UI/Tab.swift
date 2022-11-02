//
//  Tab.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import Foundation

enum Tab: String {
  case allLogs = "All Logs"
  case activeLogs = "Active Logs"
  case settings = "Settings"
}

extension Tab: Identifiable, CaseIterable {
  var id: Self { self }
}
