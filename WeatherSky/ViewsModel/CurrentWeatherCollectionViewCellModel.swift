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
}
