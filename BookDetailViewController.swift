//
//  BookDetailViewController.swift
//  Book-tracker-app
//
//  Created by APPLE on 2021-01-25.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    var Book: Book?
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let unWrappedBook = Book,
              let url = URL(string: unWrappedBook.imageUrl),
              let data = try? Data(contentsOf: url),
              let validImage = UIImage(data: data)
        else{
            print("error")
            return
        }
        self.title = unWrappedBook.title
        imageView.image = validImage
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Book?.details.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        cell.textLabel?.text = Book?.details[indexPath.row]
       
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
