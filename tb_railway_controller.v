module tb_railway_controller;
reg E;
reg W;
reg P1_BUSY;
reg P2_BUSY;
reg P3_BUSY;
reg PRI;
wire E_GREEN;
wire E_RED;
wire W_GREEN;
wire W_RED;
wire E_P1;
wire E_P2;
wire E_P3;
wire W_P1;
wire W_P2;
wire W_P3;
wire P1_FREE;
wire P1_BUSY_LED;
wire P2_FREE;
wire P2_BUSY_LED;
wire P3_FREE;
wire P3_BUSY_LED;
railway_controller DUT(
    E,
    W,
    P1_BUSY,
    P2_BUSY,
    P3_BUSY,
    PRI,
    E_GREEN,
    E_RED,
    W_GREEN,
    W_RED,
    E_P1,
    E_P2,
    E_P3,
    W_P1,
    W_P2,
    W_P3,
    P1_FREE,
    P1_BUSY_LED,
    P2_FREE,
    P2_BUSY_LED,
    P3_FREE,
    P3_BUSY_LED
);
initial begin
    /* NO TRAINS, ALL FREE */
    E=0;
    W=0;
    P1_BUSY=0;
    P2_BUSY=0;
    P3_BUSY=0;
    PRI=0;
    #10;
    /* EAST ONLY, ALL FREE */
    E=1;
    W=0;
    P1_BUSY=0;
    P2_BUSY=0;
    P3_BUSY=0;
    #10;
    /* EAST ONLY, P1 BUSY */
    E=1;
    W=0;
    P1_BUSY=1;
    P2_BUSY=0;
    P3_BUSY=0;
    #10;
    /* EAST ONLY, ALL BUSY */
    E=1;
    W=0;
    P1_BUSY=1;
    P2_BUSY=1;
    P3_BUSY=1;
    #10;
    /* WEST ONLY, ALL FREE */
    E=0;
    W=1;
    P1_BUSY=0;
    P2_BUSY=0;
    P3_BUSY=0;
    #10;
    /* WEST ONLY, P1 BUSY */
    E=0;
    W=1;
    P1_BUSY=1;
    P2_BUSY=0;
    P3_BUSY=0;
    #10;
    /* WEST ONLY, ALL BUSY */
    E=0;
    W=1;
    P1_BUSY=1;
    P2_BUSY=1;
    P3_BUSY=1;
    #10;
    /* BOTH, NO FREE */
    E=1;
    W=1;
    P1_BUSY=1;
    P2_BUSY=1;
    P3_BUSY=1;
    PRI=0;
    #10;
    /* BOTH, ONLY P1 FREE, EAST PRIORITY */
    E=1;
    W=1;
    P1_BUSY=0;
    P2_BUSY=1;
    P3_BUSY=1;
    PRI=0;
    #10;
    /* BOTH, ONLY P1 FREE, WEST PRIORITY */
    E=1;
    W=1;
    P1_BUSY=0;
    P2_BUSY=1;
    P3_BUSY=1;
    PRI=1;
    #10;
    /* BOTH, P1 BUSY, P2 AND P3 FREE */
    E=1;
    W=1;
    P1_BUSY=1;
    P2_BUSY=0;
    P3_BUSY=0;
    PRI=0;
    #10;
    /* BOTH, ALL FREE */
    E=1;
    W=1;
    P1_BUSY=0;
    P2_BUSY=0;
    P3_BUSY=0;
    PRI=0;
    #10;
    /* BOTH, P2 ONLY FREE */
    E=1;
    W=1;
    P1_BUSY=1;
    P2_BUSY=0;
    P3_BUSY=1;
    PRI=0;
    #10;
    /* BOTH, P3 ONLY FREE */
    E=1;
    W=1;
    P1_BUSY=1;
    P2_BUSY=1;
    P3_BUSY=0;
    PRI=1;
    #10;
    $display("RAILWAY CONTROLLER TEST COMPLETED");
    $finish;
end
endmodule
