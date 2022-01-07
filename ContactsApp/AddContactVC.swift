import UIKit
import SnapKit

class AddContactVC: UIViewController {
    
    private lazy var name1: UILabel = {
        let view = UILabel()
        view.text = "Name:"
        view.textColor = .black
        return view
    }()
    
    private lazy var number1: UILabel = {
        let view = UILabel()
        view.text = "Number:"
        view.textColor = .black
        return view
    }()
    
    lazy var nameField: UITextField = {
        let view = UITextField()
        view.placeholder = "John"
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var numberField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .systemGray
        view.placeholder = "0XXX-XXX-XXX"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add contact"
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Complete", style: .plain, target: self, action: #selector(completeTapped))
        
        setupSubviews()
    }

    

    private func setupSubviews(){
        view.addSubview(name1)
        name1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height / 10)
            make.left.equalToSuperview()
            make.height.equalToSuperview().dividedBy(15)
            make.width.equalToSuperview().dividedBy(2)
        }
        view.addSubview(nameField)
        nameField.snp.makeConstraints { make in
            make.top.equalTo(name1.snp.bottom).offset(view.frame.height / 40)
            make.height.equalToSuperview().dividedBy(15)
            make.width.equalToSuperview().dividedBy(2)
        }
        view.addSubview(number1)
        number1.snp.makeConstraints { make in
            make.top.equalTo(nameField.snp.bottom).offset(view.frame.height / 40)
            make.height.equalToSuperview().dividedBy(15)
            make.width.equalToSuperview().dividedBy(2)
        }
        view.addSubview(numberField)
        numberField.snp.makeConstraints { make in
            make.top.equalTo(number1.snp.bottom).offset(view.frame.height / 40)
            make.height.equalToSuperview().dividedBy(15)
            make.width.equalToSuperview().dividedBy(2)
        }
    }
    
    @objc func completeTapped(){
            let contactName = self.nameField.text ?? "Name"
            let contactNumber = self.numberField.text ?? "Number"
            let rootVC = ViewController()
        rootVC.contacts.append(Contact(name: contactName, phone: contactNumber))
        navigationController?.popViewController(animated: true)
    }
    
}

