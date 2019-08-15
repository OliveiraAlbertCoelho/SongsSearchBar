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
    
    var love = Song.loveSongs
    override func viewDidLoad() {
        super.viewDidLoad()
        cellForLove.delegate = self
        cellForLove.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return love.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let loveSongs = love[indexPath.row]
        cell.textLabel?.text = loveSongs.name
        cell.detailTextLabel?.text = loveSongs.artist
        
        return cell
    }
  
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

