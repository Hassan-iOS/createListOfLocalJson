//
//  ViewController.swift
//  createListOfLocalJson
//
//  Created by Hassan Mostafa on 03/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var settings: [SettingsModel]?{
        didSet {
            self.settingsTableView.reloadData()
        }
    }
    
    @IBOutlet weak var settingsTableView: UITableView! {
        didSet {
            settingsTableView.delegate = self
            settingsTableView.dataSource = self
            settingsTableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
    }
    
    func loadSettings() {
        guard let settingsURL = Bundle.main.url(forResource: "SettingsList", withExtension: "json") else { return }
        do {
            let data = try Data(contentsOf: settingsURL)
            let settings = try JSONDecoder().decode([SettingsModel].self, from: data)
            self.settings = settings
        } catch {
           print(error)
        }
        
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to details
        
        let setting = settings?[indexPath.row]
        switch setting?.id {
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: setting!.VC)
            present(vc!, animated: true)
        case 2:
            // navigate to qr screen
            print("")
        default:
            break
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.settings = self.settings?[indexPath.row]
        return cell
    }
}
