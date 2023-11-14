//
//  DailyCollectionViewCell.swift
//  WeatherSky
//
//  Created by Alfin on 01/10/23.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
  
  static let cellIdentifier = "DailyWeatherCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .purple
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  public func configure(with viewModel: DailyWeatherCollectionViewCellModel) {
    
  }
}
