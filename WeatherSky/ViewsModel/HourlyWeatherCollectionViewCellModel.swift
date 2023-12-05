//
//  HourlyWeatherCollectionViewCellModel.swift
//  WeatherSky
//
//  Created by Alfin on 01/11/23.
//

import Foundation
import WeatherKit

struct HourlyWeatherCollectionViewCellModel {
  private let model: HourWeather
  
  init(model: HourWeather) {
    self.model = model
  }
  
  public var iconName: String {
    return model.symbolName
  }
  
  public var temperature: String {
    return "\(Int(model.temperature.converted(to: .fahrenheit).value))F"
  }
  
  public var hour: String {
    print(model.date.description)
    let hour = Calendar.current.component(.hour, from: model.date)
    return "\(hour):00"
  }
}
