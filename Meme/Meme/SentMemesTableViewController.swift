//
//  SentMemesTableViewController.swift
//  Meme
//
//  Created by نهى on 30/02/1440 AH.
//  Copyright © 1440 Udacity. All rights reserved.
//

import UIKit

// MARK: - SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate

class SentMemesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    
    var memes: [Meme]!
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView:UITableView!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        tableView.reloadData()
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell") as! MemeTableViewCell
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        cell.memedImageCell?.image = meme.memedImage
        cell.topTextCell?.text = meme.topText
        cell.bottomTextCell?.text = meme.bottomText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let memeDetailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(memeDetailController, animated: true)
    }
    
}
