//
//  DateFormatter+Extensions.swift
//  CortexOfData
//
//  Created by Zaid Neurothrone on 2022-11-11.
//

import Foundation

extension DateFormatter {
  static var twentyFourHourFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = .current
    formatter.setLocalizedDateFormatFromTemplate("EEE, MMM d, HH:mm a")
    return formatter
  }()
}
