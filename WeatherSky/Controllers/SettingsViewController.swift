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
  
  private let primaryView = SettingsView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(primaryView)
    NSLayoutConstraint.activate([
      primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
      primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
  }
  
}
