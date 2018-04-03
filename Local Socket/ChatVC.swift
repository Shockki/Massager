//
//  ChatVC.swift
//  Local Socket
//
//  Created by Анатолий on 02.04.2018.
//  Copyright © 2018 Анатолий Модестов. All rights reserved.
//

import UIKit

class ChatVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var textFieldSend: UITextField!
    @IBOutlet weak var viewSendText: UIView!
    
    @IBOutlet weak var bottomTextField: NSLayoutConstraint!
    var messegesArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShown), name:NSNotification.Name.UIKeyboardWillHide, object: nil);

    }

    @IBAction func sendButton(_ sender: Any) {
        if textFieldSend.text!.isEmpty {
            messegesArray.append("Text text text")
        } else {
            messegesArray.append(textFieldSend.text!)
        }
        textFieldSend.text = ""
        print(chatTableView.estimatedRowHeight)
        chatTableView.reloadData()
    }
    
    @IBAction func infoButton(_ sender: Any) {
        messegesArray.append("Во мне чужой, уже свой\nЧто не так-то со мною\nВзрослые думают, что я тупица и голубой\nТупица и голубой, тупица и голубой;\nВзрослые думают, что я тупица и голубой")
        
        chatTableView.reloadData()
    }
    
    
    @objc func keyboardShown(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        if bottomTextField.constant == 0  {
            viewSendText.frame = CGRect(x: viewSendText.frame.origin.x
            , y: keyboardFrame.origin.y - viewSendText.frame.size.height, width: viewSendText.frame.size.width, height: viewSendText.frame.size.height)
            bottomTextField.constant = bottomTextField.constant - keyboardFrame.size.height
        } else {
            viewSendText.frame = CGRect(x: viewSendText.frame.origin.x
                , y: viewSendText.frame.origin.y + keyboardFrame.size.height, width: viewSendText.frame.size.width, height: viewSendText.frame.size.height)
            bottomTextField.constant = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldSend.resignFirstResponder()
        return true
    }

    
}


extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messegesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "cellTwo", for: indexPath) as! ChatTableViewCell
        cell.viewText.text = messegesArray[indexPath.row]
        

        
        
        return cell
    }
}
