
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
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        coloredView.layer.cornerRadius = 18
        setupSliders()
        setupValueLabels()
        setColor()
    }
    
    //MARK: - IB Actions
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValueLabel.text = String(format: "%.2F", redSlider.value)
        case greenSlider:
            greenValueLabel.text = String(format: "%.2F", greenSlider.value)
        default:
            blueValueLabel.text = String(format: "%.2F", blueSlider.value)
        }
    }
    
    @IBAction func DoneButtonTapped(_ sender: Any) {
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
        redSlider.value = 0
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .gray
        greenSlider.value = 0
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .gray
        blueSlider.value = 0
    }
    
    private func setupValueLabels (){
        redValueLabel.text = String(format: "%.2F", redSlider.value)
        greenValueLabel.text = String(format: "%.2F", greenSlider.value)
        blueValueLabel.text = String(format: "%.2F", blueSlider.value)
    }
    
}
