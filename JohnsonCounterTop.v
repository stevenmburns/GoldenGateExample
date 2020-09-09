module JohnsonCounter(
  input        clock,
  input        reset,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] state; // @[i.scala 11:22]
  wire [8:0] _T_2 = {state, 1'h0}; // @[i.scala 17:19]
  wire  _T_4 = ~state[7]; // @[i.scala 17:27]
  wire [8:0] _GEN_1 = {{8'd0}, _T_4}; // @[i.scala 17:25]
  wire [8:0] _T_5 = _T_2 | _GEN_1; // @[i.scala 17:25]
  assign io_out = state; // @[i.scala 19:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 8'h0;
    end else begin
      state <= _T_5[7:0];
    end
  end
endmodule
module JohnsonCounterMonitor(
  input        clock,
  input        reset,
  input  [7:0] io_inp
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] state; // @[i.scala 27:22]
  wire [3:0] _T_1 = state + 4'h1; // @[i.scala 29:18]
  wire  _T_3 = ~reset; // @[i.scala 31:9]
  wire  _T_4 = state == 4'h0; // @[i.scala 33:16]
  wire  _T_5 = io_inp == 8'h0; // @[i.scala 34:20]
  wire  _GEN_0 = _T_4 & _T_5; // @[i.scala 35:15]
  wire  _GEN_1 = ~_T_5; // @[i.scala 37:15]
  wire  _GEN_2 = _T_4 & _GEN_1; // @[i.scala 37:15]
  wire  _GEN_3 = ~_T_4; // @[i.scala 40:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 4'h0;
    end else begin
      state <= _T_1;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3) begin
          $fwrite(32'h80000002,"inp: %b state: %b",io_inp,state); // @[i.scala 31:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_0 & _T_3) begin
          $fwrite(32'h80000002," Correct\n"); // @[i.scala 35:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_2 & _T_3) begin
          $fwrite(32'h80000002," Incorrect\n"); // @[i.scala 37:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_3 & _T_3) begin
          $fwrite(32'h80000002,"\n"); // @[i.scala 40:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module JohnsonCounterTop(
  input   clock,
  input   reset
);
  wire  dut_clock; // @[i.scala 50:19]
  wire  dut_reset; // @[i.scala 50:19]
  wire [7:0] dut_io_out; // @[i.scala 50:19]
  wire  mon_clock; // @[i.scala 51:19]
  wire  mon_reset; // @[i.scala 51:19]
  wire [7:0] mon_io_inp; // @[i.scala 51:19]
  JohnsonCounter dut ( // @[i.scala 50:19]
    .clock(dut_clock),
    .reset(dut_reset),
    .io_out(dut_io_out)
  );
  JohnsonCounterMonitor mon ( // @[i.scala 51:19]
    .clock(mon_clock),
    .reset(mon_reset),
    .io_inp(mon_io_inp)
  );
  assign dut_clock = clock;
  assign dut_reset = reset;
  assign mon_clock = clock;
  assign mon_reset = reset;
  assign mon_io_inp = dut_io_out; // @[i.scala 53:14]
endmodule
