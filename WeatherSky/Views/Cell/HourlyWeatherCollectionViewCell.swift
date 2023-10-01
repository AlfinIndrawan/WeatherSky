//
//  HourlyCollectionViewCell.swift
//  WeatherSky
//
//  Created by Alfin on 01/10/23.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
  
  static let cellIdentifier = "HourlyWeatherCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .yellow
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}
