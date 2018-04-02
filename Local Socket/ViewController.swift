//
//  ViewController.swift
//  Local Socket
//
//  Created by Анатолий on 23.03.2018.
//  Copyright © 2018 Анатолий Модестов. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
    
    let socket = SocketIOClient(socketURL: URL(string:"192.168.0.77:8880")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        addHandlers()
        socket.connect()
    }

    func addHandlers() {
        
//        socket.on("connect") { _, _ in
//            print("socket connected yoooooooooooo")
//            self.socket.emit("changeRoom", self.idNote)
//        }
        
//        socket.on("changeRoom") { _, _ in
//            print("ping received olololol")
//        }
//
//        socket.on("typing") {[weak self] data, ack in
//            self?.typing(textView: textView)
//            print("пользователь набирает текст")
//            return
//        }
//
//        socket.on("update") {[weak self] data, ack in
//            self?.update(textView: textView, data: data)
//            return
//        }
        
        self.socket.onAny {print("-----------------------------------------\nGot event: \($0.event), with items: \($0.items)\n-----------------------------------------")}
    }

}

