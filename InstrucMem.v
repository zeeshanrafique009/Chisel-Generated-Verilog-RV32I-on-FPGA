module sram #(parameter ADDR_WIDTH = 10, DATA_WIDTH = 32, DEPTH = 1024) (
    input wire clock,
    input wire [ADDR_WIDTH-1:0] address, 
    input wire i_write,
    input wire [DATA_WIDTH-1:0] i_data,
    output reg [DATA_WIDTH-1:0] readData 
    );
    
    reg [DATA_WIDTH-1:0] memory_array [0:DEPTH-1];

    initial begin
    
//    memory_array[0]  = 32'h00200113;
//    memory_array[1]  = 32'h402403B3;
//    memory_array[2]  = 32'h402403B3;
//    memory_array[3]  = 32'h00702023;
//    memory_array[4]  = 32'h00000013;
//    memory_array[5]  = 32'h00002F83;  

       
//Fibonacci Series
 memory_array[0]  = 32'h01100F13;
 memory_array[1]  = 32'h00000E33;
 memory_array[2]  = 32'h000003B3;
 memory_array[3]  = 32'h00000333;
 memory_array[4]  = 32'h00100313;
 memory_array[5]  = 32'h000382B3;
 memory_array[6]  = 32'h001E0E13;
 memory_array[7]  = 32'h006283B3;
 memory_array[8]  = 32'hFFCF02E3;    
 memory_array[9]  = 32'h001E7E93;   // main instruction
 memory_array[10] = 32'hFE0E86E3;
 memory_array[11] = 32'h00038333;
 memory_array[12] = 32'hFE9FF0EF;
    end    
    
    always @ (posedge clock)
    begin
        if(i_write) begin
            memory_array[address] <= i_data;
        end
     end
    always @ (*)   
    begin
            readData = memory_array[address];
    end     
endmodule