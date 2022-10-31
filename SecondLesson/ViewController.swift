//
//  ViewController.swift
//  SecondLesson
//
//  Created by Aleksandr on 10/28/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBOutlet weak var mixedColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.addDoneButtonOnKeyboard()
        greenTextField.addDoneButtonOnKeyboard()
        blueTextField.addDoneButtonOnKeyboard()
        changeBackgroundColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func redTextValue() {
        insertTextFieldValue(redSlider, redSliderLabel, redTextField)
        changeBackgroundColor()
    }
    
    @IBAction func greenTextValue() {
        insertTextFieldValue(greenSlider, greenSliderLabel, greenTextField)
        changeBackgroundColor()
    }
    
    @IBAction func blueTextValue() {
        insertTextFieldValue(blueSlider, blueSliderLabel, blueTextField)
        changeBackgroundColor()
    }
    
    @IBAction func redSliderAction() {
        sliderAction(redSlider, redSliderLabel, redTextField)
        changeBackgroundColor()
    }
    
    @IBAction func greenSliderAction() {
        sliderAction(greenSlider, greenSliderLabel, greenTextField)
        changeBackgroundColor()
    }
    
    @IBAction func blueSliderAction() {
        sliderAction(blueSlider, blueSliderLabel, blueTextField)
        changeBackgroundColor()
    }
    
    private func changeBackgroundColor() {
        mixedColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func insertTextFieldValue(_ slider: UISlider,
                                      _ label: UILabel,
                                      _ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let value = Float(text) else { return }
        slider.value = value
        label.text = String(format: "%.2f", slider.value)
    }
    
    private func sliderAction(_ slider: UISlider,
                              _ label: UILabel,
                              _ textField: UITextField) {
        label.text = String(format: "%.2f", slider.value)
        textField.text = String(format: "%.2f", slider.value)
    }
}

extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard() {
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400))
        
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done",
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}

