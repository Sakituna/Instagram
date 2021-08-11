

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 表示名を取得してLabelに設定する
        let user = Auth.auth().currentUser
        if let user = user {
            commentNameLabel.text = user.displayName
        }
    }
}
