//
//  ViewController.swift
//  UIKitEssential
//
//  Created by Anton Goncharov on 09.04.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textViewSignCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        label.isHidden = true
        segment.insertSegment(withTitle: "third", at: 2, animated: true)
        datePicker.locale = Locale.init(identifier: "ru_RU")
        textView.layer.cornerRadius = 10
        button.layer.cornerRadius = 10
        textView.text = ""
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
    }
    
    @objc func updateTextView(notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String: AnyObject],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: keyboardFrame.height - textViewBottomConstraint.constant,
                right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        guard textField.text?.isEmpty == false else {
            return
        }
        
        label.isHidden = false
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .actionSheet)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            textField.text = nil
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch segment.selectedSegmentIndex {
        case 0:
            label.text = "You have selected first segment"
            label.textColor = .yellow
        case 1:
            label.text = "You have selected second segment"
            label.textColor = .cyan
        case 2:
            label.text = "You have selected third segment"
            label.textColor = .magenta
        default:
            label.text = nil
        }
    }
    
    @IBAction func datePickerHandler(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale.init(identifier: "ru_RU")
        
        let dateValue = dateFormatter.string(from: sender.date)
        label.isHidden = false
        label.text = dateValue
    }
    @IBAction func switchHandler(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        textField.isHidden = !textField.isHidden
        segment.isHidden = !segment.isHidden
        datePicker.isHidden = !datePicker.isHidden
        button.isHidden = !button.isHidden
        
        switchLabel.text = sender.isOn ? "Show elements" : "Hide elements";
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
//        textView.resignFirstResponder()
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textViewSignCounter.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 60
    }
    
}

