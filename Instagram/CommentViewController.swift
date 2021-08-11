

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    
    //送信ボタンが押された
    @IBAction func handleSendButton(_ sender: Any) {
        // コメントの保存場所を定義する
        let commentRef = Firestore.firestore().collection(Const.PostPath).document()
        
        // FireStoreに投稿データを保存する
        let name = Auth.auth().currentUser?.displayName
        let postDic = [
            "name": name!,
            "postComment": self.commentTextField.text!,
        ] as [String : Any]
        commentRef.setData(postDic)
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントを投稿しました")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
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

