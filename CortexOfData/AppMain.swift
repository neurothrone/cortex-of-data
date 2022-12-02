//
//  AppMain.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
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
