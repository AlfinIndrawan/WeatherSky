//
//  HourlyCollectionViewCell.swift
//  WeatherSky
//
//  Created by Alfin on 01/10/23.
//

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
  
  static let cellIdentifier = "HourlyWeatherCollectionViewCell"
  
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
    contentView.backgroundColor = .secondarySystemBackground
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
      timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      timeLabel.heightAnchor.constraint(equalToConstant: 40),
      timeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      
      icon.topAnchor.constraint(equalTo: timeLabel.bottomAnchor),
      icon.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      icon.heightAnchor.constraint(equalToConstant: 32),
      icon.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      
      tempLabel.topAnchor.constraint(equalTo: icon.bottomAnchor),
      tempLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      tempLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    tempLabel.text = nil
    timeLabel.text = nil
    icon.image = nil
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  public func configure(with viewModel: HourlyWeatherCollectionViewCellModel) {
    icon.image = UIImage(systemName: viewModel.iconName)
    tempLabel.text = viewModel.temperature
    timeLabel.text = viewModel.hour
  }
  

}
