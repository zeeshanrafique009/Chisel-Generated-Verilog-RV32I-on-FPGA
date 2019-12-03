module segment7(
     clock,
     reset,
     fibonacci,
     leda,ledb,ledc,ledd,lede,ledf,ledg
    );
     input clock;
     input reset;
     input [3:0] fibonacci;
     output leda;
     output ledb;
     output ledc;
     output ledd;
     output lede;
     output ledf;
     output ledg;
     
     reg [6:0] seg_data;
     reg [3:0] bcd;
     
     always@(posedge clock )begin
       bcd <= fibonacci;
       if (reset==1)    bcd<=4'b0000;
     end
    
    always @(bcd)
     case (bcd)
     4'b0000:seg_data=7'b0000001; //b0000001
     4'b0001:seg_data=7'b1001111; //b1001111
     4'b0010:seg_data=7'b0010010; //b0010010
     4'b0011:seg_data=7'b0000110; //b0000110
     4'b0100:seg_data=7'b1001100; //b1001100
     4'b0101:seg_data=7'b0100100; //b0100100
     4'b0110:seg_data=7'b0100000; //b0100000
     4'b0111:seg_data=7'b0001111; //b0001111
     4'b1000:seg_data=7'b0000000; //b0000000
     4'b1001:seg_data=7'b0000100; //b0000100
     4'b1010:seg_data=7'b0001000;
     4'b1011:seg_data=7'b1100000;
     4'b1100:seg_data=7'b0110001;
     4'b1101:seg_data=7'b1000010;
     4'b1110:seg_data=7'b0110000;
     4'b1111:seg_data=7'b0111000;
     endcase
      
     assign leda=seg_data[6];
     assign ledb=seg_data[5];
     assign ledc=seg_data[4];
     assign ledd=seg_data[3];
     assign lede=seg_data[2];
     assign ledf=seg_data[1];
     assign ledg=seg_data[0];
     
endmodule
