//
//  ServiceOfficeTableViewController.swift
//  Service Office
//
//  Created by 廖昱晴 on 2020/7/21.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit

class ServiceOfficeTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
 
    
    @IBOutlet weak var tableView: UITableView!
    
    var serviceoffice:[ServiceOffice] = [
        ServiceOffice(name: "經紀部", address: "台北市南港區經貿二路168號3樓", phone: "02-66392000"),ServiceOffice(name: "忠孝分公司", address: "台北市中正區忠孝西路一段6號4樓", phone: "02-23141122"),ServiceOffice(name: "松江分公司", address: "台北市中山區松江路220號3樓之一", phone: "02-25815688"),ServiceOffice(name: "三重分公司", address: "新北市三重區重陽路一段66號2樓", phone: "02-89822558"),ServiceOffice(name: "中壢分公司", address: "桃園市中壢區中山路118號3樓", phone: "03-4229666"),ServiceOffice(name: "新竹分公司", address: "新竹市東區民族路139號2樓", phone: "03-5153100"),ServiceOffice(name: "文心分公司", address: "台中市北屯區文心路四段875號3樓", phone: "04-22468800"),ServiceOffice(name: "嘉義分公司", address: "嘉義市西區中山路386號6樓", phone: "05-2286699"),ServiceOffice(name: "永康分公司", address: "台南市永康區中華路425號2樓", phone: "06-2338233"),ServiceOffice(name: "高雄分公司", address: "高雄市前金區中正四路168號6樓之一", phone: "07-2151166")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.searchResultsUpdater = self
        searchResultController.tableView.dataSource = self
        searchResultController.tableView.delegate = self
        //搜尋列在表頭
        tableView.tableHeaderView = searchController?.searchBar

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //檢查搜尋控制器是否啟動
        let serviceOffice = (searchController!.isActive) ? searchResults[indexPath.row] : serviceoffice[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier:  "Cell2", for: indexPath) as! ServiceOfficeTableViewCell2
            cell.nameLabel.text = serviceOffice.name
            cell.addressLabel.text = serviceOffice.address
            cell.phoneLabel.text = serviceOffice.phone
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:  "Cell", for: indexPath) as! ServiceOfficeTableViewCell
            cell.nameLabel.text = serviceOffice.name
            cell.addressLabel.text = serviceOffice.address
            cell.phoneLabel.text = serviceOffice.phone
            
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController!.isActive {
            return searchResults.count
        }
        return serviceoffice.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //建立選單
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //取消動作
        let cancelAction = UIAlertAction(title: "關閉", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //加入撥打電話動作
        let callAction = UIAlertAction(title: "撥打電話", style: .default, handler: nil)
        optionMenu.addAction(callAction)
        
        //加入前往地圖動作
        let mapAction = UIAlertAction(title: "前往地圖", style: .default, handler: nil)
        optionMenu.addAction(mapAction)
        
        //呈現選單
        present(optionMenu, animated: true, completion: nil)
        
        //取消選取
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //加搜尋列
    
    let searchResultController = UITableViewController()
    var searchController:UISearchController?
    var searchResults: [ServiceOffice] = []
    
    //過濾搜尋內容
    func filterContent(for searchText: String) {
        searchResults = serviceoffice.filter({(serviceoffice) -> Bool in
            let isMach = serviceoffice.name.localizedCaseInsensitiveContains(searchText)
                || serviceoffice.address.localizedCaseInsensitiveContains(searchText)
                || serviceoffice.phone.localizedCaseInsensitiveContains(searchText)
            return isMach
        })

    }
    
    //更新搜尋結果
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData()
    }

//    func updateSearchResults(for searchController: UISearchController) {
//        // 取得搜尋文字
//
//        guard let searchText = searchController.searchBar.text else {
//            return
//        }
//    }
}

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
