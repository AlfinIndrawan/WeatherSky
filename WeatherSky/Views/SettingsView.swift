//
//  SettingsView.swift
//  WeatherSky
//
//  Created by Alfin on 27/09/23.
//

import UIKit

class SettingsView: UIView {
  
  private var viewModel: SettingsViewViewModel? {
    didSet {
      tableView.reloadData()
    }
  }
  
  private let tableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "settingCell")
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(tableView)
    tableView.dataSource = self
    tableView.delegate = self
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: topAnchor),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: leftAnchor),
      tableView.rightAnchor.constraint(equalTo: rightAnchor),
    ])
  }
  
  public func configure(with viewModel: SettingsViewViewModel) {
    self.viewModel = viewModel
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
}

extension SettingsView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.options.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
    if let viewModel {
      cell.textLabel?.text = viewModel.options[indexPath.row].title
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
