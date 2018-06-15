//
//  InteractionHelpers.swift
//  iOSBenrinaAutomationHelpers
//
//  Created by Pavel Balint on 15/06/2018.
//  Copyright © 2018 Pavel Balint. All rights reserved.
//

enum ElementFrameError: Error {
  case frameWidthIsZero
  case frameHeightIsZero
}

func calculateNormalisedVectorForSwipe(expectedLengthInPixels: SwipeLength, direction: SwipeDirection, elementFrame: CGRect) throws
  -> CGVector {

  // we don't want to get division by zero so assertion is done to give more meaningful error message
  if elementFrame.width == 0.0 {
    throw ElementFrameError.frameWidthIsZero
  }
  if elementFrame.height == 0.0 {
    throw ElementFrameError.frameHeightIsZero
  }

  let normalisationFactorForWidth = CGFloat(1.0 / elementFrame.width)
  let normalisationFactorForHeight = CGFloat(1.0 / elementFrame.height)

  let xOffset = CGFloat(direction.vector.x * expectedLengthInPixels.multiplier) * normalisationFactorForWidth
  let yOffset = CGFloat(direction.vector.y * expectedLengthInPixels.multiplier) * normalisationFactorForHeight

  return CGVector(dx: xOffset, dy: yOffset)
}
