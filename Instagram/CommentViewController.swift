

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentNameLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    
    var postData: PostData!
    //送信ボタンが押された
    @IBAction func handleSendButton(_ sender: Any) {

        
        // FireStoreに投稿データを保存する
        let name = Auth.auth().currentUser?.displayName
        
        let commentData = name! + ";" + self.commentTextField.text!
        
        let updateValue: FieldValue = FieldValue.arrayUnion([commentData])
        
        // commentに更新データを書き込む
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        postRef.updateData(["comments": updateValue])
        
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

