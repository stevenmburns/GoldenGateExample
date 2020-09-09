package counters

import chisel3._
import chisel3.util._

class JohnsonCounter extends Module {
  val io = IO(new Bundle {
     val out = Output(UInt(8.W))
  })

  val state = RegInit( 0.U(8.W))

  val cin = WireInit( init=false.B)
  when ( (state&((1<<7).U)) === 0.U) {
    cin := true.B
  }
  state := (state << 1) | ~state(7)

  io.out := state
}

class JohnsonCounterMonitor extends Module {
  val io = IO(new Bundle {
     val inp = Input(UInt(8.W))
  })

  val state = RegInit( 0.U(4.W))

  state := state +% 1.U

  printf( "inp: %b state: %b", io.inp, state)

  when ( state === 0.U) {
     when ( io.inp === 0.U) {
        printf( " Correct\n")
     } .otherwise {
        printf( " Incorrect\n")
     }
  } .otherwise {
     printf( "\n")
  }


}

class JohnsonCounterTop extends Module {
  val io = IO(new Bundle {
  })
        
  val dut = Module(new JohnsonCounter)
  val mon = Module(new JohnsonCounterMonitor)

  mon.io.inp := dut.io.out
}
