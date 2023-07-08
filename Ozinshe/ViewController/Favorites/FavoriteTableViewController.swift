//
//  FavoriteTableViewController.swift
//  Ozinshe
//
//  Created by Nazerke Sembay on 30.06.2023.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class FavoriteTableViewController: UITableViewController {
    @IBOutlet var tableview: UITableView!
    
    var favorites: [Movie] = []
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView.addSubview(refreshControl!)
        downloadFavorites()
    }
    
    @objc func handleRefresh() {
        isLoading = true
        favorites.removeAll()
        tableView.reloadData()
        downloadFavorites()
        
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
    
    func downloadFavorites() {
        SVProgressHUD.show()
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \((Storage.sharedInstance.accessToken))"
        ]
        
        AF.request(Urls.FAVORITE_URL, method: .get, headers: headers).responseData {
            response in
            SVProgressHUD.dismiss()
            var resultString = ""
            if let data = response.data {
                resultString = String(data: data, encoding: .utf8)!
                print(resultString)
            }
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print("JSON: \(json)")
                
                if let array = json.array {
                    for item in array {
                        let movie = Movie(json: item)
                        self.favorites.append(movie)
                    }
                    self.tableView.reloadData()
                } else {
                    SVProgressHUD.showError(withStatus: "CONNECTION_ERROR".localized())
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteTableViewCell
        cell.setData(movie: favorites[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153
    }
    
}

