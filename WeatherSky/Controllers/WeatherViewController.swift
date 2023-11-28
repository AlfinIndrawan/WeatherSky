//
//  ViewController.swift
//  WeatherSky
//
//  Created by Alfin on 26/09/23.
//

import UIKit
import OSLog

class WeatherViewController: UIViewController {
  
  let logger = Logger(subsystem: "com.alfinindrawan.WeatherSky", category: "WeatherViewController")
  
  private let primaryView = CurrentWeatherView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setupView()
    getLocation()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "crown"), style: .done, target: self, action: #selector(didTapUpgrade))
  }
  
  @objc
  private func didTapUpgrade() {
    
  }
  
  private func getLocation() {
    LocationManager.shared.getCurrentLocation { location in
      self.logger.info("\(location)")
      
      WeatherManager.shared.getWeather(for: location) { [weak self] in
        DispatchQueue.main.async {
          guard let currentWeather = WeatherManager.shared.currentWeather else { return }
          self?.primaryView.configure(with: [
            .current(viewModel: .init(model: currentWeather)),
            .hourly(viewModel: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0)
            })),
            .daily(viewModel: WeatherManager.shared.dailyWeather.compactMap({ .init(model: $0)
            }))
          ])
        }
      }
    }
  }
  
  private func setupView() {
    view.addSubview(primaryView)
    NSLayoutConstraint.activate([
      primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
  }
}
