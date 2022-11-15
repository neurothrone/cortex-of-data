//
//  InactiveLogView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-11.
//

import SwiftUI

struct InactiveLogView: View {
  let onStartTapped: () -> Void
  
  var body: some View {
    HStack {
      Text("No active log yet. Press the button to begin.")
      VStack(alignment: .leading) {
        
        Button("Start", action: onStartTapped)
          .buttonStyle(.borderedProminent)
          .tint(.purple)
      }
      
      Spacer()
    }
    .padding()
  }
}

struct InactiveLogView_Previews: PreviewProvider {
  static var previews: some View {
    InactiveLogView(onStartTapped: {})
  }
}
