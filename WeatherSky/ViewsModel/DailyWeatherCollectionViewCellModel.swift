//
//  DailyWeatherCollectionViewCellModel.swift
//  WeatherSky
//
//  Created by Alfin on 01/11/23.
//

import Foundation
import WeatherKit

struct DailyWeatherCollectionViewCellModel {
  private let model: DayWeather
  
  init(model: DayWeather) {
    self.model = model
  }
  
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    return formatter
  }()
  
  
  public var iconName: String {
    return model.symbolName
  }
  
  public var temperature: String {
    return "\(model.lowTemperature.description) - \(model.highTemperature.description)"
  }
  
  public var day: String {
    print(model.date.description)
    let day = Calendar.current.component(.weekday, from: model.date)
    return string(from: day)
  }
  
  private func string(from day: Int) -> String {
    switch  (day) {
    case 1:
      return "Monday"
    case 2:
      return "Tuesday"
    case 3:
      return "Wednesday"
    case 4:
      return "Thursday"
    case 5:
      return "Friday"
    case 6:
      return "Saturday"
    case 7:
      return "Sunday"
    default:
      return "Unavailable"
    }
  }
}
