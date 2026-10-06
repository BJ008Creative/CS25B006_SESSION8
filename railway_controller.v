module mux2to1(
    input D0,
    input D1,
    input S,
    output Y
);
wire Sbar;
wire A;
wire B;
not N1(Sbar, S);
and A1(A, D0, Sbar);
and A2(B, D1, S);
or O1(Y, A, B);
endmodule
module demux1to4(
    input D,
    input S1,
    input S0,
    output Y0,
    output Y1,
    output Y2,
    output Y3
);
wire S1bar;
wire S0bar;
not N1(S1bar, S1);
not N2(S0bar, S0);
and A1(Y0, D, S1bar, S0bar);
and A2(Y1, D, S1bar, S0);
and A3(Y2, D, S1, S0bar);
and A4(Y3, D, S1, S0);
endmodule
module railway_controller(
    input E,
    input W,
    input P1_BUSY,
    input P2_BUSY,
    input P3_BUSY,
    input PRI,
    output E_GREEN,
    output E_RED,
    output W_GREEN,
    output W_RED,
    output E_P1,
    output E_P2,
    output E_P3,
    output W_P1,
    output W_P2,
    output W_P3,
    output P1_FREE,
    output P1_BUSY_LED,
    output P2_FREE,
    output P2_BUSY_LED,
    output P3_FREE,
    output P3_BUSY_LED
);
wire P1_FREE_INT;
wire P2_FREE_INT;
wire P3_FREE_INT;
wire P1_FREE_BAR;
wire P2_FREE_BAR;
wire P3_FREE_BAR;
wire E_BAR;
wire W_BAR;
wire PRI_BAR;
wire E_ONLY;
wire W_ONLY;
wire BOTH;
wire ONLY_P1;
wire ONLY_P2;
wire ONLY_P3;
wire ONE_FREE;
wire TWO_FREE;
wire ANY_FREE;
wire E_ONLY_ASSIGN;
wire W_ONLY_ASSIGN;
wire BOTH_ONE_E;
wire BOTH_ONE_W;
wire BOTH_TWO;
wire E_ASSIGN;
wire W_ASSIGN;
wire E_PRIORITY;
wire W_PRIORITY;
wire E_P1_SEL;
wire E_P2_SEL;
wire E_P3_SEL;
wire W_P1_SEL;
wire W_P2_SEL;
wire W_P3_SEL;
wire W_P2_BOTH;
wire W_P3_CASE1;
wire W_P3_CASE2;
wire E_S1;
wire E_S0;
wire W_S1;
wire W_S0;
wire E_UNUSED;
wire W_UNUSED;

not N1(P1_FREE_INT, P1_BUSY);
not N2(P2_FREE_INT, P2_BUSY);
not N3(P3_FREE_INT, P3_BUSY);
not N4(P1_FREE_BAR, P1_FREE_INT);
not N5(P2_FREE_BAR, P2_FREE_INT);
not N6(P3_FREE_BAR, P3_FREE_INT);

buf B1(P1_FREE, P1_FREE_INT);
buf B2(P2_FREE, P2_FREE_INT);
buf B3(P3_FREE, P3_FREE_INT);
buf B4(P1_BUSY_LED, P1_BUSY);
buf B5(P2_BUSY_LED, P2_BUSY);
buf B6(P3_BUSY_LED, P3_BUSY);

not N7(E_BAR, E);
not N8(W_BAR, W);
not N9(PRI_BAR, PRI);

and A1(E_ONLY, E, W_BAR);
and A2(W_ONLY, E_BAR, W);
and A3(BOTH, E, W);

and A4(ONLY_P1, P1_FREE_INT, P2_FREE_BAR, P3_FREE_BAR);
and A5(ONLY_P2, P1_FREE_BAR, P2_FREE_INT, P3_FREE_BAR);
and A6(ONLY_P3, P1_FREE_BAR, P2_FREE_BAR, P3_FREE_INT);
or O1(ONE_FREE, ONLY_P1, ONLY_P2, ONLY_P3);

and A7(TWO_1, P1_FREE_INT, P2_FREE_INT);
and A8(TWO_2, P1_FREE_INT, P3_FREE_INT);
and A9(TWO_3, P2_FREE_INT, P3_FREE_INT);
or O2(TWO_FREE, TWO_1, TWO_2, TWO_3);

or O3(ANY_FREE, P1_FREE_INT, P2_FREE_INT, P3_FREE_INT);

and A10(E_ONLY_ASSIGN, E_ONLY, ANY_FREE);

and A11(W_ONLY_ASSIGN, W_ONLY, ANY_FREE);

mux2to1 ARBITER(
    1'b1,
    1'b0,
    PRI,
    E_PRIORITY
);
not N10(W_PRIORITY, E_PRIORITY);

and A12(BOTH_ONE_E, BOTH, ONE_FREE, E_PRIORITY);
and A13(BOTH_ONE_W, BOTH, ONE_FREE, W_PRIORITY);

and A14(BOTH_TWO, BOTH, TWO_FREE);

or O4(
    E_ASSIGN,
    E_ONLY_ASSIGN,
    BOTH_ONE_E,
    BOTH_TWO
);
or O5(
    W_ASSIGN,
    W_ONLY_ASSIGN,
    BOTH_ONE_W,
    BOTH_TWO
);

and A15(
    E_P1_SEL,
    P1_FREE_INT
);
and A16(
    E_P2_SEL,
    P1_FREE_BAR,
    P2_FREE_INT
);
and A17(
    E_P3_SEL,
    P1_FREE_BAR,
    P2_FREE_BAR,
    P3_FREE_INT
);

buf B7(E_S1, E_P3_SEL);
buf B8(E_S0, E_P2_SEL);

and A18(
    W_P1_SEL,
    ONLY_P1
);

and A19(
    W_P2_BOTH,
    P1_FREE_INT,
    P2_FREE_INT
);
or O6(
    W_P2_SEL,
    ONLY_P2,
    W_P2_BOTH
);

and A20(
    W_P3_CASE1,
    P1_FREE_INT,
    P2_FREE_BAR,
    P3_FREE_INT
);
and A21(
    W_P3_CASE2,
    P1_FREE_BAR,
    P2_FREE_INT,
    P3_FREE_INT
);
or O7(
    W_P3_SEL,
    ONLY_P3,
    W_P3_CASE1,
    W_P3_CASE2
);

buf B9(W_S1, W_P3_SEL);
buf B10(W_S0, W_P2_SEL);

demux1to4 EAST_DEMUX(
    E_ASSIGN,
    E_S1,
    E_S0,
    E_P1,
    E_P2,
    E_P3,
    E_UNUSED
);

demux1to4 WEST_DEMUX(
    W_ASSIGN,
    W_S1,
    W_S0,
    W_P1,
    W_P2,
    W_P3,
    W_UNUSED
);

buf B11(E_GREEN, E_ASSIGN);
buf B12(W_GREEN, W_ASSIGN);
/* RED SIGNALS */
not N11(E_RED, E_ASSIGN);
not N12(W_RED, W_ASSIGN);
endmodule
