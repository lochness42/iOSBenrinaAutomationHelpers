//
//  InteractionEnums.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

public enum SwipeDirection {
  /**
   (x: 0, y: -1)
   */
  case up
  /**
   (x: 0, y: 1)
   */
  case down
  /**
   (x: -1, y: 0)
   */
  case left
  /**
   (x: 1, y: 0)
   */
  case right

  internal var vector: (x: Double, y: Double) {
    switch self {
    case .up: return (x: 0, y: -1)
    case .down: return (x: 0, y: 1)
    case .left: return (x: -1, y: 0)
    case .right: return (x: 1, y: 0)
    }
  }
}

public enum SwipeLength {
  /**
   100 pixels swipe length
   */
  case short
  /**
   300 pixels swipe length
   */
  case regular
  /**
   500 pixels swipe length
   */
  case long
  /**
   custom swipe length in pixels
   */
  case custom(Double)

  // length of swipe in pixels
  internal var multiplier: Double {
    switch self {
    case .short: return 100
    case .regular: return 300
    case .long: return 500
    case .custom(let swipeLength): return swipeLength
    }
  }
}

public enum ToggleSwitch: String {
  case on = "1"
  case off = "0"
}

public enum DatePickerMode: Equatable {
  public static func == (lhs: DatePickerMode, rhs: DatePickerMode) -> Bool {
    switch (lhs, rhs) {
    case let (.time(a), .time(b)),
         let (.date(a), .date(b)),
         let (.dateAndTime(a), .dateAndTime(b)):
      return a == b
    case (.countDownTimer, .countDownTimer):
      return true
    default:
      return false
    }
  }
  
  case time([DatePickerWheelSetup])
  case date([DatePickerWheelSetup])
  case dateAndTime([DatePickerWheelSetup])
  /**
   represents [.hours(.nonPadded24Hours), .minutes(.nonPadded)]
   */
  case countDownTimer
  
  var wheels: [DatePickerWheelSetup] {
    switch self {
    case .time(let wheelSetup):
      return wheelSetup
    case .date(let wheelSetup):
      return wheelSetup
    case .dateAndTime(let wheelSetup):
      return wheelSetup
    case .countDownTimer:
      return [.hours(.nonPadded24Hours), .minutes(.nonPadded)]
    }
  }
}

public enum DatePickerWheelSetup: Equatable {
  public static func == (lhs: DatePickerWheelSetup, rhs: DatePickerWheelSetup) -> Bool {
    switch (lhs, rhs) {
    case let (.year(a), .year(b)):
      return a == b
    case let (.month(a), .month(b)):
      return a == b
    case let (.day(a), .day(b)):
      return a == b
    case let (.hours(a), .hours(b)):
      return a == b
    case let (.minutes(a), .minutes(b)):
      return a == b
    case let (.seconds(a), .seconds(b)):
      return a == b
    case (.amPm, .amPm):
      return true
    case let (.dateMonth(a), .dateMonth(b)):
      return a.format == b.format
    default:
      return false
    }
  }
  
  case year(YearsFormat)
  case month(MonthFormat)
  case day(DayFormat)
  case hours(HoursFormat)
  case minutes(MinutesFormat)
  case seconds(SecondsFormat)
  case amPm
  case dateMonth(DateMonthFormat)
  
  var format: String {
    switch self {
    case .year(let format):
      return format.rawValue
    case .month(let format):
      return format.rawValue
    case .day(let format):
      return format.rawValue
    case .hours(let format):
      return format.rawValue
    case .minutes(let format):
      return format.rawValue
    case .seconds(let format):
      return format.rawValue
    case .amPm:
      return "a"
    case .dateMonth(let format):
      return format.format
    }
  }
}

public enum DateMonthFormat {
  /**
   "MMM d"
   */
  case withSpace
  /**
   "MMMd"
   */
  case withoutSpace
  /**
   custom format
   */
  case custom(String)
  
  var format: String {
    switch self {
    
    case .withSpace: return "MMM d"
    case .withoutSpace: return "MMMd"
    case .custom(let format): return format
    }
  }
}

public enum YearsFormat: String {
  case padded = "yyyy"
  case nonPadded = "y"
  case twoDigit = "yy"
}

public enum MonthFormat: String {
  case numeric = "M"
  case numericPadded = "MM"
  case shortHandName = "MMM"
  case fullName = "MMMM"
  case narrowName = "MMMMM"
}

public enum DayFormat: String {
  case padded = "dd"
  case nonPadded = "d"
  case shortDayOfWeek = "E"
  case fullNameDayOfWeek = "EEEE"
  case narrowNameDayOfWeek = "EEEEE"
}

public enum HoursFormat: String {
  case padded24Hours = "HH"
  case padded12Hours = "hh"
  case nonPadded24Hours = "H"
  case nonPadded12Hours = "h"
}

public enum MinutesFormat: String {
  case padded = "mm"
  case nonPadded = "m"
}

public enum SecondsFormat: String {
  case padded = "ss"
  case nonPadded = "s"
}
