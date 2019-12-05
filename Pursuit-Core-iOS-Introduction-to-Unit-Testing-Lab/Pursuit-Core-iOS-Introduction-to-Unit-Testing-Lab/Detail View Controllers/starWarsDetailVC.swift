//
//  starWarsDetailVC.swift
//  Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Jaheed Haynes on 12/4/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class starWarsDetailVC: UIViewController {
    @IBOutlet weak var swOpeningCrawlTextView: UITextView!
    
    var swFilms: StarWarsFilms?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
//--------------------------------------------------------------------------------------

    func updateUI() {
        guard let swFilm = swFilms
            else    {
                fatalError("you broke the app ☠️")
        }
        swOpeningCrawlTextView.text = swFilm.openingCrawl
        
    }
}
