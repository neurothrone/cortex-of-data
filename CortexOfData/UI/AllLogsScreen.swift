//
//  AllLogsScreen.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import SwiftUI

struct AllLogsScreen: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("All Logs")
      }
      .navigationTitle("All Logs")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct AllLogsScreen_Previews: PreviewProvider {
  static var previews: some View {
    AllLogsScreen()
  }
}
