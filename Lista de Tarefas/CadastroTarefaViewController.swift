//
//  CadastroTarefaViewController.swift
//  Lista de Tarefas
//
//  Created by Victor Rodrigues Novais on 27/04/20.
//  Copyright © 2020 Victoriano. All rights reserved.
//

import UIKit

class CadastroTarefaViewController: UIViewController {
    
    @IBOutlet weak var tarefaCampo: UITextField!
    
    
    @IBAction func adicionarTarefa(_ sender: Any) {
        
        if let textoDigitado = tarefaCampo.text {
            
            let tarefa = TarefaUserDefaults()
            tarefa.salvar(tarefa: textoDigitado)
            tarefaCampo.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true )
    }
}
