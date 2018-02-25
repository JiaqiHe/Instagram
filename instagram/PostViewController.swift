//
//  PostViewController.swift
//  instagram
//
//  Created by Jiaqi He on 2/24/18.
//  Copyright © 2018 Jiaqi He. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var posts: [PFObject] = []
    
    @IBOutlet weak var postTableView: UITableView!

    
    
    @IBAction func OnUpload(_ sender: Any) {
        self.performSegue(withIdentifier: "upload", sender: nil)
    }
    
    @IBAction func OnLogout(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.dataSource = self
        postTableView.delegate = self
        // Do any additional setup after loading the view.
        fetchData()
        
    }

    func fetchData() {
        // construct PFQuery
        let query = Post.query() as! PFQuery
        query.order(byDescending: "createdAt")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                self.posts = posts
            } else {
                if error != nil {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let post = posts[indexPath.row] as PFObject!
        cell.captionField.text = post!["caption"] as! String
//        if let user = message["user"] as? PFUser {
//            cell.usernameField.text = user.username
//        } else {
//            cell.usernameField.text = "Anonymous"
//        }
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
