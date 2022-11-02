//
//  SettingsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct SettingsScreen: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Settings")
      }
      .navigationTitle("Settings")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct SettingsScreen_Previews: PreviewProvider {
  static var previews: some View {
    SettingsScreen()
  }
}
