import UIKit
import SravniSDK

class ViewController: UIViewController {

    var phoneNumber = "79633428349"

    var userContext = """
    {
        "productName": "credit-selection"
    }
    """

    var productContext = """
    {
        "Sravni-Partner-Id": "mobile.frontend",
        "Sravni-Partner-Name": "avito",
        "Sravni-Partner-Product-Id": "11111"
    }
    """

    lazy var sdk = SravniManager(
        configuration: .init(phoneNumber: phoneNumber, userContext: userContext.data(using: .utf8)!, productContext: productContext)
    ) { [weak self] result in
        self?.statusLabel.textColor = .systemGreen
        self?.statusLabel.text = "COMPLETION STATUS: \(result)"
    }

    let phoneBackgroundView = UIView()
    let configBackgroundView = UIView()
    let productBackgroundView = UIView()

    let startButton = UIButton(type: .custom)
    let phoneTextField = UITextField()
    let configTextField = UITextField()
    let productTextField = UITextField()
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

        phoneBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        phoneBackgroundView.layer.cornerRadius = 12
        view.addSubview(phoneBackgroundView)

        phoneTextField.attributedPlaceholder = NSAttributedString(
            string: "Phone number",
            attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)]
        )
        phoneTextField.text = phoneNumber
        phoneTextField.autocapitalizationType = .none
        phoneTextField.keyboardType = .numberPad
        phoneTextField.textColor = .black
        phoneTextField.font = .systemFont(ofSize: 16)
        phoneTextField.tag = 2
        phoneTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(phoneTextField)

        configBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        configBackgroundView.layer.cornerRadius = 12
        view.addSubview(configBackgroundView)

        configTextField.attributedPlaceholder = NSAttributedString(
            string: "User Context",
            attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)]
        )
        configTextField.text = userContext
        configTextField.autocapitalizationType = .none
        configTextField.textColor = .black
        configTextField.font = .systemFont(ofSize: 16)
        configTextField.tag = 3
        configTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(configTextField)

        productBackgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.05)
        productBackgroundView.layer.cornerRadius = 12
        view.addSubview(productBackgroundView)

        productTextField.attributedPlaceholder = NSAttributedString(
            string: "Product Context",
            attributes: [.foregroundColor: UIColor.black.withAlphaComponent(0.3)]
        )
        productTextField.text = productContext
        productTextField.autocapitalizationType = .none
        productTextField.textColor = .black
        productTextField.font = .systemFont(ofSize: 16)
        productTextField.tag = 4
        productTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        view.addSubview(productTextField)

        startButton.setTitle("Start SravniSDK", for: .normal)
        startButton.backgroundColor = UIColor(red: 0, green: 175.0/255.0, blue: 1, alpha: 1)
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

        let fieldWidth = view.bounds.width - 32
        let fieldHeight: CGFloat = 60
        let spacing: CGFloat = 16

        startButton.frame = CGRect(
            x: 16,
            y: view.bounds.midY - 28,
            width: fieldWidth,
            height: 56
        )

        productBackgroundView.frame = CGRect(
            x: 16,
            y: startButton.frame.origin.y - spacing - fieldHeight,
            width: fieldWidth,
            height: fieldHeight
        )
        productTextField.frame = productBackgroundView.frame.insetBy(dx: 8, dy: 8)

        configBackgroundView.frame = CGRect(
            x: 16,
            y: productBackgroundView.frame.origin.y - spacing - fieldHeight,
            width: fieldWidth,
            height: fieldHeight
        )
        configTextField.frame = configBackgroundView.frame.insetBy(dx: 8, dy: 8)

        phoneBackgroundView.frame = CGRect(
            x: 16,
            y: configBackgroundView.frame.origin.y - spacing - fieldHeight,
            width: fieldWidth,
            height: fieldHeight
        )
        phoneTextField.frame = phoneBackgroundView.frame.insetBy(dx: 8, dy: 8)

        presentSwitch.frame = CGRect(
            x: phoneBackgroundView.frame.origin.x,
            y: phoneBackgroundView.frame.origin.y - 40,
            width: presentSwitch.bounds.width,
            height: presentSwitch.bounds.height
        )
        presentStyleLabel.sizeToFit()
        presentStyleLabel.center = presentSwitch.center
        presentStyleLabel.frame.origin.x += presentSwitch.bounds.width + 55

        statusLabel.frame = CGRect(
            x: 16,
            y: startButton.frame.maxY + spacing,
            width: fieldWidth,
            height: 30
        )
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
        case 2:
            phoneNumber = textField.text ?? ""
        case 3:
            userContext = textField.text ?? ""
            if let data = userContext.data(using: .utf8) {
                sdk.updateConfig(data)
            }
        case 4:
            productContext = textField.text ?? ""
        default:
            break
        }
    }

    @objc
    func tapAction(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
}
