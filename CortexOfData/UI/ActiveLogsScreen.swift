//
//  ActiveLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct ActiveLogsScreen: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Active Logs")
      }
      .navigationTitle("Active Logs")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct ActiveLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    ActiveLogsScreen()
  }
}
