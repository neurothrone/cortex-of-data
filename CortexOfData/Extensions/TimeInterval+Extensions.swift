//
//  TimeInterval+Extensions.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-02.
//

import Foundation

extension TimeInterval {
  struct Formatter {
    static let hourAndMinFormatter: DateComponentsFormatter = {
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.hour, .minute]
      formatter.unitsStyle = .abbreviated
      return formatter
    }()
  }
  
  var toHoursAndMinutes: String {
    guard !self.isNaN,
          !self.isInfinite,
          let string = Formatter.hourAndMinFormatter.string(from: self)
    else { return "" }
    return string
  }
}
