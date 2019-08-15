//
//  ViewController.swift
//  SongsTableViewSearchBar
//
//  Created by C4Q  on 11/6/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var cellForLove: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var love = Song.loveSongs
    var selectedSong: [Song]{
        get {
            guard let searchString = searchString else {
                return love
            }
            guard searchString != ""  else {
                return love
            }
            if let scopeTitles = searchBar.scopeButtonTitles {
                let currentScopeIndex = searchBar.selectedScopeButtonIndex
                switch scopeTitles[currentScopeIndex] {
                case "Artist":
                    return love.filter{$0.artist.lowercased().contains(searchString.lowercased())}
                case "Song":
                    return love.filter{$0.name.lowercased().contains(searchString.lowercased())}
                default:
                    return love
                }
            }
            return love
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        cellForLove.delegate = self
        cellForLove.dataSource = self
        searchBar.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedSong.count
    }
    
    var searchString: String? = nil {
        didSet {
            self.cellForLove.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let loveSongs = love[indexPath.row]
        cell.textLabel?.text = loveSongs.name
        cell.detailTextLabel?.text = loveSongs.artist
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
        switch segueIdentifier {
        case "toDesign":
            guard let music = segue.destination as? DetailedViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = cellForLove.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            
            let song = love[selectedIndexPath.row]
            music.loveSong = song
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
}
