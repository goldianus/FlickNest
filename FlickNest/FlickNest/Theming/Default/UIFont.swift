//
//  UIFont.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/01/24.
//

import UIKit


class CommonUI {
  
}

extension Bundle {
  static var current: Bundle {
    Bundle.init(for: CommonUI.self)
  }
}

extension UIFont {
  public enum FontType: String {
    case robotoThin = "Roboto-Thin"
    case robotoBold = "Roboto-Bold"
    case robotoMedium = "Roboto-Medium"
    case robotoBlack = "Roboto-Black"
    case robotoRegular = "Roboto-Regular"
  }
  
  internal static func custom(type: FontType, size: CGFloat) -> UIFont {
    return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
  }
  
  static func loadCustomFont() {
    self.jbsRegisterFont(withFilename: FontType.robotoThin)
    self.jbsRegisterFont(withFilename: FontType.robotoBold)
    self.jbsRegisterFont(withFilename: FontType.robotoMedium)
    self.jbsRegisterFont(withFilename: FontType.robotoBlack)
    self.jbsRegisterFont(withFilename: FontType.robotoRegular)
  }
  
  static func jbsRegisterFont(withFilename filename: FontType) {
    
    guard let pathForResourceString = Bundle.current.path(forResource: filename.rawValue, ofType: "ttf") else {
      print("UIFont+:  Failed to register font - path for resource not found.")
      return
    }
    
    guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
      print("UIFont+:  Failed to register font - font data could not be loaded.")
      return
    }
    
    guard let dataProvider = CGDataProvider(data: fontData) else {
      print("UIFont+:  Failed to register font - data provider could not be loaded.")
      return
    }
    
    guard let font = CGFont(dataProvider) else {
      print("UIFont+:  Failed to register font - font could not be loaded.")
      return
    }
    
    var errorRef: Unmanaged<CFError>? = nil
    if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
      print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
    }
  }
}
