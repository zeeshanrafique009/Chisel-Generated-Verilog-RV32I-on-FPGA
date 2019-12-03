module Top(
  input         clock_in,
  input         reset,
  output led1a,led1b,led1c,led1d,led1e,led1f,led1g,
         led2a,led2b,led2c,led2d,led2e,led2f,led2g,
         led3a,led3b,led3c,led3d,led3e,led3f,led3g,
  output c_clock
);
  wire [31:0] io_reg;
  wire [31:0]test;
  wire clock;
  assign c_clock=clock;
  wire  i_mem_clock; // @[Top.scala 10:25]
  wire [9:0] i_mem_io_address; // @[Top.scala 10:25]
  wire [31:0] i_mem_io_instruction; // @[Top.scala 10:25]
  wire  d_mem_clock; // @[Top.scala 11:25]
  wire [9:0] d_mem_io_address; // @[Top.scala 11:25]
  wire [31:0] d_mem_io_dataIn; // @[Top.scala 11:25]
  wire  d_mem_io_readEn; // @[Top.scala 11:25]
  wire  d_mem_io_writeEn; // @[Top.scala 11:25]
  wire [31:0] d_mem_io_dataOut; // @[Top.scala 11:25]
  wire [4:0] control_io_opcode; // @[Top.scala 12:25]
  wire  control_io_regWrite; // @[Top.scala 12:25]
  wire  control_io_memtoReg; // @[Top.scala 12:25]
  wire  control_io_memRead; // @[Top.scala 12:25]
  wire  control_io_memWrite; // @[Top.scala 12:25]
  wire  control_io_branch; // @[Top.scala 12:25]
  wire [1:0] control_io_oprndAsel; // @[Top.scala 12:25]
  wire  control_io_oprndBsel; // @[Top.scala 12:25]
  wire [1:0] control_io_immSel; // @[Top.scala 12:25]
  wire [1:0] control_io_nextPCsel; // @[Top.scala 12:25]
  wire [2:0] control_io_aluOP; // @[Top.scala 12:25]
  wire [31:0] immGen_io_pc; // @[Top.scala 13:25]
  wire [31:0] immGen_io_instruction; // @[Top.scala 13:25]
  wire [31:0] immGen_io_iImm_out; // @[Top.scala 13:25]
  wire [31:0] immGen_io_uImm_out; // @[Top.scala 13:25]
  wire [31:0] immGen_io_sImm_out; // @[Top.scala 13:25]
  wire [31:0] immGen_io_sbImm_out; // @[Top.scala 13:25]
  wire [31:0] immGen_io_ujImm_out; // @[Top.scala 13:25]
  wire [31:0] alu_io_oprndA; // @[Top.scala 14:25]
  wire [31:0] alu_io_oprndB; // @[Top.scala 14:25]
  wire [4:0] alu_io_aluControl; // @[Top.scala 14:25]
  wire  alu_io_branch; // @[Top.scala 14:25]
  wire [31:0] alu_io_aluOUT; // @[Top.scala 14:25]
  wire [2:0] aluCntrl_io_aluOP; // @[Top.scala 15:25]
  wire [2:0] aluCntrl_io_fun_3; // @[Top.scala 15:25]
  wire  aluCntrl_io_fun_7; // @[Top.scala 15:25]
  wire [4:0] aluCntrl_io_aluControl; // @[Top.scala 15:25]
  wire  regfile_clock; // @[Top.scala 16:25]
  wire  regfile_reset; // @[Top.scala 16:25]
  wire  regfile_io_regWrite; // @[Top.scala 16:25]
  wire [4:0] regfile_io_rs1_s; // @[Top.scala 16:25]
  wire [4:0] regfile_io_rs2_s; // @[Top.scala 16:25]
  wire [4:0] regfile_io_rd; // @[Top.scala 16:25]
  wire [31:0] regfile_io_writeData; // @[Top.scala 16:25]
  wire [31:0] regfile_io_rs1; // @[Top.scala 16:25]
  wire [31:0] regfile_io_rs2; // @[Top.scala 16:25]
  wire [31:0] regfile_io_regout; // @[Top.scala 16:25]
  wire [31:0] jalr_io_a; // @[Top.scala 17:25]
  wire [31:0] jalr_io_b; // @[Top.scala 17:25]
  wire [31:0] jalr_io_out; // @[Top.scala 17:25]
  wire  pc_clock; // @[Top.scala 18:25]
  wire  pc_reset; // @[Top.scala 18:25]
  wire [31:0] pc_io_in; // @[Top.scala 18:25]
  wire [31:0] pc_io_out; // @[Top.scala 18:25]
  wire [29:0] _T; // @[Top.scala 22:35]
  wire  _T_7; // @[Top.scala 47:31]
  wire  _T_8; // @[Top.scala 50:37]
  wire [31:0] _T_9; // @[Top.scala 51:38]
  wire  _T_10; // @[Top.scala 53:37]
  wire [31:0] _GEN_0; // @[Top.scala 53:49]
  wire [31:0] _GEN_1; // @[Top.scala 50:49]
  wire  _T_12; // @[Top.scala 61:30]
  wire  _T_13; // @[Top.scala 63:28]
  wire  _T_14; // @[Top.scala 66:34]
  wire [31:0] _T_15; // @[Top.scala 67:46]
  wire  _T_16; // @[Top.scala 69:34]
  wire [31:0] _GEN_3; // @[Top.scala 69:46]
  wire [31:0] _GEN_4; // @[Top.scala 66:46]
  wire [31:0] _GEN_5; // @[Top.scala 63:40]
  wire  _T_18; // @[Top.scala 88:29]
  wire  _T_19; // @[Top.scala 96:24]
  wire  _T_20; // @[Top.scala 96:55]
  wire  _T_21; // @[Top.scala 96:34]
  wire  _T_22; // @[Top.scala 96:90]
  wire  _T_23; // @[Top.scala 96:66]
  wire  _T_24; // @[Top.scala 99:36]
  wire  _T_25; // @[Top.scala 102:36]
  wire [31:0] _T_27; // @[Top.scala 106:31]
  wire [31:0] _GEN_8; // @[Top.scala 102:48]
  wire [31:0] _GEN_9; // @[Top.scala 99:48]
  
