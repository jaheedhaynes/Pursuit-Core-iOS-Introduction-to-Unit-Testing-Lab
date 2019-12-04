//
//  ViewController.swift
//  Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Jaheed Haynes on 12/3/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class jokesViewController: UIViewController {
    
    @IBOutlet weak var jokeTableView: UITableView!
    
    var jokes = [JokesData]()    {
        didSet  {
            jokeTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        jokeTableView.dataSource = self
    }
    
    func loadData() {
        jokes = JokesData.getJokes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokeDetail = segue.destination as? jokeDetailVC,
            let indexPath = jokeTableView.indexPathForSelectedRow
            
            else    {
                fatalError()
        }
        
        let joke = jokes[indexPath.row]
        jokeDetail.jokes = joke
    }
    
}

extension jokesViewController: UITableViewDataSource    {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jokeCell = jokeTableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        
        jokeCell.textLabel?.text = joke.setup
        
        return jokeCell
        
    }
}
