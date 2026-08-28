// cla64_flat.v
// A flat, unblocked 64-bit carry-lookahead adder: every carry is computed
// directly (two-level, no rippling), exactly like cla4.v, just scaled to
// 64 bits. Add delays throughout (same convention as cla4.v) so it can be
// fairly compared against rca64.v and cla64_blocked.v.

module cla64_flat(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [63:0] p, g;
  wire [64:1] c;   // c[1]..c[64] are the 64 carries

  // ---------------------------------------------------------------------
  // Step 1: generate/propagate signals
  // ---------------------------------------------------------------------

  genvar i;

  generate
    for (i = 0; i < 64; i = i + 1) begin : gen_pg

      xor #(2) (p[i], a[i], b[i]);
      and #(2) (g[i], a[i], b[i]);

    end
  endgenerate


  // ---------------------------------------------------------------------
  // Step 2: direct carry equations
  // ---------------------------------------------------------------------

  genvar k, j;

  generate

    for (k = 1; k <= 64; k = k + 1) begin : gen_carries

      wire [k:0] terms;

      // Term containing cin:
      // p[k-1] & p[k-2] & ... & p[0] & cin
      assign #(2) terms[0] = (&p[k-1:0]) & cin;


      // Terms containing g[j]:
      // g[j] & p[k-1] & ... & p[j+1]
      for (j = 0; j < k - 1; j = j + 1) begin : gen_g_terms

        assign #(2) terms[j+1] =
          g[j] & (&p[k-1:j+1]);

      end


      // Direct generate term
      assign #(2) terms[k] = g[k-1];


      // OR all carry terms
      assign #(2) c[k] = |terms;

    end

  endgenerate


  // Final carry
  assign #(2) cout = c[64];


  // ---------------------------------------------------------------------
  // Step 3: sum bits
  // ---------------------------------------------------------------------

  assign #(2) sum = p ^ {c[63:1], cin};

endmodule