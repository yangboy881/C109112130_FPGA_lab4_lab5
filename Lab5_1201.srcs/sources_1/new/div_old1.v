`timescale 1ns / 1ps

module div_old1(divclk_1,divclk_2,divclk_3,clk,rst); // divclk_2 約23一秒

output divclk_1,divclk_2,divclk_3; //divclk_2
input clk,rst;
reg [26:0] divclkcnt;

assign divclk_1  = divclkcnt[13]; //其他元件
assign divclk_2  = divclkcnt[21]; //FSM按鈕
assign divclk_3  = divclkcnt[23]; //移位暫存


always@(posedge clk or negedge rst)begin
    if(~rst)
        divclkcnt = 0;
    else
        divclkcnt = divclkcnt + 1;
end



endmodule

