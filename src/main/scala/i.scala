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
