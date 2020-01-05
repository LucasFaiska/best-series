//
//  SerieListViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/6/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

//TODO: desacoplar datasource e o delegate

import UIKit

class SerieListViewController: UIViewController {
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
        activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private let serieListTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
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
}

extension SerieListViewController: SerieListViewLogic {
    
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
        self.series.append(contentsOf: series)
    }
}

extension SerieListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func loadMoreSeriesIfNecessary(row: Int) {
       if row == series.count - 1 {
            self.presenter?.loadSeries()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SerieListItemCell.reuseIdentifier, for: indexPath) as? SerieListItemCell else {
            return UITableViewCell()
        }
        
        cell.serie = series[indexPath.row]
        loadMoreSeriesIfNecessary(row: indexPath.row)
        cell.layoutIfNeeded()
        
        return cell
    }
}
