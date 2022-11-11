//
//  FastLogsRowView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-11.
//

import SwiftUI

struct FastLogsRowView: View {
  @ObservedObject var log: FastLog
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Label(log.startedDate.inReadableFormat, systemImage: "play.fill")
          .foregroundColor(.blue)
        
        Spacer()
        
        if log.stoppedDate != nil {
          Text(log.duration.inHoursAndMinutes)
            .font(.callout.bold())
            .foregroundColor(.indigo)
        }
      }
      
      if let stoppedDate = log.stoppedDate {
        Label(stoppedDate.inReadableFormat, systemImage: "stop.fill")
          .foregroundColor(.orange)
      }
    }
  }
}

//struct FastLogsRowView_Previews: PreviewProvider {
//  static var previews: some View {
//    FastLogsRowView()
//  }
//}
