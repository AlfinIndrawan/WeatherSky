//
//  CurrentWeatherView.swift
//  WeatherSky
//
//  Created by Alfin on 27/09/23.
//

import UIKit

final class CurrentWeatherView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .orange
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
