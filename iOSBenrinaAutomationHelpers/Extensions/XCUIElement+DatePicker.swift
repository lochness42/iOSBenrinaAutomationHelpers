//
//  XCUIElement+DatePicker.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 16/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
  /**
   Sets datePicker wheels to chosen date/time
   Works only for datePicker objects
   - Note: Doesn't fail if element type isn't **datePicker**, but does nothing as a result
   ## Usage Example: ##
   ````
   //Setup
   let locale = Locale(identifier: "en_GB")
   
   let datePickerSetup = DatePickerMode.date([
      DatePickerWheelSetup.year(YearsFormat.padded),
      DatePickerWheelSetup.month(MonthFormat.numeric),
      DatePickerWheelSetup.day(DayFormat.padded)
   ])
   
   let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
   
   let datePicker = XCUIApplication().datePickers.element(boundBy: 0)
   
   // Use
   datePicker.adjustTo(date: tomorrow, datePickerMode: datePickerSetup, locale: locale)
   ````
   
   - Parameter date: date that we want to get in chosen format.
   - Parameter format: chosen date format.
   - Parameter locale: locale that should be applied to the formatted date.
   
   - Returns: date string in chosen locale and format
   */
  public func adjustTo(date value: Date, datePickerMode: DatePickerMode, locale: Locale = Locale.current) {
    if self.elementType == .datePicker {
      for (wheelIndex, wheelSetup) in datePickerMode.wheels.enumerated() {
        let wheelValue = generateWheelValueForDateInFormatAndLocale(date: value, format: wheelSetup.format, locale: locale)
        self.pickerWheels.element(boundBy: wheelIndex).adjust(toPickerWheelValue: wheelValue)
      }
    }
  }
}
