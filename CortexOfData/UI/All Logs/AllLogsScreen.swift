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
      List {
        Section {
          NavigationLink(destination: GenericLogsScreen<FastLog>()) {
            Label("Fasting", systemImage: "fork.knife")
          }
          NavigationLink(destination: GenericLogsScreen<SleepLog>()) {
            Label("Sleeping", systemImage: "bed.double")
          }
          NavigationLink(destination: GenericLogsScreen<WalkLog>()) {
            Label("Walking", systemImage: "figure.walk")
          }
        } header: {
          Text("Timeframe logs")
        }
        
        Section {
          NavigationLink(destination: BodyWeightLogsScreen()) {
            Label("Body weight", systemImage: "scalemass")
          }
          NavigationLink(destination: HeartMetricsLogsScreen()) {
            Label("Heart metrics", systemImage: "heart")
          }
        } header: {
          Text("Biometrical logs")
        }
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
