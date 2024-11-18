
import UIKit

final class ColorBlenderViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var coloredView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var delegate: ColorBlenderViewControllerDelegate?
    
    var redColor: CGFloat!
    var greenColor: CGFloat!
    var blueColor: CGFloat!
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 18
        setupSliders()
        setupValueLabels()
        setColor()
        setupValueTF()
        addDoneButtonOnKeyboard(textField: redTextField)
        addDoneButtonOnKeyboard(textField: greenTextField)
        addDoneButtonOnKeyboard(textField: blueTextField)
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }
    
    //MARK: - IB Actions
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = String(format: "%.2F", redSlider.value)
            redColor = CGFloat(redSlider.value)
            redTextField.text = String(format: "%.2F", redSlider.value)
        case greenSlider:
            greenValueLabel.text = String(format: "%.2F", greenSlider.value)
            greenColor = CGFloat(greenSlider.value)
            greenTextField.text = String(format: "%.2F", greenSlider.value)
        default:
            blueValueLabel.text = String(format: "%.2F", blueSlider.value)
            blueColor = CGFloat(blueSlider.value)
            blueTextField.text = String(format: "%.2F", blueSlider.value)
        }
    }
    
    @IBAction func DoneButtonTapped() {
        view.endEditing(true)
        delegate?.setViewColor(red: redColor, green: greenColor, blue: blueColor)
        dismiss(animated: true)
    }
    
    //MARK: - Privet methods
    private func setColor() {
        coloredView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

//MARK: - Setup UI
extension ColorBlenderViewController {
    private func setupSliders() {
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .gray
        redSlider.value = Float(redColor)
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .gray
        greenSlider.value = Float(greenColor)
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .gray
        blueSlider.value = Float(blueColor)
    }
    
    private func setupValueLabels (){
        redValueLabel.text = String(format: "%.2F", redSlider.value)
        greenValueLabel.text = String(format: "%.2F", greenSlider.value)
        blueValueLabel.text = String(format: "%.2F", blueSlider.value)
    }
    private func setupValueTF () {
        redTextField.text = String(format: "%.2F", redSlider.value)
        greenTextField.text = String(format: "%.2F", greenSlider.value)
        blueTextField.text = String(format: "%.2F", blueSlider.value)
    }
}

//MARK: - UITextFieldDelegate
extension ColorBlenderViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(title: "Wrong format!",
                      massage: "Please, enter correct value.",
                      completion: {textField.text = ""}
            )
            return
        }
        
        guard   let value = Double(text), 0...1 ~= value else {
            showAlert(title: "Wrong format!",
                      massage: "Please, enter correct value.",
                      completion: {textField.text = ""}
            )
            return
        }
        switch textField {
        case redTextField:
            redColor = CGFloat(Double(textField.text!)!)
            setupSliders()
            setupValueLabels()
        case greenTextField:
            greenColor = CGFloat(Double(textField.text!)!)
            setupSliders()
            setupValueLabels()
        default:
            blueColor = CGFloat(Double(textField.text!)!)
            setupSliders()
            setupValueLabels()
        }
        setColor()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func addDoneButtonOnKeyboard (textField: UITextField) {
        let keyboardToolBar: UIToolbar = UIToolbar()
        keyboardToolBar.items = [
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction(sender:))),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        ]
        keyboardToolBar.sizeToFit()
        textField.inputAccessoryView = keyboardToolBar
    }
    
    @objc func doneButtonAction(sender: UIBarButtonItem) {
        view.endEditing(true)
     }
}

//MARK: - Show alert
extension ColorBlenderViewController {
    private func showAlert(title: String, massage: String, completion:(()->Void)? = nil){
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default){ _ in
        completion?()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
