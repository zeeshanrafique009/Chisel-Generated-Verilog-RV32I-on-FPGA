module segmentTop(
    input clock,
    input reset,
    input [31:0] fibo,
    output led1a,led1b,led1c,led1d,led1e,led1f,led1g,
           led2a,led2b,led2c,led2d,led2e,led2f,led2g,
           led3a,led3b,led3c,led3d,led3e,led3f,led3g
    );
    
    wire [3:0]bcd0;
    wire [3:0]bcd1;
    wire [3:0]bcd2;
    
    segment7 seg0(
        .clock(clock),
        .reset(reset),
        .fibonacci(bcd0),
        .leda(led1a),
        .ledb(led1b),
        .ledc(led1c),
        .ledd(led1d),
        .lede(led1e),
        .ledf(led1f),
        .ledg(led1g)
     );
     
     segment7 seg1(
        .clock(clock),
        .reset(reset),
        .fibonacci(bcd1),
        .leda(led2a),
        .ledb(led2b),
        .ledc(led2c),
        .ledd(led2d),
        .lede(led2e),
        .ledf(led2f),
        .ledg(led2g)    
      );
     segment7 seg2(
        .clock(clock),
        .reset(reset),
        .fibonacci(bcd2),
        .leda(led3a),
        .ledb(led3b),
        .ledc(led3c),
        .ledd(led3d),
        .lede(led3e),
        .ledf(led3f),
        .ledg(led3g)   
      );

     assign bcd0 = fibo[3:0];
     assign bcd1 = fibo[7:4];
     assign bcd2 = fibo[11:8];
         
endmodule
