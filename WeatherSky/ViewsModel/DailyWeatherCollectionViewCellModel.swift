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
}
