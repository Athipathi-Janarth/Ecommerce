//
//  ManagePostViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/17/23.
//

import UIKit

class ManagePostViewController: UIViewController {
    var post:Product_Post?

    @IBOutlet weak var postID: UILabel!
    @IBOutlet weak var productID: UITextField!
    @IBOutlet weak var productTypeID: UITextField!
    @IBOutlet weak var companyID: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var postedDate: UITextField!
    @IBOutlet weak var postDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let id=post?.id
        postID.text="Post ID    \(id?.description ?? "Nil")"
        // Do any additional setup after loading the view.
    }
    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func alert(_msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: _msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    @IBAction func onPostUpdate(_ sender: UIButton) {
    }
    @IBAction func onPostDelete(_ sender: UIButton) {
    }
    @IBAction func onCreateOrder(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
