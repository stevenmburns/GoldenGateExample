;buildInfoPackage: chisel3, version: 3.3.2, scalaVersion: 2.11.12, sbtVersion: 1.3.10
circuit JohnsonCounterTop : 
  module JohnsonCounter : 
    input clock : Clock
    input reset : Reset
    output io : {out : UInt<8>}
    
    reg state : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[i.scala 11:22]
    wire cin : UInt<1>
    cin <= UInt<1>("h00")
    node _T = and(state, UInt<8>("h080")) @[i.scala 14:16]
    node _T_1 = eq(_T, UInt<1>("h00")) @[i.scala 14:29]
    when _T_1 : @[i.scala 14:38]
      cin <= UInt<1>("h01") @[i.scala 15:9]
      skip @[i.scala 14:38]
    node _T_2 = shl(state, 1) @[i.scala 17:19]
    node _T_3 = bits(state, 7, 7) @[i.scala 17:33]
    node _T_4 = not(_T_3) @[i.scala 17:27]
    node _T_5 = or(_T_2, _T_4) @[i.scala 17:25]
    state <= _T_5 @[i.scala 17:9]
    io.out <= state @[i.scala 19:10]
    
  module JohnsonCounterMonitor : 
    input clock : Clock
    input reset : Reset
    output io : {flip inp : UInt<8>}
    
    reg state : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[i.scala 27:22]
    node _T = add(state, UInt<1>("h01")) @[i.scala 29:18]
    node _T_1 = tail(_T, 1) @[i.scala 29:18]
    state <= _T_1 @[i.scala 29:9]
    node _T_2 = asUInt(reset) @[i.scala 31:9]
    node _T_3 = eq(_T_2, UInt<1>("h00")) @[i.scala 31:9]
    when _T_3 : @[i.scala 31:9]
      printf(clock, UInt<1>(1), "inp: %b state: %b", io.inp, state) @[i.scala 31:9]
      skip @[i.scala 31:9]
    node _T_4 = eq(state, UInt<1>("h00")) @[i.scala 33:16]
    when _T_4 : @[i.scala 33:25]
      node _T_5 = eq(io.inp, UInt<1>("h00")) @[i.scala 34:20]
      when _T_5 : @[i.scala 34:29]
        node _T_6 = asUInt(reset) @[i.scala 35:15]
        node _T_7 = eq(_T_6, UInt<1>("h00")) @[i.scala 35:15]
        when _T_7 : @[i.scala 35:15]
          printf(clock, UInt<1>(1), " Correct\n") @[i.scala 35:15]
          skip @[i.scala 35:15]
        skip @[i.scala 34:29]
      else : @[i.scala 36:19]
        node _T_8 = asUInt(reset) @[i.scala 37:15]
        node _T_9 = eq(_T_8, UInt<1>("h00")) @[i.scala 37:15]
        when _T_9 : @[i.scala 37:15]
          printf(clock, UInt<1>(1), " Incorrect\n") @[i.scala 37:15]
          skip @[i.scala 37:15]
        skip @[i.scala 36:19]
      skip @[i.scala 33:25]
    else : @[i.scala 39:16]
      node _T_10 = asUInt(reset) @[i.scala 40:12]
      node _T_11 = eq(_T_10, UInt<1>("h00")) @[i.scala 40:12]
      when _T_11 : @[i.scala 40:12]
        printf(clock, UInt<1>(1), "\n") @[i.scala 40:12]
        skip @[i.scala 40:12]
      skip @[i.scala 39:16]
    
  module JohnsonCounterTop : 
    input clock : Clock
    input reset : UInt<1>
    output io : {}
    
    inst dut of JohnsonCounter @[i.scala 50:19]
    dut.clock <= clock
    dut.reset <= reset
    inst mon of JohnsonCounterMonitor @[i.scala 51:19]
    mon.clock <= clock
    mon.reset <= reset
    mon.io.inp <= dut.io.out @[i.scala 53:14]
    
