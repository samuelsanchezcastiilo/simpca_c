/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

/**
 *
 * @author SENA-CEDRUM
 */
public class total_insumo_quema_quimica {
    
    
    private Long valor_total_insumos;

    public total_insumo_quema_quimica(Long valor_total_insumos) {
        this.valor_total_insumos = valor_total_insumos;
    }

    public Long gettotal_insumos_quemaQ() {
        return valor_total_insumos;
    }

    public void settotal_insumos_quemaQ(Long valor_total_insumos) {
        this.valor_total_insumos = valor_total_insumos;
    }
    
    
}
