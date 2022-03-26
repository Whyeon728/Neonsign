//
//  SettingViewController.swift
//  Neonsign
//
//  Created by Whyeon on 2022/03/27.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellow_button: UIButton!
    @IBOutlet weak var purple_button: UIButton!
    @IBOutlet weak var green_button: UIButton!
    
    @IBOutlet weak var black_button: UIButton!
    @IBOutlet weak var blue_button: UIButton!
    @IBOutlet weak var orange_button: UIButton!
    
    weak var delegate: LEDBoardSettingDelegate?
    
    var ledText: String?
    
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }
    // 설정값 유지
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColorButton(color: self.backgroundColor)
    }
    
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == self.yellow_button {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purple_button {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else if sender == self.green_button {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
        
    }
    @IBAction func tabBackgroundColorButton(_ sender: UIButton) {
        if sender == self.black_button {
            self.changeBackgroundColorButton(color: .black)
            self.backgroundColor = .black
        } else if sender ==  self.blue_button {
            self.changeBackgroundColorButton(color: .blue)
            self.backgroundColor = .blue
        } else if sender ==  self.orange_button {
            self.changeBackgroundColorButton(color: .orange)
            self.backgroundColor = .orange
        }
    }
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor) {
        self.yellow_button.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purple_button.alpha = color == UIColor.purple ? 1 : 0.2
        self.green_button.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    private func changeBackgroundColorButton(color: UIColor) {
        self.black_button.alpha = color == UIColor.black ? 1 : 0.2
        self.blue_button.alpha = color == UIColor.blue ? 1 : 0.2
        self.orange_button.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
