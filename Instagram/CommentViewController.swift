

import UIKit
import Firebase

class CommentViewController: UIViewController {

    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    
    //送信ボタンが押された
    @IBAction func handleSendButton(_ sender: Any) {
    }
    
    //キャンセルボタンが押された
    @IBAction func handleCancellbutton(_ sender: Any) {
        // 一つ前の画面に戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

