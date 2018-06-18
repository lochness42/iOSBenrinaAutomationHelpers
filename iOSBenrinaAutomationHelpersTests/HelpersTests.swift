//
//  HelpersTests.swift
//  iOSBenrinaAutomationHelpersTests
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

import XCTest
@testable import iOSBenrinaAutomationHelpers

class HelpersTests: XCTestCase {
  
  // MARK: - Tests for allowed element predicates function
  func testCheckAllowedElementPredicatesForAllowedPredicateTypes() {
    let predicates: [ElementPredicate] = [.isEnabled, .isDisabled, .contains(.identifier, "test")]
    XCTAssertFalse(checkAllowedElementPredicates(predicates))
  }

  func testCheckAllowedElementPredicatesForNotAllowedPredicateTypes() {
    let predicates: [ElementPredicate] = [.exists, .doesNotExist, .isHittable, .isNotHittable]
    XCTAssertTrue(checkAllowedElementPredicates(predicates))
  }

  // MARK: - Test for default timeout setter and getter
  func testCanGetAndSetDefaultTimeout() {
    XCTAssertEqual(timeout, 2)
    timeout = 5
    XCTAssertEqual(timeout, 5)
  }

  // MARK: - ToggleSwitch enum value tests
  func testToggleSwitchOn() {
    XCTAssertEqual(ToggleSwitch.on.rawValue, "1")
  }

  func testToggleSwitchOff() {
    XCTAssertEqual(ToggleSwitch.off.rawValue, "0")
  }
  
  // MARK: - DatePicker helper test
  func testStringValueIsCorreclyGeneratedInFormatAndLocaleForDate() {
    let dateFormatter = DateFormatter()
    let dateAsString = "01-02-2018 00:00"
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
    let newDate = dateFormatter.date(from: dateAsString)
    let generatedString = generateWheelValueForDateInFormatAndLocale(date: newDate!, format: "MMM d", locale: Locale(identifier: "ja_JP"))
    XCTAssertEqual(generatedString, "2月1日")
  }
  
