//
//  TarefasTableViewController.swift
//  Lista de Tarefas
//
//  Created by Victor Rodrigues Novais on 27/04/20.
//  Copyright © 2020 Victoriano. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {

    var tarefas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func atualizarListaTarefas() {
        let tarefa = TarefaUserDefaults()
        tarefas = tarefa.listar()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atualizarListaTarefas()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tarefas.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)

        celula.textLabel?.text = tarefas[indexPath.row]

        return celula
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let tarefa = TarefaUserDefaults()
            tarefa.remover(index: indexPath.row)
            atualizarListaTarefas()
        }
        
    }
}
