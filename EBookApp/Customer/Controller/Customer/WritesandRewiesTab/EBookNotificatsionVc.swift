
import UIKit

class EBookNotificatsionVc: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var bookPerstageArray = ["15","25","35"]
    
    var bookdecriptsionArray = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]



    
    var bookImageArray = [UIImage (named:"book_img02"),UIImage(named:"book_img03"),UIImage(named:"book_img04"),]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return bookPerstageArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificatsionCell", for: indexPath) as!NotificatsionCell
            


            cell.perstagelbl?.text = bookPerstageArray[indexPath.row]
            
            cell.bookImage.image = bookImageArray[indexPath.row]
            cell.textlbl.text = bookdecriptsionArray[indexPath.row]

            

            return cell

        }

        @IBAction func btnBack(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)

            
        }



}
