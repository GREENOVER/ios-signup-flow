import UIKit

class SecondSignUpViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var birthDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func birthDatePicker(_ sender: UIDatePicker) {
        var pickerDate = sender.date
        let calendar = Calendar.current
        guard let endDate = calendar.date(byAdding: .hour, value: 8, to: pickerDate) else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.locale = Locale(identifier: "de-DE")
        var endTimeString = dateFormatter.string(from: endDate)
        birthDateLabel.text = endTimeString
    }
}
