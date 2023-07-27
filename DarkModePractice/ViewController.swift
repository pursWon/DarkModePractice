import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearanceCheck(self)
    }
    
    func setButton() {
        lightButton.layer.cornerRadius = 10
    }
    
    @IBAction func lightButton(_ sender: UIButton) {
        if self.overrideUserInterfaceStyle == .light {
            UserDefaults.standard.set("Dark", forKey: "Appearance")
        } else if self.overrideUserInterfaceStyle == .dark {
            UserDefaults.standard.set("Light", forKey: "Appearance")
        }
        
        appearanceCheck(self)
    }
    
    func appearanceCheck(_ viewController: UIViewController) {
        var appearance = UserDefaults.standard.string(forKey: "Appearance")
        
        if appearance == "Light" {
            appearance = "Light"
            viewController.overrideUserInterfaceStyle = .light
          
            if #available(iOS 13.0, *) {
                UIApplication.shared.statusBarStyle = .lightContent
            } else {
                UIApplication.shared.statusBarStyle = .default
            }
        } else if appearance == "Dark" {
            appearance = "Dark"
            viewController.overrideUserInterfaceStyle = .dark
            
            if #available(iOS 13.0, *) {
                UIApplication.shared.statusBarStyle = .darkContent
            } else {
                UIApplication.shared.statusBarStyle = .default
            }
        }
    }
}



