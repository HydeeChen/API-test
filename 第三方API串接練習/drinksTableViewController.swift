//
//  drinksTableViewController.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/17.
//

import UIKit
import Kingfisher

class drinksTableViewController: UITableViewController {
    var orderNamePass:String!
    
    // 儲存從 API 取得的飲料資料
    var items = [DrinksBody.Record]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 呼叫函式以取得並顯示飲料資料
        fetchNames()
        
    }
    
    //JSON解碼的程式，把資料存在array裡面;並顯示資料在表格上。
    func fetchNames(){
        // 設定 API 的 URL
        let url = URL(string: "https://api.airtable.com/v0/app41W2DAKMjqdKlY/kebuke")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // 設定 API 請求標頭，包含驗證授權
        request.setValue("Bearer patrEo7XWMphchYMy.90deeb0c42ef0ce98c1d116f2c92b00ec4802e97d3219e4b6dd379fb6cd2471d", forHTTPHeaderField: "Authorization")
        // 發送 API 請求
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("Error API: \(String(describing: error))")
            if let data,
               let content = String(data: data, encoding: .utf8) {
                // 解碼 JSON 格式的資料
                let decoder = JSONDecoder()
                do {
                    let kebuke = try decoder.decode(DrinksBody.self, from: data)
                    // 將取得的飲料資料存入 items 陣列
                    self.items = kebuke.records
                    // 在主執行緒更新表格
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        // 開始 API 請求
        }.resume()
    }
    
    @IBSegueAction func orderNamePass(_ coder: NSCoder) -> detailViewController? {
        let controller = detailViewController(coder: coder)
        
        return controller
    }
    
     
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //數量為names的count
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(drinksTableViewCell.self)", for: indexPath) as! drinksTableViewCell

        // Configure the cell...
        
        let item = items[indexPath.row]
        
        cell.drinkName.text = item.fields.name
        cell.drinkImage.kf.setImage(with: item.fields.image.first?.url)
        
        
        return cell
    }
   
    
    @IBSegueAction func showDetail2(_ coder: NSCoder) -> detailViewController? {
        let controller = detailViewController(coder: coder)
        if let row = tableView.indexPathForSelectedRow?.row {
            controller?.item = items[row]
            controller?.orderNameLoad = orderNamePass
        }
        return controller
    }

    
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
