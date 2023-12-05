//
//  CurrentWeatherCollectionViewCellModel.swift
//  WeatherSky
//
//  Created by Alfin on 01/11/23.
//

import Foundation
import WeatherKit

struct CurrentWeatherCollectionViewCellModel {
  private let model: CurrentWeather
  
  
  init(model: CurrentWeather) {
    self.model = model
  }
  
  public var condition: String {
    return model.condition.description
  }
  
  public var temperature: String {
    return "\(Int(model.temperature.converted(to: .fahrenheit).value))F"
  }
  
  public var iconName: String {
    return model.symbolName
  }
  
}
