import UIKit
import PhotosUI
    
final class FirstSignUpViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    @IBOutlet weak var introductionTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
      
    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        
        tapRecognizerSetting()
    }
    
    private func tapRecognizerSetting() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        self.view.addGestureRecognizer(tapRecognizer)
        
        let profileImageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(editProfileImage(_:)))
        self.profileImageView.addGestureRecognizer(profileImageTapRecognizer)
    }
        
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        self.view.endEditing(true)
        
        checkInfo()
    }
    
    @objc func editProfileImage(_ sender: UITapGestureRecognizer) {
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        self.imagePicker.delegate = self
                    
        self.present(self.imagePicker, animated: true)
    }
    
    private func checkInfo() {
        let checkedPassword: Bool = isSamePassword()

        if (idTextField.text?.isEmpty == false) &&
           (passwordTextField.text?.isEmpty == false) &&
           (checkPasswordTextField.text?.isEmpty == false) &&
           (introductionTextView.text.isEmpty == false) &&
           (profileImageView.image != nil) &&
           (checkedPassword == true) {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    private func isSamePassword() -> Bool {
        guard let password = passwordTextField.text, let checkPassword = checkPasswordTextField.text else { return false }
        
        return password == checkPassword
    }
    
    @IBAction func storeUserInfo(_ sender: UIButton) {
        UserInformation.shared.id = idTextField.text
        UserInformation.shared.password = passwordTextField.text
        UserInformation.shared.introduction = introductionTextView.text
        UserInformation.shared.profileImage = profileImageView.image
    }
    
    @IBAction func cancelSignUp() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension FirstSignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var resultImage: UIImage? = nil
        
        if let editedImage = info[.editedImage] as? UIImage {
            resultImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            resultImage = originalImage
        }
        profileImageView.image = resultImage
        
        picker.dismiss(animated: true)
        
        checkInfo()
    }
}
