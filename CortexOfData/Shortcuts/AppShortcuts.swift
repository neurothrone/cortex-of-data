//
//  AppShortcuts.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-12-01.
//

import AppIntents

struct AppShortcuts: AppShortcutsProvider {
  @AppShortcutsBuilder
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: StartTimeFrameIntent(),
      phrases: ["Start \(\.$logType) with \(.applicationName)"],
      shortTitle: "Start Log",
      systemImageName: "clock"
    )
//    AppShortcut(
//      intent: StartWalkLogIntent(),
//      phrases: ["Start walking with \(.applicationName)"],
//      shortTitle: "Start Walk Log",
//      systemImageName: "figure.walk.departure"
//    )
//    AppShortcut(
//      intent: StopWalkLogIntent(),
//      phrases: ["Stop walking with \(.applicationName)"],
//      shortTitle: "Stop Walk Log",
//      systemImageName: "figure.walk.arrival"
//    )
//    AppShortcut(
//      intent: ResetWalkLogIntent(),
//      phrases: ["Reset walking with \(.applicationName)"],
//      shortTitle: "Reset Walk Log",
//      systemImageName: "figure.walk"
//    )
  }
}