  // MARK: - Date Picker Mode enum tests
  func testDatePickerModesAreDifferent() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .amPm
    let datePickerMode1: DatePickerMode = .time([datePickerWheelSetup1])
    let datePickerWheelSetup2: DatePickerWheelSetup = .day(.padded)
    let datePickerMode2: DatePickerMode = .dateAndTime([datePickerWheelSetup2])
    XCTAssertFalse(datePickerMode1 == datePickerMode2)
  }

  func testDatePickerModesAreDifferentWithSameSetup() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .amPm
    let datePickerMode1: DatePickerMode = .time([datePickerWheelSetup1])
    let datePickerWheelSetup2: DatePickerWheelSetup = .amPm
    let datePickerMode2: DatePickerMode = .dateAndTime([datePickerWheelSetup2])
    XCTAssertFalse(datePickerMode1 == datePickerMode2)
  }

  func testDatePickerModesAreTimeWithSameSetup() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .amPm
    let datePickerMode1: DatePickerMode = .time([datePickerWheelSetup1])
    let datePickerWheelSetup2: DatePickerWheelSetup = .amPm
    let datePickerMode2: DatePickerMode = .time([datePickerWheelSetup2])
    XCTAssertTrue(datePickerMode1 == datePickerMode2)
  }
  
  func testDatePickerModesAreTimeWithDifferentSetup() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .amPm
    let datePickerMode1: DatePickerMode = .time([datePickerWheelSetup1])
    let datePickerWheelSetup2: DatePickerWheelSetup = .hours(.nonPadded12Hours)
    let datePickerMode2: DatePickerMode = .time([datePickerWheelSetup2])
    XCTAssertFalse(datePickerMode1 == datePickerMode2)
  }
  
  func testDatePickerModesAreCountDownTimer() {
    let datePickerMode1: DatePickerMode = .countDownTimer
    let datePickerMode2: DatePickerMode = .countDownTimer
    XCTAssertTrue(datePickerMode1 == datePickerMode2)
  }
  
  func testTimeDatePickerMode() {
    let datePickerWheelSetup: DatePickerWheelSetup = .amPm
    let datePickerMode: DatePickerMode = .time([datePickerWheelSetup])
    XCTAssertEqual(datePickerMode.wheels.count, 1)
    XCTAssertEqual(datePickerMode.wheels[0], datePickerWheelSetup)
  }
  
  func testDateDatePickerMode() {
    let datePickerWheelSetup: DatePickerWheelSetup = .amPm
    let datePickerMode: DatePickerMode = .date([datePickerWheelSetup])
    XCTAssertEqual(datePickerMode.wheels.count, 1)
    XCTAssertEqual(datePickerMode.wheels[0], datePickerWheelSetup)
  }

  func testDateAndTimeDatePickerMode() {
    let datePickerWheelSetup: DatePickerWheelSetup = .amPm
    let datePickerMode: DatePickerMode = .dateAndTime([datePickerWheelSetup])
    XCTAssertEqual(datePickerMode.wheels.count, 1)
    XCTAssertEqual(datePickerMode.wheels[0], datePickerWheelSetup)
  }
  
  func testCountDownTimerDatePickerMode() {
    let datePickerMode: DatePickerMode = .countDownTimer
    XCTAssertEqual(datePickerMode.wheels.count, 2)
    XCTAssertEqual(datePickerMode.wheels, [.hours(.nonPadded24Hours), .minutes(.nonPadded)])
  }
  
  // MARK: - Date Picker Wheel Setup enum tests
  func testYearDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .year(.padded)
    XCTAssertEqual(datePickerWheelSetup.format, "yyyy")
  }
  
  func testMonthDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .month(.numericPadded)
    XCTAssertEqual(datePickerWheelSetup.format, "MM")
  }
  
  func testDayDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .day(.padded)
    XCTAssertEqual(datePickerWheelSetup.format, "dd")
  }
  
  func testHoursDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .hours(.padded12Hours)
    XCTAssertEqual(datePickerWheelSetup.format, "hh")
  }
  
  func testMinutesDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .minutes(.padded)
    XCTAssertEqual(datePickerWheelSetup.format, "mm")
  }
  
  func testSecondsDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .seconds(.padded)
    XCTAssertEqual(datePickerWheelSetup.format, "ss")
  }
  
  func testAmPmDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .amPm
    XCTAssertEqual(datePickerWheelSetup.format, "a")
  }

  func testDateMonthDatePickerWheelSetup() {
    let datePickerWheelSetup: DatePickerWheelSetup = .dateMonth(.withSpace)
    XCTAssertEqual(datePickerWheelSetup.format, "MMM d")
  }
  
  // MARK: - Date Picker Wheel Setup equatable tests
  func testYearDatePickerWheelSetupEquatable() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .year(.padded)
    let datePickerWheelSetup2: DatePickerWheelSetup = .year(.padded)
    XCTAssertTrue(datePickerWheelSetup1 == datePickerWheelSetup2)
  }
  
  func testMonthDatePickerWheelSetupEquatable() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .month(.fullName)
    let datePickerWheelSetup2: DatePickerWheelSetup = .month(.fullName)
    XCTAssertTrue(datePickerWheelSetup1 == datePickerWheelSetup2)
  }
  
  func testDayDatePickerWheelSetupEquatable() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .day(.padded)
    let datePickerWheelSetup2: DatePickerWheelSetup = .day(.padded)
    XCTAssertTrue(datePickerWheelSetup1 == datePickerWheelSetup2)
  }

  func testSecondsDatePickerWheelSetupEquatable() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .seconds(.padded)
    let datePickerWheelSetup2: DatePickerWheelSetup = .seconds(.padded)
    XCTAssertTrue(datePickerWheelSetup1 == datePickerWheelSetup2)
  }
  
  func testdateMonthDatePickerWheelSetupEquatable() {
    let datePickerWheelSetup1: DatePickerWheelSetup = .dateMonth(.custom("test"))
    let datePickerWheelSetup2: DatePickerWheelSetup = .dateMonth(.custom("test"))
    XCTAssertTrue(datePickerWheelSetup1 == datePickerWheelSetup2)
  }
}
