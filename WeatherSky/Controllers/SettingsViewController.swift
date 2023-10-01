//
//  SettingsViewController.swift
//  WeatherSky
//
//  Created by Alfin on 26/09/23.
//

import UIKit
import OSLog

class SettingsViewController: UIViewController {
  
  let logger = Logger(subsystem: "com.alfinindrawan.WeatherSky", category: "SettingsViewController")
  
  private let primaryView: SettingsView = {
    let view = SettingsView()
    let viewModel = SettingsViewViewModel(options: SettingOption.allCases)
    view.configure(with: viewModel)
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    primaryView.delegate = self
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemBackground

    view.addSubview(primaryView)
    NSLayoutConstraint.activate([
      primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
  }
  
}

extension SettingsViewController: SettingsViewDelegate {
  func settingsView(_ settingsView: SettingsView, didTap option: SettingOption) {
    self.logger.info("\(String(describing: "Handling"))")
    switch option {
    case .upgrade:
      break
    case .privacyPolicy:
      break
    case .terms:
      break
    case .contact:
      break
    case .getHelp:
      break
    case .rateApp:
      break
    }
  }
}
