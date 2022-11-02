//
//  ViewController.swift
//  SecondLesson
//
//  Created by Aleksandr on 10/28/22.
//

import UIKit

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
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func inputRgbValue(_ sender: UITextField) {
        switch sender.tag {
        case 0:
            insertTextFieldValue(redSlider, redSliderLabel, redTextField)
        case 1:
            insertTextFieldValue(greenSlider, greenSliderLabel, greenTextField)
        case 2:
            insertTextFieldValue(blueSlider, blueSliderLabel, blueTextField)
        default:
            break
        }
        changeBackgroundColor()
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            sliderAction(redSlider, redSliderLabel, redTextField)
        case 1:
            sliderAction(greenSlider, greenSliderLabel, greenTextField)
        case 2:
            sliderAction(blueSlider, blueSliderLabel, blueTextField)
        default: break
        }
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

extension ViewController {
    
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
         
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

