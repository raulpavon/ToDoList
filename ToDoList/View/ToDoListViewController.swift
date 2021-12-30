//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Raul Leonardo Pavon Toral on 30/12/21.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    weak var toDoListCoordinator: ToDoListCoordinator?
    private let toDoListFactory: ToDoListFactory

    lazy var toDoListUIView: ToDoListUIView = {
        let view = ToDoListUIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewModel: ToDoListViewModel = {
        let viewModel = toDoListFactory.makeToDoListViewModel(view: self, toDoListRepository: toDoListFactory.makeToDoListRepository())
        return viewModel
    }()
    
    required init(factory: ToDoListFactory, toDoListCoordinator: ToDoListCoordinator) {
        self.toDoListFactory = factory
        self.toDoListCoordinator = toDoListCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        initComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getToDoList()
        view.backgroundColor = .red
        self.title = "To Do List"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func initComponents() {
        addComponents()
        setAutolayout()
    }
    
    func addComponents() {
        view.addSubview(toDoListUIView)
    }
    
    func setAutolayout() {
        NSLayoutConstraint.activate([
            toDoListUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toDoListUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toDoListUIView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toDoListUIView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ToDoListViewController: ToDoListView {
    func setToDoList(items: [Item]) {
        toDoListUIView.items = items
        DispatchQueue.main.async {
            self.toDoListUIView.tableView.reloadData()
        }
    }
}
