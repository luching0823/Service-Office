//
//  TableViewController.swift
//  office
//
//  Created by 廖昱晴 on 2020/7/23.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController ,UISearchResultsUpdating {
    let appleProduct = ["Apple TV", "Apple Watch", "iMac", "iPhone", "Macbook Pro", "iPad", "iPod", "Air Pod"]
    var serviceoffice:[ServiceOffice] = [
        ServiceOffice(name: "經紀部", address: "台北市南港區經貿二路168號3樓", phone: "02-66392000"),ServiceOffice(name: "忠孝分公司", address: "台北市中正區忠孝西路一段6號4樓", phone: "02-23141122"),ServiceOffice(name: "松江分公司", address: "台北市中山區松江路220號3樓之一", phone: "02-25815688"),ServiceOffice(name: "三重分公司", address: "新北市三重區重陽路一段66號2樓", phone: "02-89822558"),ServiceOffice(name: "中壢分公司", address: "桃園市中壢區中山路118號3樓", phone: "03-4229666"),ServiceOffice(name: "新竹分公司", address: "新竹市東區民族路139號2樓", phone: "03-5153100"),ServiceOffice(name: "文心分公司", address: "台中市北屯區文心路四段875號3樓", phone: "04-22468800"),ServiceOffice(name: "嘉義分公司", address: "嘉義市西區中山路386號6樓", phone: "05-2286699"),ServiceOffice(name: "永康分公司", address: "台南市永康區中華路425號2樓", phone: "06-2338233"),ServiceOffice(name: "高雄分公司", address: "高雄市前金區中正四路168號6樓之一", phone: "07-2151166")
    ]
    let searchResultController = UITableViewController()
    var searchController:UISearchController?
    var resultsArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        searchController = UISearchController(searchResultsController: searchResultController)
        tableView.tableHeaderView = searchController?.searchBar
        searchController?.searchResultsUpdater = self
        searchResultController.tableView.dataSource = self
        searchResultController.tableView.delegate = self
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let searchWord = searchController.searchBar.text{
            resultsArray = appleProduct.filter({
                (thisProduct) -> Bool in
                if thisProduct.contains(searchWord){
                return true
                }else{
                return false
                }
            })
           self.searchResultController.tableView.reloadData()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tableView{
        return appleProduct.count
        }else{
        return resultsArray.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.nameLabel.text = appleProduct[indexPath.row]
            return cell
        }else{
        let cell = UITableViewCell()
            cell.textLabel?.text = resultsArray[indexPath.row]
            return cell
        }
    }
}
