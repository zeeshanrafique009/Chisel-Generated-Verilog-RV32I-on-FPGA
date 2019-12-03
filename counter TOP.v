module counter_TOP(input clock_in,input reset,output [6:0]segOut ,output clock);

wire o_clock;
wire [3:0]count;
  clock_wizard wiz2(
      .clock_in(clock_in),
      .clock(o_clock)      
    );
    
    up_counter(
    .clk(o_clock),
    .reset(reset),
    .counter(count)    
    );
    assign clock = o_clock;
    segment7 segment(
      .clock(o_clock),
      .bcd(count),
      .seg(segOut)
    );
    
    
 endmodule