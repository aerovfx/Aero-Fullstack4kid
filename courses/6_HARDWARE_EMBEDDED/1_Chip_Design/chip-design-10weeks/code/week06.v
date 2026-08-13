// Tuần 6: ISA. Mạch tổ hợp nhỏ có testbench.
module week06(input wire [7:0] a, input wire [7:0] b, input wire select, output wire [7:0] y);
  assign y = select ? (a + b) : (a & b);
endmodule
module week06_tb;
  reg [7:0] a, b; reg select; wire [7:0] y;
  week06 dut(.a(a), .b(b), .select(select), .y(y));
  initial begin
    a=8'h0F; b=8'h01; select=0; #1;
    if (y !== 8'h01) $fatal(1, "AND failed");
    select=1; #1;
    if (y !== 8'h10) $fatal(1, "ADD failed");
    $display("week06 PASS"); $finish;
  end
endmodule
