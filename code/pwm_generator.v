// EcoMender Bot : Task 1A : PWM Generator
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a module which will scale down the 100KHz Clock Frequency to 500Hz and perform Pulse Width Modulation on it.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//PWM Generator
//Inputs : clk_1MHz, pulse_width
//Output : clk_500Hz, pwm_signal

module pwm_generator(
    input clk_1MHz,
    input [3:0] pulse_width,  
    output reg clk_500Hz,pwm_signal     
);

initial begin
    clk_500Hz = 1;
    pwm_signal = 1;
end

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

reg[9:0] clk_counter = 10'b1111111111;  
reg[10:0] pwm_counter=11'b0;

always @(posedge clk_1MHz) begin
    if (clk_counter == 10'b1111100111) begin  
        clk_500Hz <= ~clk_500Hz;  
        clk_counter <= 10'b0;     
    end else begin
        clk_counter <= clk_counter + 10'b1;  
    end



    if (pwm_counter < pulse_width*100) begin
        pwm_signal <=1;  
    end else begin
        pwm_signal <= 0;  
    end
    
    if (pwm_counter == 11'b11111001111) begin  
        pwm_counter <=11'b0;
    end else begin
        pwm_counter <= pwm_counter +11'b1;
    end
end

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule
