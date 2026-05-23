module trafficlight(input clk, input rst, output reg[2:0]LED_NS,LED_WE);
parameter s0=6'b000001,
s1=6'b000010,
s2=6'b000100,
s3=6'b001000,
s4=6'b010000,
s5=6'b100000;

reg [5:0] state;
reg [3:0] count;

always @(posedge clk or posedge rst)begin
if(rst)begin
state<=s0;
count<=0;
end
else
begin case(state)
s0:begin
if(count==4'd14) begin count<=0; state<=s1; end
else begin
count<=count+1; state<=s0; end end

s1:begin
if(count==4'd1) begin count<=0; state<=s2; end
else begin
count<= count+1; state<=s1; end end

s2:begin
if(count==4'd2) begin count<=0; state<=s3; end
else begin
count<= count+1; state<=s2; end end


s3:begin
if(count++4'd1) begin count<=0; state<=s4; end
else begin
count<= count+1; state<=s3; end end


s4:begin
if(count++4'd1) begin count<=0; state<=s5; end
else begin
count<= count+1; state<=s4; end end


s5:begin
if(count++4'd1) begin count<=0; state<=s0; end
else begin
count<= count+1; state<=s5; end end
endcase
end
end

always@(*)
begin case(state)
s0: begin LED_NS = 3'b001; LED_WE = 3'b100; end
s1: begin LED_NS = 3'b010; LED_WE = 3'b100; end
s2: begin LED_NS = 3'b100; LED_WE = 3'b100; end
s3: begin LED_NS = 3'b100; LED_WE = 3'b001; end
s4: begin LED_NS = 3'b100; LED_WE = 3'b010; end
s5: begin LED_NS = 3'b100; LED_WE = 3'b100; end

endcase
end 
endmodule



