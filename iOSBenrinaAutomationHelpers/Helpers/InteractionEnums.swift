//
//  InteractionEnums.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

public enum SwipeDirection {
  case up
  case down
  case left
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
