//
//  ViewController.swift
//  ARC(Swift5)
//
//  Created by Сергей Голенко on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {
 
    
    // Чтобы разорвать цикл сильных ссылок, вы можете обозначить отношение между объектами как слабое (weak).
    
    
    func runScenario() {
      var user = User(name: "John")
      let iphone = Phone(model: "iPhone x")
        
        //ЭТО ЦИКЛ СИЛЬНЫХ ССЫЛОК (память не освобождается)
        iphone.owner = user
        user.add(phone: iphone)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        runScenario()
    }


}



/*
 Здесь определяется класс User, который при помощи операторов print сигнализирует нам об инициализации и освобождении экземпляра класса.
 */
class User {
    
    let name:String
    //Добавляем массив телефонов, которыми владеет user. Сеттер помечен как private, так что нужно использовать add(phone:).
    private(set) var phones : [Phone] = []
    func add(phone:Phone){
        phones.append(phone)
      //  phone.owner = self
    }
    
    init(name:String) {
        self.name = name
        print("User \(name) was initialized")
    }
    deinit {
        print("Deallocating user named:\(name)")
    }
}







class Phone {
    let model : String
     weak var owner: User?
    
    init(model: String) {
        self.model = model
        print("Phone \(model) was initialized")
      }

      deinit {
        print("Deallocating phone named: \(model)")
      }
}



class CarrierSubscription {
  let name: String
  let countryCode: String
  let number: String
  let user: User
              
  init(name: String, countryCode: String, number: String, user: User) {
    self.name = name
    self.countryCode = countryCode
    self.number = number
    self.user = user
    
    print("CarrierSubscription \(name) is initialized")
  }

  deinit {
    print("Deallocating CarrierSubscription named: \(name)")
  }
}     


