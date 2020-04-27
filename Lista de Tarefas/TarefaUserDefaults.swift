//
//  File.swift
//  Lista de Tarefas
//
//  Created by Victor Rodrigues Novais on 27/04/20.
//  Copyright © 2020 Victoriano. All rights reserved.
//

import UIKit

class TarefaUserDefaults {
    
    let chave = "listaTarefas"
    var tarefas: [String] = []
    
    func remover(index: Int) {
        
        // Recupera tarefas
        tarefas = listar()
        
        //Remove do array
        tarefas.remove(at: index)
        UserDefaults.standard.set(tarefas, forKey: chave)
        
    }
    
    func salvar(tarefa: String){
        
        // Recuperar tarefas já salvas
        tarefas = listar()
        
        // Salvar a tarefa
        tarefas.append(tarefa)
        UserDefaults.standard.set(tarefas, forKey: chave)
        
    }
    
    func listar() -> Array<String>{
        
        let dados = UserDefaults.standard.object(forKey: chave)

        if dados != nil {
            return dados as! Array<String>
        } else {
            return []
        }
        
    }
    
}
