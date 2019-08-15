//
//  DetailedViewController.swift
//  SongsTableViewSearchBar
//
//  Created by albert coelho oliveira on 8/15/19.
//  Copyright © 2019 C4Q . All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDesign()
    }
    var loveSong: Song!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var songImage: UIImageView!
  
    private func setUpDesign() {
        songName.text = loveSong.name
        artistName.text = loveSong.artist
        
    }
}
