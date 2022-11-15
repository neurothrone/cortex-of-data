//
//  ActiveLogView.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-11.
//

import SwiftUI

struct ActiveLogView<T: TimeFrameLog>: View {
  @ObservedObject var log: T
  
  @State private var startTime: Date = .now
  @State private var currentTime: Date = .now
  
  private let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
  
  private var duration: TimeInterval {
    log.startedDate.distance(to: currentTime)
  }
  
  var body: some View {
    content
      .onAppear {
        startTime = log.startedDate
        currentTime = .now
      }
      .onReceive(timer) { newTime in
        currentTime = newTime
      }
  }
  
  private var content: some View {
    HStack {
      Text(log.isFault ? "Unknown" : log.startedDate.inReadableFormat)
      
      Spacer()
      
      Text(log.isFault ? "Unknown" :  log.startedDate.duration(to: currentTime).inHoursAndMinutesDigitalClockStyle)
        .font(.title3.bold())
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.secondary.opacity(0.5))
        )
    }
    .padding()
  }
}


//struct ActiveLogView_Previews: PreviewProvider {
//  static var previews: some View {
//    ActiveLogView()
//  }
//}
