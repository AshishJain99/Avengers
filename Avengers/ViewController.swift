//
//  ViewController.swift
//  Avengers
//
//  Created by Ash on 03/02/23.
//

import UIKit

class ViewController: UIViewController,DataDelegate {
    
    let data = DataProcessing()
    var tableDataArray = [jsonStruct]()

    

    @IBOutlet weak var tableView: UITableView!
    var arrData = [jsonStruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
         getData()
    }
//Sendind Url to Data Processing class
    func getData(){
        data.delegate = self
        data.setData(url:"https://simplifiedcoding.net/demos/marvel/")
    }

// Receving data using protocol
    func didReceiveData(data: [jsonStruct]) {
            self.tableDataArray = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = tableDataArray[indexPath.row].name ?? "No Name"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailedViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailedView") as! DetailedViewController
        
        detail.detailedNameStr = "Name: \(tableDataArray[indexPath.row].name ?? "na")"
        detail.detailedRealNameStr = "Real name: \(tableDataArray[indexPath.row].realname ?? "na")"
        detail.detailedTeamStr = "Team: \(tableDataArray[indexPath.row].team ?? "na")"
        detail.detailedFirstAppearStr = "First Appear: \(tableDataArray[indexPath.row].firstappearance ?? "na")"
        detail.detailedCreatedStr = "Created By: \(tableDataArray[indexPath.row].createdby ?? "na")"
        detail.detailedPublisherStr = "Publisher: \(tableDataArray[indexPath.row].publisher ?? "na")"
        detail.detailedBioStr = "Bio: \(tableDataArray[indexPath.row].bio ?? "na")"
        detail.detailedImageImg = tableDataArray[indexPath.row].imageurl ?? "na"
        
        self.present(detail, animated: true)
    }
}
