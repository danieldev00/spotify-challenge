//
//  NewReleasesController.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 7/12/22.
//

import UIKit

class NewReleasesController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 96.0
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let requestManager = RequestManager()
    private var newReleases: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewReleaseCell.self, forCellReuseIdentifier: "ReleaseCell")
        view.addSubview(tableView)
        
        tableView.fullToSuperView()
        
        fetchNewReleases()
    }
    
    private func fetchNewReleases() {
        do {
            try requestManager.perform(API.newReleases) { [weak self] (result: Result<ReleaseContainer, Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let container):
                    self.newReleases = container.albums.items
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                    break
                case .failure(let err):
                    print("Error", err)
                }
            }
        } catch {}
    }
}

extension NewReleasesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newReleases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseCell", for: indexPath) as! NewReleaseCell
        
        let album = newReleases[indexPath.row]
        cell.setup(album: album)
        
        return cell
    }
}
