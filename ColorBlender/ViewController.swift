
import UIKit

final class ViewController: UIViewController {
    
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
    }
    
    //MARK: - IB Actions
    @IBAction func redSliderDidSlide() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        redValueLabel.text = String(format: "%.2F", redSlider.value)
    }
    
    @IBAction func greenSliderDidSlide() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        greenValueLabel.text = String(format: "%.2F", greenSlider.value)
    }
    
    @IBAction func blueSliderDidSlide() {
        coloredView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        blueValueLabel.text = String(format: "%.2F", blueSlider.value)
    }
    
    //MARK: - Privet methods
    private func setupValueLabels (){
        redValueLabel.text = String(format: "%.2F", redSlider.value)
        greenValueLabel.text = String(format: "%.2F", greenSlider.value)
        blueValueLabel.text = String(format: "%.2F", blueSlider.value)
    }
}

//MARK: - Setup UI
extension ViewController {
    private func setupSliders() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.maximumTrackTintColor = .gray
        redSlider.value = 0
   
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.maximumTrackTintColor = .gray
        greenSlider.value = 0
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.maximumTrackTintColor = .gray
        blueSlider.value = 0
    }
}
