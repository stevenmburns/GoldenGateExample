package counters

import org.scalatest.{ Matchers, FlatSpec, GivenWhenThen}
import org.scalatest.prop.Checkers

import chisel3._
import chisel3.util._
import chisel3.iotesters._

class JohnsonCounterTester( tag: String, factory: () => JohnsonCounter) extends GenericTest {
  behavior of s"$tag"
  it should "compile and execute without expect violations" in {
    check(chisel3.iotesters.Driver.execute( factory, optionsManager) { c =>
       new PeekPokeTester(c) {
         expect( c.io.out, 0)
         step(1)
         expect( c.io.out, 1)
         step(1)
         expect( c.io.out, 3)
         step(1)
         expect( c.io.out, 7)
         step(1)
         expect( c.io.out, 15)
         step(1)
         expect( c.io.out, 31)
         step(1)
         expect( c.io.out, 63)
         step(1)
         expect( c.io.out, 127)
         step(1)
         expect( c.io.out, 255)
         step(1)
         expect( c.io.out, 254)
         step(1)
         expect( c.io.out, 252)
         step(1)
         expect( c.io.out, 248)
         step(1)
         expect( c.io.out, 240)
         step(1)
         expect( c.io.out, 224)
         step(1)
         expect( c.io.out, 192)
         step(1)
         expect( c.io.out, 128)
         step(1)
         expect( c.io.out, 0)
       }
    })
  }
}

class JohnsonCounterTest extends JohnsonCounterTester( "JohnsonCounter", () => new JohnsonCounter)
