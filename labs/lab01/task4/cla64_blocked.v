// cla64_blocked.v
// A practical 64-bit adder: sixteen 4-bit CLA blocks (your cla4.v),
// chained by feeding block k's carry-out into block (k+1)'s carry-in --
// the same instantiate-and-chain pattern as Task 2's ripple adder, just
// using 4-bit CLA blocks instead of single full adders.
//
// TODO: instantiate 16 cla4 blocks, named block0..block15, e.g.:
//   cla4 block0 (.a(a[3:0]),    .b(b[3:0]),    .cin(cin),  .sum(sum[3:0]),    .cout(c[1]));
//   cla4 block1 (.a(a[7:4]),    .b(b[7:4]),    .cin(c[1]), .sum(sum[7:4]),    .cout(c[2]));
//   ...
//   cla4 block15(.a(a[63:60]),  .b(b[63:60]),  .cin(c[15]),.sum(sum[63:60]),  .cout(cout));

// cla64_blocked.v
// 64-bit adder made from sixteen 4-bit CLA blocks

module cla64_blocked(

  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout

);

  // Carries between the 16 CLA blocks
  wire [15:1] c;


  // Block 0: bits 3:0
  cla4 block0 (
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(cin),
    .sum(sum[3:0]),
    .cout(c[1])
  );


  // Block 1: bits 7:4
  cla4 block1 (
    .a(a[7:4]),
    .b(b[7:4]),
    .cin(c[1]),
    .sum(sum[7:4]),
    .cout(c[2])
  );


  // Block 2: bits 11:8
  cla4 block2 (
    .a(a[11:8]),
    .b(b[11:8]),
    .cin(c[2]),
    .sum(sum[11:8]),
    .cout(c[3])
  );


  // Block 3: bits 15:12
  cla4 block3 (
    .a(a[15:12]),
    .b(b[15:12]),
    .cin(c[3]),
    .sum(sum[15:12]),
    .cout(c[4])
  );


  // Block 4: bits 19:16
  cla4 block4 (
    .a(a[19:16]),
    .b(b[19:16]),
    .cin(c[4]),
    .sum(sum[19:16]),
    .cout(c[5])
  );


  // Block 5: bits 23:20
  cla4 block5 (
    .a(a[23:20]),
    .b(b[23:20]),
    .cin(c[5]),
    .sum(sum[23:20]),
    .cout(c[6])
  );


  // Block 6: bits 27:24
  cla4 block6 (
    .a(a[27:24]),
    .b(b[27:24]),
    .cin(c[6]),
    .sum(sum[27:24]),
    .cout(c[7])
  );


  // Block 7: bits 31:28
  cla4 block7 (
    .a(a[31:28]),
    .b(b[31:28]),
    .cin(c[7]),
    .sum(sum[31:28]),
    .cout(c[8])
  );


  // Block 8: bits 35:32
  cla4 block8 (
    .a(a[35:32]),
    .b(b[35:32]),
    .cin(c[8]),
    .sum(sum[35:32]),
    .cout(c[9])
  );


  // Block 9: bits 39:36
  cla4 block9 (
    .a(a[39:36]),
    .b(b[39:36]),
    .cin(c[9]),
    .sum(sum[39:36]),
    .cout(c[10])
  );


  // Block 10: bits 43:40
  cla4 block10 (
    .a(a[43:40]),
    .b(b[43:40]),
    .cin(c[10]),
    .sum(sum[43:40]),
    .cout(c[11])
  );


  // Block 11: bits 47:44
  cla4 block11 (
    .a(a[47:44]),
    .b(b[47:44]),
    .cin(c[11]),
    .sum(sum[47:44]),
    .cout(c[12])
  );


  // Block 12: bits 51:48
  cla4 block12 (
    .a(a[51:48]),
    .b(b[51:48]),
    .cin(c[12]),
    .sum(sum[51:48]),
    .cout(c[13])
  );


  // Block 13: bits 55:52
  cla4 block13 (
    .a(a[55:52]),
    .b(b[55:52]),
    .cin(c[13]),
    .sum(sum[55:52]),
    .cout(c[14])
  );


  // Block 14: bits 59:56
  cla4 block14 (
    .a(a[59:56]),
    .b(b[59:56]),
    .cin(c[14]),
    .sum(sum[59:56]),
    .cout(c[15])
  );


  // Block 15: bits 63:60
  cla4 block15 (
    .a(a[63:60]),
    .b(b[63:60]),
    .cin(c[15]),
    .sum(sum[63:60]),
    .cout(cout)
  );

endmodule