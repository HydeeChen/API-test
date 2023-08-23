//
//  detailViewController.swift
//  第三方API串接練習
//
//  Created by Hydee Chen on 2023/8/18.
//

import UIKit
import Kingfisher

class detailViewController: UIViewController {
    var item: DrinksBody.Record?
    var uploadItem: APIResponse.Record.Fields?
    var orderNameLoad: String?
    
    
    
    //飲料資訊顯示串
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var MpriceLabel: UILabel!
    @IBOutlet weak var LpriceLabel: UILabel!
    
    //飲料資料串
    @IBOutlet weak var sizeSelect: UISegmentedControl!
    @IBOutlet weak var temperatureSelect: UISegmentedControl!
    @IBOutlet weak var iceSelect: UISegmentedControl!
    @IBOutlet weak var sugarSelect: UISegmentedControl!
    @IBOutlet weak var addSelect: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //資料顯示設定
        nameLabel.text = item?.fields.name
        contentLabel.text = item?.fields.content
        imageView.kf.setImage(with: item?.fields.image.first?.url)
        if let mPrice = item?.fields.mPrice {
            MpriceLabel.text = "\(mPrice)元"
        } else {
            MpriceLabel.text = "--"
        }
        //因為大杯價格並不是每個品項都有，在這裡寫了if判斷式;
        if let lPrice = item?.fields.lPrice {
            LpriceLabel.text = "\(lPrice)元"
        } else {
            LpriceLabel.text = "--"
        }
        // Do any additional setup after loading the view.
    }
    
    //設定送出的action為上傳資料
    @IBAction func upLoadData(_ sender: Any) {
        let url = URL(string: "https://api.airtable.com/v0/appQsJ6iAJq3CaPCQ/order")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Bearer patxlPE80KDVKhgMz.71205be764322888e0dd534c33d8dd489be78efda1e06eb47a687cb3df8d82e5", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
            let uploadItem = APIResponse.Record.Fields(
                orderName: orderNameLoad ?? "",
                drinkName: nameLabel.text ?? "",
                size: sizeSelect.titleForSegment(at: sizeSelect.selectedSegmentIndex) ?? "",
                temperature: temperatureSelect.titleForSegment(at: temperatureSelect.selectedSegmentIndex) ?? "",
                ice: iceSelect.titleForSegment(at: iceSelect.selectedSegmentIndex) ?? "",
                sugar: sugarSelect.titleForSegment(at: sugarSelect.selectedSegmentIndex) ?? "",
                add: addSelect.titleForSegment(at: addSelect.selectedSegmentIndex) ?? "")
            
            let apiresponse = APIResponse.Record(fields: uploadItem)
            
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(apiresponse)
                request.httpBody = data
                
                URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error API: \(error)")
                        return
                    }

                    if let data = data {
                        if let responseString = String(data: data, encoding: .utf8) {
                            print("API Response: \(responseString)")
                        }
                    }
                }.resume()
            } catch {
                print("Error encoding order data: \(error)")
            }
        }
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

