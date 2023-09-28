//
//  SettingsViewModel.swift
//  WeatherSky
//
//  Created by Alfin on 28/09/23.
//

import Foundation

struct SettingsViewViewModel {
  let options: [SettingOption]
}

enum SettingOption: CaseIterable {
  case upgrade
  case privacyPolicy
  case terms
  case contact
  case getHelp
  case rateApp
  
  var title: String {
    switch self {
    case .upgrade:
      return "Upgrade to Pro"
    case .privacyPolicy:
      return "Privacy Policy"
    case .contact:
      return "Contact Us"
    case .getHelp:
      return "Get Help"
    case .rateApp:
      return "Rate App"
    case .terms:
      return "Terms of Condition"
    }
  }
}
