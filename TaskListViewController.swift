//
//  TaskListViewController.swift
//  PhotoScavengerHunt
//
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // UI candy: Hide 1st / top cell separator
        tableView.tableHeaderView = UIView()

        tasks = Task.mockTasks
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // This will reload data in order to reflect any changes made to a task after returning from the detail screen.
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell with identifier, "TaskCell"
        // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        
        // Get the task that corresponds to the table view row
        let task = tasks[indexPath.row]
        
        // Configure the cell with its associated task
        cell.configure(with: task)
        
        // return the cell for display in the table view
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let detailViewController = segue.destination as? TaskDetailViewController,
               // Get the index path for the current selected table view row.
               let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                // Get the task associated with the selected index path.
                let task = tasks[selectedIndexPath.row]
                
                // Set the selected task on the detail view controller.
                detailViewController.task = task
            }
        }
    }
}
