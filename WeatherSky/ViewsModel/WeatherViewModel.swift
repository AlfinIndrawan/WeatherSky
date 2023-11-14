//
//  CurrentWeatherViewModel.swift
//  WeatherSky
//
//  Created by Alfin on 01/11/23.
//

import Foundation

enum WeatherViewModel {
  case current(viewModel: CurrentWeatherCollectionViewCellModel)
  case hourly(viewModel: [HourlyWeatherCollectionViewCellModel])
  case daily(viewModel: [DailyWeatherCollectionViewCellModel])
}
