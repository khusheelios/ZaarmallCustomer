
import UIKit

class EBookMyCarrtVc: UIViewController {

    
    @IBOutlet weak var SizePopupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(SizePopupView)
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(EBookMyCarrtVc.handleTap(_:)))
                SizePopupView.addGestureRecognizer(tapGesture)
            }
            
            @objc func handleTap(_ sender: UITapGestureRecognizer) {
                SizePopupView.isHidden = true
            }
    @IBAction func btnContonue(_ sender: Any) {
        SizePopupView.isHidden = true

    }
    @IBAction func btnCross(_ sender: Any) {
        SizePopupView.isHidden = true

    }
    @IBAction func btnPlace(_ sender: Any) {
    }
    
    @IBAction func btnSize(_ sender: Any) {
        
        if(SizePopupView.isHidden == true){
            SizePopupView.isHidden = false
            SizePopupView.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        }
        else{
            SizePopupView.isHidden = true

        }

    }
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    

}

