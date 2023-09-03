//
//  ConvertionVC.swift
//  Convertion App
//
//  Created by Hammad Baig on 31/05/2019.
//

import UIKit
enum ConvertionType {
    case mileToKilogram
    case poundToKilogram
}

class ConvertionVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mileTextField: UITextField!
    @IBOutlet weak var mileResultLabel: UILabel!
    @IBOutlet weak var mileConvertionButton: UIButton!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var poundResult: UILabel!
    @IBOutlet weak var poundConvertionButoon: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addGesture()
    }
    
    private func setupViews(){
        self.navigationController?.navigationBar.isHidden = true
        mileTextField.delegate = self
        poundTextField.delegate = self
        mileTextField.layer.cornerRadius = 10
        poundTextField.layer.cornerRadius = 10
        mileConvertionButton.layer.cornerRadius = 10
        poundConvertionButoon.layer.cornerRadius = 10
        mileResultLabel.isHidden = true
        poundResult.isHidden = true
        
    }
    
    private func addGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard) )
        tapGesture.cancelsTouchesInView = true
        view.addGestureRecognizer(tapGesture)
    }
    
    private func updateUiOnConvertion(type: ConvertionType){
        switch type {
        case .mileToKilogram:
            mileResultLabel.isHidden = false
            mileTextField.endEditing(true)
        case .poundToKilogram:
            poundResult.isHidden = false
            poundTextField.endEditing(true)
        }
       
    }
}

//MARK: - Conversion
extension ConvertionVC {
    
    func mileToKiloGram(mile: Float){
        let kilogram = (Float(mile) * (1.609344))
        mileResultLabel.text =  String(kilogram)
        self.updateUiOnConvertion(type: .mileToKilogram)
    }
    
    func poundToKilogram(pound: Float){
        let kiloGram = (Float(pound) * (0.45359237))
        poundResult.text =  String(kiloGram)
        self.updateUiOnConvertion(type: .poundToKilogram)
    }
    
}
//MARK: - IBAction
extension ConvertionVC {
    @objc func hideKeyboard(){
        mileTextField.endEditing(true)
        poundTextField.endEditing(true)
    }

    @IBAction func MileConvertion(_ sender: Any) {
        guard let mile = Float(self.mileTextField.text ?? "")else {
            mileTextField.endEditing(true)
            return
        }
        self.mileToKiloGram(mile: mile)
    }
    
    @IBAction func PoundsConvertion(_ sender: Any) {
        guard let pound = Float(poundTextField.text ?? "") else {
            poundTextField.endEditing(true)
            return
        }
        self.poundToKilogram(pound: pound)
    }
}
