//
//  DailyCollectionViewCell.swift
//  WeatherSky
//
//  Created by Alfin on 01/10/23.
//

import UIKit

class DailyWeatherCollectionViewCell: UICollectionViewCell {
  
  static let cellIdentifier = "DailyWeatherCollectionViewCell"
  
  private let tempLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.textColor = UIColor(named: "LabelColor")
    label.font = .systemFont(ofSize: 18, weight: .regular)
    return label
  }()
  
  private let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.textColor = UIColor(named: "LabelColor")
    label.font = .systemFont(ofSize: 15, weight: .regular)
    return label
  }()
  
  private let icon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .tertiarySystemBackground
    contentView.layer.cornerRadius = 8
    contentView.layer.borderWidth = 1
    contentView.layer.borderColor = UIColor.secondaryLabel.cgColor
    contentView.addSubview(timeLabel)
    contentView.addSubview(icon)
    contentView.addSubview(tempLabel)
    addConstraints()
  }
  
  private func addConstraints() {
    NSLayoutConstraint.activate([
      timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      timeLabel.heightAnchor.constraint(equalToConstant: 40),
      
      icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      icon.leftAnchor.constraint(equalTo: timeLabel.rightAnchor, constant: 10),
      icon.heightAnchor.constraint(equalToConstant: 32),
      
      tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      tempLabel.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20),
      tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  public func configure(with viewModel: DailyWeatherCollectionViewCellModel) {
    icon.image = UIImage(systemName: viewModel.iconName)
    tempLabel.text = viewModel.temperature
    timeLabel.text = viewModel.day
  }
}
