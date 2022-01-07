import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        setupSubviews()
        setupContacts()
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    var contacts: [Contact] = []

    var addingContactName: String?
    var addingContactNumber: String?
    
    private func setupSubviews(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupContacts(){
        let malika = Contact(name: "Малика", phone: "0555-777-999")
        contacts.append(malika)
        let alina = Contact(name: "Алина", phone: "0700-757-890")
        contacts.append(alina)
        let aika = Contact(name: "Айка", phone: "0772-555-666")
        contacts.append(aika)
        let meder = Contact(name: "Медер", phone: "0222-777-999")
        contacts.append(meder)
        let saadat = Contact(name: "Саадат", phone: "0500-600-700")
        contacts.append(saadat)
        let elmir = Contact(name: "Эльмир", phone: "0312-312-312")
        contacts.append(elmir)
        let vadim = Contact(name: "Вадим", phone: "0705-757-595")
        contacts.append(vadim)
        let vanya = Contact(name: "Ваня", phone: "0550-757-959")
        contacts.append(vanya)
        let sveta = Contact(name: "Света", phone: "0707-770-007")
        contacts.append(sveta)
        let katya = Contact(name: "Катя", phone: "0559-707-909")
        contacts.append(katya)
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = DetailedVC()
        let navVC = UINavigationController(rootViewController: rootVC)
        rootVC.nameField.text = contacts[indexPath.row].name!
        rootVC.numberField.text = contacts[indexPath.row].phone!
        present(navVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell()
        let contact = contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    
    @objc func addTapped(){
        navigationController?.pushViewController(AddContactVC(), animated: true)
    }
    
    
    
}

