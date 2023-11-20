//
//  ViewController.swift
//  Messenger
//
//  Created by Tanish Parmar on 09/10/23.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    //labels
    
    
    @IBOutlet weak var emailLabelOutlet: UILabel!
    
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    //textField
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    //Buttons
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    
    
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    
    @IBOutlet weak var resendEmailButtonOutlet: UIButton!
    
    
    //Views
    @IBOutlet weak var repeatPasswordLineView: UIView!
    
    //MARK: - Vars
    var isLogin:Bool = true
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIFor(login: true)
        setupTextFieldDelegate()
        setupBackgroundTap()
    }
    
    //MARK: - IBActions
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: isLogin ? "login" : "register"){
            isLogin ? loginUser() : registerUser()
        }
        else{
            ProgressHUD.showFailed("All Fields are required")
        }
            
    }
    

    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "password"){
            resetPassword()
        }
        else{
            ProgressHUD.showFailed("Email is required")
        }
    }
   
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "password"){
            resendVerificationEmail()
        }
        else{
            ProgressHUD.showFailed("Email is required")
        }
    }
   
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
        
    }
    
    
    //MARK: - Setup
    private func  setupTextFieldDelegate(){
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        updatePlaceholderLabels(textField: textField)
    }
    
    private func setupBackgroundTap(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap(){
        view.endEditing(false)
    }
    //MARK: - Animations
    
    private func updateUIFor(login: Bool){
        loginButtonOutlet.setImage(UIImage(named: login ? "loginBtn" : "registerBtn"), for: .normal)
        signUpButtonOutlet.setTitle(login ? "Sign Up" : "Login", for: .normal)
        signUpLabel.text = login ? "Don't have an account?" : "Have an account?"
        UIView.animate(withDuration: 0.5) {
            self.repeatPasswordTextField.isHidden = login
            self.repeatPasswordLabel.isHidden = login
            self.repeatPasswordLineView.isHidden = login
        }
    }
    
    private func updatePlaceholderLabels(textField: UITextField){
        switch textField{
        case emailTextField:
            emailLabelOutlet.text = textField.hasText ? "Email" : ""
        case passwordTextField:
            passwordLabelOutlet.text = textField.hasText ? "Password" : ""
        default:
            repeatPasswordLabel.text = textField.hasText ? "Repeat Password" : ""
        }
    }
    
    //MARK: - Helpers
    private func isDataInputedFor(type:String)->Bool{
        switch type {
        case "login":
            return emailTextField.text != "" && passwordTextField.text != ""
        case "registration":
            return emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != ""
        default:
            return emailTextField.text != ""
        }
    }
    
    private func registerUser(){
        if passwordTextField.text! == repeatPasswordTextField.text!{
            FirebaseUserListener.shared.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!){ (error) in
                if error == nil{
                    ProgressHUD.showSucceed("Verification Email sent")
                    self.resendEmailButtonOutlet.isHidden = false
                }
                else{
                    ProgressHUD.showFailed(error!.localizedDescription)
                }
            }
        }
        else{
            ProgressHUD.showFailed("The passwords don't match")
        }
    }
    
    private func loginUser(){
        FirebaseUserListener.shared.loginUserWithEmail(email: emailTextField.text!, password: passwordTextField.text!){ (error, isEmailVerified) in
            if error == nil{
                if isEmailVerified{
//                    print("user has logged in with email ", User.currentUser?.email)
                    self.goToApp()
                }
                else{
                    ProgressHUD.showFailed("Please verify email")
                    self.resendEmailButtonOutlet.isHidden = false
                }
            }
            else{
                ProgressHUD.showFailed(error!.localizedDescription)
            }
        }
    }
    
    private func resetPassword(){
        FirebaseUserListener.shared.resetPasswordFor(email: emailTextField.text!) { (error) in
            if error == nil{
                ProgressHUD.showSucceed("Reset link sent to email")
            }
            else{
                ProgressHUD.showFailed(error!.localizedDescription)
            }
        }
    }
    
    private func resendVerificationEmail(){
        FirebaseUserListener.shared.resendVerificationEmail(email: emailTextField.text!) { (error) in
            if error == nil{
                ProgressHUD.showSucceed("New Verification email sent.")
            }
            else{
                ProgressHUD.showFailed(error!.localizedDescription)
            }
        }
    }

    
    //MARK: - Navigation
    private func goToApp(){
        let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! UITabBarController
        mainView.modalPresentationStyle = .fullScreen
        self.present(mainView,animated: true,completion: nil)
    }
    
}

