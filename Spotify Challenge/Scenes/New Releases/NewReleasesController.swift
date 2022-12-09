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
        tableView.backgroundColor = .background
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var dataSource = [NewReleaseSections]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    private let viewModel = NewReleasesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        navigationController?.navigationBar.barTintColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewReleaseCell.self, forCellReuseIdentifier: "ReleaseCell")
        tableView.register(LoadingCell.self, forCellReuseIdentifier: "LoadingCell")
        tableView.register(NewReleaseEmptyCell.self, forCellReuseIdentifier: "EmptyCell")
        view.addSubview(tableView)
        
        tableView.fullToSuperView()
        
        viewModel.fetchNewReleases { [weak self] sections in
            self?.dataSource = sections
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.tintColor = .blue
    }
}

extension NewReleasesController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .releases(let albums):
            return albums.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = dataSource[indexPath.section]
        switch sections {
        case .releases(let albums):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseCell", for: indexPath) as! NewReleaseCell
            let album = albums[indexPath.row]
            cell.setup(album: album)
            return cell
        case .empty:
            return tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as! NewReleaseEmptyCell
        case .loading:
            return tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard dataSource.count > 1 else { return }
        
        if cell.isKind(of: LoadingCell.self) {
            viewModel.fetchNewReleases { [weak self] sections in
                self?.dataSource = sections
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = dataSource[indexPath.section]
        
        if case .releases(let albums) = sections {
            let album = albums[indexPath.row]
            guard let artist = album.artists.first else { return }
            let viewModel = ArtistViewModel(artist: artist)
            let viewController = ArtistController(viewModel: viewModel)
            self.present(viewController, animated: true)
        }
    }
}
