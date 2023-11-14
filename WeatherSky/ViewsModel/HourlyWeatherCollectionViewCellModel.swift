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
}
