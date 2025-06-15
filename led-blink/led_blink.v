module led_blink(
    input i_clock, 
    input i_enable, 
    input i_switch_1, 
    input i_switch_2, 
    output o_led_drive
    );

    parameter c_CNT_100Hz = 125;
    parameter c_CNT_50Hz  = 250;
    parameter c_CNT_10Hz  = 1250;
    parameter c_CNT_1Hz   = 12500;

    reg [31 : 0] r_CNT_100Hz = 0;
    reg [31 : 0] r_CNT_50Hz = 0;
    reg [31 : 0] r_CNT_10Hz = 0;
    reg [31 : 0] r_CNT_1Hz = 0;

    reg r_TOGGLE_100Hz = 1'b0;
    reg r_TOGGLE_50Hz = 1'b0;
    reg r_TOGGLE_10Hz = 1'b0;
    reg r_TOGGLE_1Hz = 1'b0;

    reg r_LED_SELECT;

    // Frequency toggles
    always @ (posedge i_clock) begin
        if(r_CNT_100Hz == c_CNT_100Hz - 1) begin
            r_TOGGLE_100Hz <= ~r_TOGGLE_100Hz;
            r_CNT_100Hz <= 0;
        end else
            r_CNT_100Hz <= r_CNT_100Hz + 1;
    end

    always @ (posedge i_clock) begin
        if(r_CNT_50Hz == c_CNT_50Hz - 1) begin
            r_TOGGLE_50Hz <= ~r_TOGGLE_50Hz;
            r_CNT_50Hz <= 0;
        end else
            r_CNT_50Hz <= r_CNT_50Hz + 1;
    end

    always @ (posedge i_clock) begin
        if(r_CNT_10Hz == c_CNT_10Hz - 1) begin
            r_TOGGLE_10Hz <= ~r_TOGGLE_10Hz;
            r_CNT_10Hz <= 0;
        end else
            r_CNT_10Hz <= r_CNT_10Hz + 1;
    end

    always @ (posedge i_clock) begin
        if(r_CNT_1Hz == c_CNT_1Hz - 1) begin
            r_TOGGLE_1Hz <= ~r_TOGGLE_1Hz;
            r_CNT_1Hz <= 0;
        end else
            r_CNT_1Hz <= r_CNT_1Hz + 1;
    end

    // Switch logic
    always @(*) begin
        case({i_switch_1, i_switch_2})
            2'b11 : r_LED_SELECT = r_TOGGLE_1Hz;
            2'b10 : r_LED_SELECT = r_TOGGLE_10Hz;
            2'b01 : r_LED_SELECT = r_TOGGLE_50Hz;
            2'b00 : r_LED_SELECT = r_TOGGLE_100Hz;
            default : r_LED_SELECT = 1'b0;
        endcase
    end

    assign o_led_drive = r_LED_SELECT & i_enable;

endmodule
