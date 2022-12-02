//
//  AppMain.swift
//  CortexOfData watchOS Watch App
//
//  Created by Zaid Neurothrone on 2022-12-01.
//

import SwiftUI

@main
struct AppMain: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
    }
  }
}
