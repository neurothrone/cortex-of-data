//
//  LogListRowView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-12.
//

import SwiftUI

struct LogListRowView<T: TimeFrameLog>: View {
  @ObservedObject var log: T
  
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Label(log.isFault ? "Unknown" :  log.startedDate.inReadableFormat, systemImage: "play.fill")
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

//struct LogListRowView_Previews: PreviewProvider {
//  static var previews: some View {
//    LogListRowView()
//  }
//}