//   for testing purpose, output test
//  reg [15:0]a=16'h0005;  //5
//  reg [15:0]b=16'hffff;   //-1
//  reg [15:0]t;
////  wire [15:0]test;
//   always @ (posedge clock)begin
////     if (control_io_opcode == 5'b11011)begin
////          test <= pc_io_out;
////     end
//    t<=a+b;
//  end
//  assign test=32'd0;  //d17476;

 segmentTop seg4(
      .clock(clock),      //  1,2,3,5,8,d,15,22,37,59,90,E9,179,262,3dB,63d
      .reset(reset),
      .fibo(io_reg),
      .led1a(led1a),
      .led1b(led1b),
      .led1c(led1c),
      .led1d(led1d),
      .led1e(led1e),
      .led1f(led1f),
      .led1g(led1g),
      
      .led2a(led2a),
      .led2b(led2b),
      .led2c(led2c),
      .led2d(led2d),
      .led2e(led2e),
      .led2f(led2f),
      .led2g(led2g),
      
      .led3a(led3a),
      .led3b(led3b),
      .led3c(led3c),
      .led3d(led3d),
      .led3e(led3e),
      .led3f(led3f),
      .led3g(led3g)   
   );
 
  clock_wizard wiz1(
      .clock_in(clock_in),
      .clock(clock)      
    );
   sram i_mem (
      .clock(clock),
      .i_write(1'b0),
      .i_data(32'd0),
      .address(i_mem_io_address),
      .readData(i_mem_io_instruction)
    );
   DataMem d_mem ( // @[Top.scala 11:25]
    .clock(clock),
    .address(d_mem_io_address),
    .writeData(d_mem_io_dataIn),
    .readEnable(d_mem_io_readEn),
    .writeEnable(d_mem_io_writeEn),
    .readData(d_mem_io_dataOut)   
  );

  Control control ( // @[Top.scala 12:25]
    .io_opcode(control_io_opcode),
    .io_regWrite(control_io_regWrite),
    .io_memtoReg(control_io_memtoReg),
    .io_memRead(control_io_memRead),
    .io_memWrite(control_io_memWrite),
    .io_branch(control_io_branch),
    .io_oprndAsel(control_io_oprndAsel),
    .io_oprndBsel(control_io_oprndBsel),
    .io_immSel(control_io_immSel),
    .io_nextPCsel(control_io_nextPCsel),
    .io_aluOP(control_io_aluOP)
  );
  ImmGen immGen ( // @[Top.scala 13:25]
    .io_pc(immGen_io_pc),
    .io_instruction(immGen_io_instruction),
    .io_iImm_out(immGen_io_iImm_out),
    .io_uImm_out(immGen_io_uImm_out),
    .io_sImm_out(immGen_io_sImm_out),
    .io_sbImm_out(immGen_io_sbImm_out),
    .io_ujImm_out(immGen_io_ujImm_out)
  );
  ALU alu ( // @[Top.scala 14:25]
    .io_oprndA(alu_io_oprndA),
    .io_oprndB(alu_io_oprndB),
    .io_aluControl(alu_io_aluControl),
    .io_branch(alu_io_branch),
    .io_aluOUT(alu_io_aluOUT)
  );
  ALUcontrol aluCntrl ( // @[Top.scala 15:25]
    .io_aluOP(aluCntrl_io_aluOP),
    .io_fun_3(aluCntrl_io_fun_3),
    .io_fun_7(aluCntrl_io_fun_7),
    .io_aluControl(aluCntrl_io_aluControl)
  );
  Regfile regfile ( // @[Top.scala 16:25]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_regWrite(regfile_io_regWrite),
    .io_rs1_s(regfile_io_rs1_s),
    .io_rs2_s(regfile_io_rs2_s),
    .io_rd(regfile_io_rd),
    .io_writeData(regfile_io_writeData),
    .io_rs1(regfile_io_rs1),
    .io_rs2(regfile_io_rs2),
    .io_regout(regfile_io_regout)
  );
  Jalr jalr ( // @[Top.scala 17:25]
    .io_a(jalr_io_a),
    .io_b(jalr_io_b),
    .io_out(jalr_io_out)
  );
  PC pc ( // @[Top.scala 18:25]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_in(pc_io_in),
    .io_out(pc_io_out)
  );
  assign _T = pc_io_out[31:2]; // @[Top.scala 22:35]
  assign _T_7 = control_io_oprndAsel == 2'h0; // @[Top.scala 47:31]
  assign _T_8 = control_io_oprndAsel == 2'h1; // @[Top.scala 50:37]
  assign _T_9 = $signed(pc_io_out); // @[Top.scala 51:38]
  assign _T_10 = control_io_oprndAsel == 2'h2; // @[Top.scala 53:37]
  assign _GEN_0 = _T_10 ? $signed(_T_9) : $signed(regfile_io_rs1); // @[Top.scala 53:49]
  assign _GEN_1 = _T_8 ? $signed(_T_9) : $signed(_GEN_0); // @[Top.scala 50:49]
  assign _T_12 = control_io_oprndBsel; // @[Top.scala 61:30]
  assign _T_13 = control_io_immSel == 2'h0; // @[Top.scala 63:28]
  assign _T_14 = control_io_immSel == 2'h1; // @[Top.scala 66:34]
  assign _T_15 = $signed(immGen_io_sImm_out); // @[Top.scala 67:46]
  assign _T_16 = control_io_immSel == 2'h2; // @[Top.scala 69:34]
  assign _GEN_3 = _T_16 ? $signed(immGen_io_uImm_out) : $signed(32'sh0); // @[Top.scala 69:46]
  assign _GEN_4 = _T_14 ? $signed(_T_15) : $signed(_GEN_3); // @[Top.scala 66:46]
  assign _GEN_5 = _T_13 ? $signed(immGen_io_iImm_out) : $signed(_GEN_4); // @[Top.scala 63:40]
  assign _T_18 = control_io_memtoReg; // @[Top.scala 88:29]
  assign _T_19 = alu_io_branch; // @[Top.scala 96:24]
  assign _T_20 = control_io_branch; // @[Top.scala 96:55]
  assign _T_21 = _T_19 & _T_20; // @[Top.scala 96:34]
  assign _T_22 = control_io_nextPCsel == 2'h1; // @[Top.scala 96:90]
  assign _T_23 = _T_21 & _T_22; // @[Top.scala 96:66]
  assign _T_24 = control_io_nextPCsel == 2'h2; // @[Top.scala 99:36]
  assign _T_25 = control_io_nextPCsel == 2'h3; // @[Top.scala 102:36]
  assign _T_27 = pc_io_out + 32'h4; // @[Top.scala 106:31]
  assign _GEN_8 = _T_25 ? jalr_io_out : _T_27; // @[Top.scala 102:48]
  assign _GEN_9 = _T_24 ? immGen_io_ujImm_out : _GEN_8; // @[Top.scala 99:48]
  assign io_reg = regfile_io_regout; // @[Top.scala 116:15]
  assign i_mem_clock = clock;
  assign i_mem_io_address = _T[9:0]; // @[Top.scala 22:22]
  assign d_mem_clock = clock;
  assign d_mem_io_address = alu_io_aluOUT[11:2]; // @[Top.scala 85:22]
  assign d_mem_io_dataIn = regfile_io_rs2; // @[Top.scala 84:22]
  assign d_mem_io_readEn = control_io_memRead; // @[Top.scala 83:22]
  assign d_mem_io_writeEn = control_io_memWrite; // @[Top.scala 82:22]
  assign control_io_opcode = i_mem_io_instruction[6:2]; // @[Top.scala 26:23]
  assign immGen_io_pc = pc_io_out; // @[Top.scala 30:19]
  assign immGen_io_instruction = i_mem_io_instruction; // @[Top.scala 29:27]
  assign alu_io_oprndA = _T_7 ? $signed(regfile_io_rs1) : $signed(_GEN_1); // @[Top.scala 48:23 Top.scala 51:23 Top.scala 54:23 Top.scala 57:23]
  assign alu_io_oprndB = _T_12 ? $signed(_GEN_5) : $signed(regfile_io_rs2); // @[Top.scala 64:22 Top.scala 67:22 Top.scala 70:22 Top.scala 73:23 Top.scala 76:22]
  assign alu_io_aluControl = aluCntrl_io_aluControl; // @[Top.scala 44:23]
  assign aluCntrl_io_aluOP = control_io_aluOP; // @[Top.scala 41:23]
  assign aluCntrl_io_fun_3 = i_mem_io_instruction[14:12]; // @[Top.scala 39:23]
  assign aluCntrl_io_fun_7 = i_mem_io_instruction[30]; // @[Top.scala 40:23]
  assign regfile_clock = clock;
  assign regfile_reset = reset;
  assign regfile_io_regWrite = control_io_regWrite; // @[Top.scala 36:25]
  assign regfile_io_rs1_s = i_mem_io_instruction[19:15]; // @[Top.scala 33:22]
  assign regfile_io_rs2_s = i_mem_io_instruction[24:20]; // @[Top.scala 34:22]
  assign regfile_io_rd = i_mem_io_instruction[11:7]; // @[Top.scala 35:22]
  assign regfile_io_writeData = _T_18 ? $signed(d_mem_io_dataOut) : $signed(alu_io_aluOUT); // @[Top.scala 89:29 Top.scala 92:29]
  assign jalr_io_a = regfile_io_rs1; // @[Top.scala 111:14]
  assign jalr_io_b = immGen_io_iImm_out; // @[Top.scala 112:14]
  assign pc_clock = clock;
  assign pc_reset = reset;
  assign pc_io_in = _T_23 ? immGen_io_sbImm_out : _GEN_9; // @[Top.scala 97:18 Top.scala 100:18 Top.scala 103:18 Top.scala 106:18]
endmodule