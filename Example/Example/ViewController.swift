import UIKit
import SravniSDK

class ViewController: UIViewController {

    var key = "mobile.frontend"
    // var phoneNumber = "79060828289"
    var phoneNumber = "79633428349"

    var sdkConfig = """
    {
        "productName": "mfo"
    }
    """

    lazy var sdk = SravniManager(
        configuration: .init(key: key, phoneNumber: phoneNumber, sdkConfig: sdkConfig.data(using: .utf8)!)
    ) { [weak self] result in
        self?.statusLabel.textColor = result == .finished ? .systemGreen : .systemRed
        self?.statusLabel.text = "COMPLETION STATUS: \(result.description)"
    }

    let keyBackgroundView = UIView()
    let phoneBackgroundView = UIView()
    let configBackgroundView = UIView()

    let startButton = UIButton(type: .custom)
    let keyTextField = UITextField()
    let phoneTextField = UITextField()
    let configTextField = UITextField()
    let presentSwitch = UISwitch()
    let presentStyleLabel = UILabel()

    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(presentSwitch)

        presentStyleLabel.text = "Presentation style"
        presentStyleLabel.textColor = .lightGray
        presentStyleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        view.addSubview(presentStyleLabel)

        keyBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        keyBackgroundView.layer.cornerRadius = 12
        view.addSubview(keyBackgroundView)

        keyTextField.attributedPlaceholder = NSAttributedString(string: "SDK Key", attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        keyTextField.text = key
        keyTextField.autocapitalizationType = .none
        keyTextField.textColor = .black
        keyTextField.font = .systemFont(ofSize: 16)
        keyTextField.tag = 1
        keyTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(keyTextField)

        phoneBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        phoneBackgroundView.layer.cornerRadius = 12
        view.addSubview(phoneBackgroundView)

        configBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        configBackgroundView.layer.cornerRadius = 12
        view.addSubview(configBackgroundView)

        phoneTextField.attributedPlaceholder = NSAttributedString(string: "Phone number", attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        phoneTextField.text = phoneNumber
        phoneTextField.autocapitalizationType = .none
        phoneTextField.keyboardType = .numberPad
        phoneTextField.textColor = .black
        phoneTextField.font = .systemFont(ofSize: 16)
        phoneTextField.tag = 2
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(phoneTextField)

        configTextField.attributedPlaceholder = NSAttributedString(string: "SDK Config", attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)])
        configTextField.text = sdkConfig
        configTextField.autocapitalizationType = .none
        configTextField.textColor = .black
        configTextField.font = .systemFont(ofSize: 16)
        configTextField.tag = 3
        configTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(configTextField)

        startButton.setTitle("Start SravniSDK", for: .normal)
        startButton.backgroundColor = UIColor(red: 0, green: 175.0 / 255.0, blue: 1, alpha: 1)
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        startButton.layer.cornerRadius = 12
        startButton.addTarget(self, action: #selector(startAction(_:)), for: .touchUpInside)
        view.addSubview(startButton)

        statusLabel.textColor = .systemGreen
        statusLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        view.addSubview(statusLabel)

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
        statusLabel.frame = CGRect(
            x: 16,
            y: startButton.frame.origin.y + 56 + 16,
            width: view.bounds.width - 32,
            height: 30
        )

        phoneBackgroundView.frame = CGRect(
            x: 16,
            y: startButton.frame.origin.y - (60 + 16) * 2,
            width: view.bounds.width - 32,
            height: 60
        )
        phoneTextField.frame = phoneBackgroundView.frame.insetBy(dx: 8, dy: 8)

        configBackgroundView.frame = CGRect(
            x: 16,
            y: phoneBackgroundView.frame.maxY + 16,
            width: view.bounds.width - 32,
            height: 60
        )
        configTextField.frame = configBackgroundView.frame.insetBy(dx: 8, dy: 8)

        keyBackgroundView.frame = CGRect(
            x: 16,
            y: phoneBackgroundView.frame.origin.y - 60 - 16,
            width: view.bounds.width - 32,
            height: 60
        )
        keyTextField.frame = keyBackgroundView.frame.insetBy(dx: 8, dy: 8)

        presentSwitch.frame = CGRect(
            x: keyBackgroundView.frame.origin.x,
            y: keyBackgroundView.frame.origin.y - 40,
            width: presentSwitch.bounds.width,
            height: presentSwitch.bounds.height
        )
        presentStyleLabel.sizeToFit()
        presentStyleLabel.center = presentSwitch.center
        presentStyleLabel.frame.origin.x += presentSwitch.bounds.width + 55
    }

    @objc
    func startAction(_ sender: UIButton) {
        sdk.set(phoneNumber: phoneNumber)
        let vc = sdk.createViewController()!
        if presentSwitch.isOn {
            present(vc, animated: true)
        } else {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    @objc
    func textFieldDidChange(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            key = textField.text ?? ""
        case 2:
            phoneNumber = textField.text ?? ""
        case 3:
            sdkConfig = textField.text ?? ""
            if let data = sdkConfig.data(using: .utf8) {
                sdk.updateConfig(data)
            }
        default:
            break
        }
    }

    @objc
    func tapAction(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
}
