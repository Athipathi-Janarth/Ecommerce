//
//  CompanyViewController.swift
//  ECommerce
//
//  Created by AthiPathi on 3/16/23.
//

import UIKit

class CompanyViewController: UIViewController, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print( eCommerce.companyList.getCompanyList().count)
        return eCommerce.companyList.getCompanyList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell
//        var companies=eCommerce.companyList.getCompanyList()
//        let company = companies[indexPath.row]
//        cell.Name?.text = "\(indexPath.row)"
//        print(cell.Name?.text)
        return cell
    }
    

    override func viewDidLoad() {
        
         eCommerce.companyList.addCompany(company: Company(name: "Sony", address: "Chennai", country: "India", zip: 600028, companyType: ""))
         eCommerce.companyList.addCompany(company: Company(name: "Apple", address: "Los Angeles", country: "United States", zip: 21150, companyType: "You Know"))
         eCommerce.companyList.addCompany(company: Company(name: "Zudio", address: "Chennai", country: "India", zip: 600028, companyType: ""))

        super.viewDidLoad()
        displayTable()
        //tableView.register(TableViewCell.self, forCellReuseIdentifier: "MyCell")
        //tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayTable()
    }
    
    func alert(_msg:String){
        let dialogMessage = UIAlertController(title: "Alert", message: _msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var companyCountry: UITextField!
    @IBOutlet weak var companyZip: UITextField!
    @IBOutlet weak var companyType: UITextField!
    
    @IBOutlet weak var companyAddress: UITextField!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func createCompany(_ sender: UIButton) {
        let companyname = companyName.text ?? ""
        let companyaddress = companyAddress.text ?? ""
        let companycountry = companyCountry.text ?? ""
        let companyzip = companyZip.text ?? ""
        let companytype = companyType.text ?? ""
        if companyname.isEmpty  {
           alert(_msg: "Please enter a Company Name")
           }
        if companyaddress.isEmpty  {
            alert(_msg: "Please enter a Company Address")
           }
        if companycountry.isEmpty  {
            alert(_msg: "Please enter a Company Country")
           }
        if companyzip.isEmpty  {
            alert(_msg: "Please enter a Company Zip Code")
           }
            guard let zipCode = Int(companyzip) else {
                alert(_msg: "ZipCode Need to be a number")
                return
        }
        var company = Company(name: companyname, address: companyaddress, country: companycountry, zip: zipCode, companyType: companytype)
        eCommerce.companyList.addCompany(company: company)
        alert(_msg: "Company Added Successfully")
        companyName.text=""
        companyAddress.text = ""
        companyCountry.text = ""
        companyZip.text = ""
        companyType.text = ""
        tableView.reloadData()
        displayTable()
    }
    func removeSubviews() {
        guard let stackView = stackView else {
               return
           }
           
           for subview in stackView.subviews {
               stackView.removeArrangedSubview(subview)
               subview.removeFromSuperview()
           }
        }
    func displayTable(){
        removeSubviews()
        for company in  eCommerce.companyList.getCompanyList(){
            let label = UILabel()
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewCompany(_:)))
            label.isUserInteractionEnabled = true
            label.tag=company.id
            label.addGestureRecognizer(tapGestureRecognizer)
            label.text = "\(company.id)     \(company.name)      \(company.country)"
            stackView.addArrangedSubview(label)
            }
    }
    @objc func viewCompany(_ sender: UITapGestureRecognizer){
        guard let tag = sender.view?.tag else {
                return
            }
            
        guard let company = eCommerce.companyList.getCompanyList().first(where: { $0.id == tag }) else{
            alert(_msg: "Select a Valid Item")
            return
        }
        var manageCompany = ManageCompanyViewController(nibName: "ManageCompanyView", bundle:nil) ;
        manageCompany.company=company
        manageCompany.modalPresentationStyle = .fullScreen
        self.present(manageCompany, animated: true)
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
