//
//  RegisterVC.swift
//  LoginRegister
//
//  Created by MacStudent on 2018-02-21.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPostalCode: UITextField!
    @IBOutlet weak var txtContactNumber: UITextField!
    @IBOutlet weak var dateOfBirth: UIDatePicker!
    @IBOutlet weak var txtName: UITextField!
    
    var selectedCityIndex: Int = 0
    var cityList: [String] = ["Toronto","Montreal","Windsor","Ottawa","Kitchner"]
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Register"
        
        let btnSubmit = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(displayValues))
        self.navigationItem.rightBarButtonItem = btnSubmit
    }
    
    @objc private func displayValues() {
        self.selectedCityIndex = self.cityPicker.selectedRow(inComponent: 0)
        
        let alldata: String = "\(self.txtName.text!) \n \(self.txtContactNumber.text!) \n \(self.dateOfBirth.date) \n \(self.cityList[selectedCityIndex]) \n \(self.txtPostalCode.text!) \n \(self.txtEmail.text!)"
        
        let infoAlert = UIAlertController(title: "Verify", message: alldata, preferredStyle: .alert)
        infoAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        infoAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {_ in self.displayWelcomeScreen()}))
        
        self.present(infoAlert, animated: true, completion: nil)
    }
    
    
    func displayWelcomeScreen() {
        let welcomeSB: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let welcomeVC = welcomeSB.instantiateViewController(withIdentifier: "WelcomeScreen")
        
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent components: Int) -> Int {
        return self.cityList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.cityList[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add data in picker
        self.cityPicker.delegate = self
        self.cityPicker.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
