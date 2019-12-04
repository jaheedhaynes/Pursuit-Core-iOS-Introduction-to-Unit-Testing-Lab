//
//  jokeDetailVC.swift
//  Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Jaheed Haynes on 12/4/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class jokeDetailVC: UIViewController {
    
    @IBOutlet weak var punchLineLabel: UILabel!
    
    var jokes: JokesData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        punchLineLabel.text = jokes?.punchline
    }
    
}
