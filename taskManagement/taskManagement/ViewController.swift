//
//  ViewController.swift
//  taskManagement
//
//  Created by Nojood Aljuaid  on 02/07/1445 AH.
//

import UIKit

class ViewController: UIViewController {
    
    var todosArray = [
    Todo(name: "studying the exam", image: UIImage(named: "exams")! , desc: "studying programming at 7 O'clock"),
    Todo(name: "Go to pray", image: UIImage(named: "prayer")! , desc: "i pray everyday"),
    Todo(name: "read alqr'an", image: UIImage(named: "Qr'an")! , desc: "read qr'an afternoon"),
    Todo(name: "read a book", image: UIImage(named: "books")! , desc: "read a book before sleeping ")
    ]
    @IBOutlet weak var todosTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self , selector: #selector(newTodoAdded), name: NSNotification.Name(rawValue: "newTodoAdded"), object: nil)
        todosTableView.dataSource = self
        todosTableView.delegate = self
       
    }
    @objc func newTodoAdded(notification : Notification){
        let todo = notification.userInfo?["newAdded"] as? Todo
        
        if let todos = todo {
            todosArray.append(todos)
            todosTableView.reloadData()
        }
    }
    

}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! todosCell
        var todo = todosArray[indexPath.row]
        cell.todoLable.text = todo.name
        if todo.image != nil {
            cell.todoImageView.image = todo.image
        }else {
            cell.todoImageView.image = UIImage(named: "task")
        }
        cell.todoImageView.layer.cornerRadius = cell.todoImageView.frame.width / 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todosArray[indexPath.row]
    let vc = storyboard?.instantiateViewController(identifier: "details") as? DetailsViewController
      if  let viewCont = vc {
          viewCont.todo = todo
          navigationController?.pushViewController(viewCont, animated: true)
          
        }
        todosTableView.deselectRow(at: indexPath , animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
}
