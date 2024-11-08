import UIKit
import SravniSDK

class ViewController: UIViewController {
    
    var key = ""
    var phoneNumber = ""
    
    lazy var sdk = Sravni.SDK(configuration: .init(key: key, phoneNumber: phoneNumber))
    
    let keyBackgroundView = UIView()
    let phoneBackgroundView = UIView()
    
    let startButton = UIButton(type: .custom)
    let keyTextField = UITextField()
    let phoneTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        keyBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        keyBackgroundView.layer.cornerRadius = 12
        view.addSubview(keyBackgroundView)
        
        keyTextField.attributedPlaceholder = NSAttributedString(string: "SDK Key", attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        keyTextField.text = key
        keyTextField.autocapitalizationType = .none
        keyTextField.textColor = .black
        keyTextField.font = .systemFont(ofSize: 16)
        view.addSubview(keyTextField)
        
        phoneBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        phoneBackgroundView.layer.cornerRadius = 12
        view.addSubview(phoneBackgroundView)

        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Phone number", attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        phoneTextField.text = phoneNumber
        phoneTextField.autocapitalizationType = .none
        phoneTextField.keyboardType = .numberPad
        phoneTextField.textColor = .black
        phoneTextField.font = .systemFont(ofSize: 16)
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(phoneTextField)
        
        startButton.setTitle("Start SravniSDK", for: .normal)
        startButton.backgroundColor = UIColor(red: 0, green: 175.0 / 255.0, blue: 1, alpha: 1)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        startButton.layer.cornerRadius = 12
        startButton.addTarget(self, action: #selector(startAction(_:)), for: .touchUpInside)
        view.addSubview(startButton)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        view.addGestureRecognizer(gestureRecognizer)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startButton.frame = CGRect(
            x: 16,
            y: view.bounds.midY - 28,
            width: view.bounds.width - 32,
            height: 56
        )
        phoneBackgroundView.frame = CGRect(
            x: 16,
            y: startButton.frame.origin.y - 60 - 16,
            width: view.bounds.width - 32,
            height: 60
        )
        keyBackgroundView.frame = CGRect(
            x: 16,
            y: phoneBackgroundView.frame.origin.y - 60 - 16,
            width: view.bounds.width - 32,
            height: 60
        )
        phoneTextField.frame = phoneBackgroundView.frame.insetBy(dx: 8, dy: 8)
        keyTextField.frame = keyBackgroundView.frame.insetBy(dx: 8, dy: 8)
    }
    
    @objc
    func startAction(_ sender: UIButton) {
        sdk.set(phoneNumber: phoneNumber)
        sdk.start(with: navigationController!)
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        phoneNumber = textField.text ?? ""
    }
    
    @objc
    func tapAction(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
}
