//
//  starWarsViewController.swift
//  Pursuit-Core-iOS-Introduction-to-Unit-Testing-Lab
//
//  Created by Jaheed Haynes on 12/4/19.
//  Copyright © 2019 Jaheed Haynes. All rights reserved.
//

import UIKit

class starWarsViewController: UIViewController {
    @IBOutlet weak var starWarsFilmsTableView: UITableView!
    
    var swFilms = [StarWarsFilms]()   {
        didSet  {
            starWarsFilmsTableView.reloadData()
        }
    }
    
//--------------------------------------------------------------------------------------

    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsFilmsTableView.dataSource = self
        loadData()
    }
    
//--------------------------------------------------------------------------------------
    
    func loadData() {
        swFilms = StarWarsFilmsData.getFilms()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let starWarsDetailVC = segue.destination as? starWarsDetailVC, let indexPath = starWarsFilmsTableView.indexPathForSelectedRow
            else    {
                fatalError()
        }
        
        let swFilm = swFilms[indexPath.row]
        starWarsDetailVC.swFilms = swFilm
    }
    
}

//--------------------------------------------------------------------------------------

extension starWarsViewController: UITableViewDataSource   {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        swFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let swCell = starWarsFilmsTableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        
        let swFilm = swFilms[indexPath.row]
        
        swCell.textLabel?.text = swFilm.title
        
        return swCell
    }
}
