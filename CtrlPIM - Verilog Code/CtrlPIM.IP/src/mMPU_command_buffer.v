module mMPU_command_buffer #(parameter dest_size = 10, src_size = 10, xb_size = 16)(
    input clk,
    input [1:0] mem_op,
    input [(dest_size-1):0] dest_addr,
    input [(src_size-1):0] src1_addr,
    input [(src_size-1):0] src2_addr,
    input [(src_size -1):0] start,
    input [(src_size -1):0] end,
    input [(xb_size -1):0] cstart,
    input [(xb_size -1):0] cend,
    output reg [33:0] mMPU_command,
    input col
    );
    
    reg cstart_current;
    reg cend_current;
    reg start_current;
    reg end_current;

    always @(posedge clk)
    begin
        if (cstart != cstart_current || cend != cend_current)
        begin
            mMPU_command <= {cstart,cend,2'b11};
            cstart_current <= cstart;
            cend_current <= cend; 
        end
        else if (start != start_current || end != end_current)
        begin
            mMPU_command <= {12'b0,start,end,2'b10};
            start_current <= start;
            end_current <= end; 
        end
        else
        begin
            if (mem_op = 2'b00)
                mMPU_command <= {col,9'b0,2'b00,src2_addr,src1_addr,2'b01};
            else if (mem_op = 2'b01)
                mMPU_command <= {col,1'b0,dest_addr,src2_addr,src1_addr,2'b00};
            else if (mem_op = 2'b10)
                mMPU_command <= {col,9'b0,2'b01,src2_addr,src1_addr,2'b01};
            else if (mem_op = 2'b11)
                mMPU_command <= {col,9'b0,2'b10,src2_addr,src1_addr,2'b01};
        end
    end

endmodule



