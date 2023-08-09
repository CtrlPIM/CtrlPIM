`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2021 12:32:32
// Design Name: 
// Module Name: PIMTranslate_MUX_sel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PIMTranslate_MUX_sel
(
    input       [63:0]  PIM_instr, 
    input       [15:0]   instr_type,
    input               clk,
    input               PIM_load,
    
    output reg          immediate_ld_sel,
    output reg          iw1_ld_sel,
    output reg          iw2_ld_sel,
    output reg          dest_ld_sel,
    output reg          src1_ld_sel,
    output reg          src2_ld_sel,
    output reg          tstart_sel,
    output reg          tend_sel,
    output reg          start_sel,
    output reg          end_sel,
    output reg          col_num_sel,
    output reg          row_num_sel,
    output reg          crossbar_number_sel,
    output reg          cend_sel,
    output reg          cstart_sel,
    output reg          istart_sel,
    output reg          iend_sel,
    output reg          immu_sel
    
    );
    
    // PIM_instr[5] = A 
    // PIM_instr[4] = B
    // PIM_instr[3] = C 
    // PIM_instr[2] = D
    // PIM_instr[1] = E 
    // PIM_instr[0] = F
    
    // instr_type[0] = INIT Type
    // instr_type[1] = CMASK Type.   
    // instr_type[2] = MASK Type.   
    // instr_type[3] = TEMP Type.
    // instr_type[4] = LUI  Type.
    // instr_type[5] = PIM_Load Type    
    // instr_type[6] = L/S  Type. 
    // instr_type[7] = V Type.
    // instr_type[8] = VV Type.
    // instr_type[9] = I Type
    
    
    always @(negedge clk)
        begin 
                if(instr_type[9] && PIM_load)                 //Immediate --> y = AB' + A'BC  
                   begin
                        immediate_ld_sel        <= 1;
                        iw1_ld_sel              <= 1;
                        iw2_ld_sel              <= 1;
                        dest_ld_sel             <= 1;
                        src1_ld_sel             <= 1;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0;
                        iend_sel                <= 0;                      
                        istart_sel              <= 0;
                        immu_sel                <= 0;
                   end
                else if(instr_type[8] && PIM_load)  //  VV-Type Instructions --> (A') (B' + C') (B + C) (B + D + E + F)  
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 1;
                        iw2_ld_sel              <= 1;
                        dest_ld_sel             <= 1;
                        src1_ld_sel             <= 1;
                        src2_ld_sel             <= 1;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0;
                        iend_sel                <= 0;                      
                        istart_sel              <= 0;     
                        immu_sel                <= 0;                   
                   end
                   
                else if(instr_type[7] && PIM_load) //  V-Type Instructions --> y = A'B'C'E + A'B'C'D + B'CD'E'F'  
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 1;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 1;
                        src1_ld_sel             <= 1;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0;   
                        immu_sel                <= 0;                                         
                    end
                                
                else if(instr_type[3] && PIM_load) //  TEMP-Type Instructions 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 1;                        
                        tend_sel                <= 1;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0; 
                        immu_sel                <= 0;                    
                    end 
                      
                else if(instr_type[1] && PIM_load) //  CMASK-Type Instructions 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 1;                      
                        cstart_sel              <= 1; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0;
                        immu_sel                <= 0;                      
                    end 
                    
                else if(instr_type[2] && PIM_load) //  MASK-Type Instructions 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 1;                           
                        end_sel                 <= 1;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0;   
                        iend_sel                <= 0;                      
                        istart_sel              <= 0;  
                        immu_sel                <= 0;                 
                    end                     
                    
                else if(instr_type[6] && PIM_load) //  L/S_Type Instructions 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 1;                        
                        row_num_sel             <= 1;                         
                        crossbar_number_sel     <= 1;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0; 
                        immu_sel                <= 0;                     
                    end 
                    
                                        
                else if(instr_type[0] && PIM_load) //  INIT_Type Instructions 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 1;
                        src1_ld_sel             <= 1;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0;
                        immu_sel                <= 0;                      
                    end 
                    
           else if(instr_type[4] && PIM_load) //  LUI_Type Instructions 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0; 
                        immu_sel                <= 1;                     
                    end 
                    
                    
             else if(instr_type[5] && PIM_load) //  pim_ld type 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 1;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 1;                        
                        row_num_sel             <= 1;                         
                        crossbar_number_sel     <= 1;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        iend_sel                <= 0;                      
                        istart_sel              <= 0; 
                        immu_sel                <= 0;                     
                    end       
                                                            
                else 
                   begin
                        immediate_ld_sel        <= 0;
                        iw1_ld_sel              <= 0;
                        iw2_ld_sel              <= 0;
                        dest_ld_sel             <= 0;
                        src1_ld_sel             <= 0;
                        src2_ld_sel             <= 0;
                        tstart_sel              <= 0;                        
                        tend_sel                <= 0;                           
                        start_sel               <= 0;                           
                        end_sel                 <= 0;                          
                        col_num_sel             <= 0;                        
                        row_num_sel             <= 0;                         
                        crossbar_number_sel     <= 0;                           
                        cend_sel                <= 0;                      
                        cstart_sel              <= 0; 
                        immu_sel                <= 0;  
                   end                     
                  
        end
endmodule
