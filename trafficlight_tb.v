
module trafficlight_tb();
reg rst,clk;
wire[2:0] LED_NS,LED_WE;
trafficlight L(clk,rst,LED_NS,LED_WE);
initial begin
clk=1;
forever #5 clk=~clk;
end
initial begin
rst=1;
#10 rst=0; #10
rst=1;#10
rst=0;
#500 $finish;
end
endmodule
