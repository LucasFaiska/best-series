//
//  SerieListViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/6/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit

class SerieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SerieListViewLogic {
    var presenter: SerieListPresentationLogic?
    
    var series: [Serie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.serieListTableView.reloadData()
            }
        }
    }
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicatorView: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            activityIndicatorView = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private let serieListTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.register(SerieListItemCell.self, forCellReuseIdentifier: SerieListItemCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        serieListTableView.delegate = self
        serieListTableView.dataSource = self
        presenter?.loadSeries()
    }
    
    private func configView() {
        setBarTitle()
        configColors()
        addSerieListTable()
    }
    
    private func setBarTitle() {
        self.title = "Best Series"
    }
    
    private func addActivityIndicator() {
        self.view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
    private func configColors() {
        self.view.backgroundColor = .white
    }
    
    private func addSerieListTable() {
           self.view.addSubview(serieListTableView)
           NSLayoutConstraint.activate([
               serieListTableView.topAnchor.constraint(equalTo: view.topAnchor),
               serieListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               serieListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
               serieListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
               ])
       }
    
    func showLoading() {
        DispatchQueue.main.async {
            self.serieListTableView.isHidden = true
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.serieListTableView.isHidden = false
        }
    }
    
    func present(series: [Serie]) {
        self.series = series
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SerieListItemCell.reuseIdentifier, for: indexPath) as? SerieListItemCell else {
            return UITableViewCell()
        }
        
        cell.serie = series[indexPath.row]
        
        return cell
    }
}
