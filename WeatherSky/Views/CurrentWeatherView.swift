//
//  CurrentWeatherView.swift
//  WeatherSky
//
//  Created by Alfin on 27/09/23.
//

import UIKit
import OSLog

final class CurrentWeatherView: UIView {
  
  let logger = Logger(subsystem: "com.alfinindrawan.WeatherSky", category: "CurrentWeatherView")
  
  
  private var collectionView: UICollectionView?
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    createCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  public func reload() {
    // reload data
    
  }
  
  private func layout(for sectionIndex: Int) -> NSCollectionLayoutSection {
    let section = CurrentWeatherSection.allCases[sectionIndex]
    
    switch section {
    case .current:
      let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.75)))
      
      let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
      
      return NSCollectionLayoutSection(group: group)
      
    case .hourly:
      let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.75)))
      
      let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
      
      return NSCollectionLayoutSection(group: group)
      
    case .daily:
      let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.75)))
      
      let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.75)), subitems: [item])
      
      return NSCollectionLayoutSection(group: group)
    }
  }
  
  private func createCollectionView() {
    let layout = UICollectionViewCompositionalLayout{ sectionIndex, _ in
      return self.layout(for: sectionIndex)
    }
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    collectionView.dataSource = self
    collectionView.register(CurrentWeatherCollectionViewCell.self, forCellWithReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier)
    
    collectionView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier)
    
    collectionView.register(DailyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier)
    
    addSubview(collectionView)
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leftAnchor.constraint(equalTo: leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
     ])
    self.collectionView = collectionView
  }
}

extension CurrentWeatherView: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == 0 {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? CurrentWeatherCollectionViewCell else {
        self.logger.error("\(String(describing: "Error to deque cell"))")
        fatalError()
      }
          return cell
    } else if indexPath.section == 1 {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DailyWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? DailyWeatherCollectionViewCell else {
        self.logger.error("\(String(describing: "Error to deque cell"))")
        fatalError()
      }
          return cell
    } else {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.cellIdentifier, for: indexPath) as? HourlyWeatherCollectionViewCell else {
        self.logger.error("\(String(describing: "Error to deque cell"))")
        fatalError()
      }
          return cell
    }
  }
}
