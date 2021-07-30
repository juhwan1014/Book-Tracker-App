//
//  ViewController.swift
//  Book-tracker-app
//
//  Created by APPLE on 2021-01-25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    let Books = [
        Book (title: "Harry Potter and the Philosopher's Stone", details:[ "ISBN : B019PIOJYU", "Author : J.K.Rowling", "Rating: 5 "," note: The material was fresh and the ",".          content was solid. "] , imageUrl: "https://m.media-amazon.com/images/I/51UoqRAxwEL.jpg"),
        Book (title:"Harry Potter and the Chamber of Secrets", details:["ISBN: B019PIOJY0", "Author: J.K.Rowling", "Rating: 5", "note: The content was interesting and","          attractive. "],imageUrl: "https://m.media-amazon.com/images/I/51TA3VfN8RL.jpg"),
        Book (title:"Harry Potter and the Prisoner of Azkaban",details:[ "ISBN: B019PIOJZ4",  "Author: J.K.Rowling", "Rating: 2", "note: Compared to the previous works," , "         the plot's interest was somewhat lower. "],imageUrl: "https://m.media-amazon.com/images/I/51Dfqo6jR5L.jpg"),
        Book (title:"Harry Potter and the Goblet of Fire",details:[ "ISBN:  B019PIOJWW",  "Author: J.K.Rowling", "Rating: 5", "note: The competitive structure of the Triwizard","          Tournament was very interesting. "],imageUrl: "https://m.media-amazon.com/images/I/51Vjb2qJwzL.jpg"),
        Book (title:"Harry Potter and the Order of the Phoenix",details:[ "ISBN: B019PIOJV8",  "Author: J.K.Rowling", "Rating: 4", "note: Despite the long storyline, the action","          was well described in a realistic way. "],imageUrl: "https://m.media-amazon.com/images/I/51-SI2+aQ2L.jpg"),
        Book (title:"Harry Potter and the Half-Blood Prince",details:[ "ISBN:  B019PIOJZE",  "Author: J.K.Rowling", "Rating: 1", "note: It's the slowest, and I have no choice ","          but to watch it for the next part. "],imageUrl: "https://m.media-amazon.com/images/I/51myHyjJsyL.jpg"),
        Book (title:"Harry Potter and the Deathly Hallows", details:[ "ISBN:  140885595X", "Author: J.K.Rowling", "Rating: 4", "note: It was very fun, but it felt like the writer","          had finished the story in a hurry."], imageUrl: "https://m.media-amazon.com/images/I/511DhzIj4cL.jpg")
        ]

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        
        let Book = Books[indexPath.row]
        
        cell.textLabel?.text = Books[indexPath.row].title
        
        if let url = URL(string: Book.imageUrl),
           let data = try? Data(contentsOf: url){
            cell.imageView?.image = UIImage(data: data)
        }
        
        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? BookDetailViewController, let index = tableView.indexPathForSelectedRow?.row{
            destination.Book = Books[index]
        }
    }
}

