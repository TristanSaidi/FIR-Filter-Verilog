/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP5-1
// Date      : Mon Nov 29 15:44:24 2021
/////////////////////////////////////////////////////////////


module sram_8blk ( Q7, Q6, Q5, Q4, Q3, Q2, Q1, Q0, D, A7, A6, A5, A4, A3, A2, 
        A1, A0, CADDR, WEN, CEN, clk, sclk );
  output [19:0] Q7;
  output [19:0] Q6;
  output [19:0] Q5;
  output [19:0] Q4;
  output [19:0] Q3;
  output [19:0] Q2;
  output [19:0] Q1;
  output [19:0] Q0;
  input [19:0] D;
  input [7:0] A7;
  input [7:0] A6;
  input [7:0] A5;
  input [7:0] A4;
  input [7:0] A3;
  input [7:0] A2;
  input [7:0] A1;
  input [7:0] A0;
  input [10:0] CADDR;
  input WEN, CEN, clk, sclk;
  wire   WENI, CENI, \AI[7][7] , \AI[7][6] , \AI[7][5] , \AI[7][4] ,
         \AI[7][3] , \AI[7][2] , \AI[7][1] , \AI[7][0] , \AI[6][7] ,
         \AI[6][6] , \AI[6][5] , \AI[6][4] , \AI[6][3] , \AI[6][2] ,
         \AI[6][1] , \AI[6][0] , \AI[5][7] , \AI[5][6] , \AI[5][5] ,
         \AI[5][4] , \AI[5][3] , \AI[5][2] , \AI[5][1] , \AI[5][0] ,
         \AI[4][7] , \AI[4][6] , \AI[4][5] , \AI[4][4] , \AI[4][3] ,
         \AI[4][2] , \AI[4][1] , \AI[4][0] , \AI[3][7] , \AI[3][6] ,
         \AI[3][5] , \AI[3][4] , \AI[3][3] , \AI[3][2] , \AI[3][1] ,
         \AI[3][0] , \AI[2][7] , \AI[2][6] , \AI[2][5] , \AI[2][4] ,
         \AI[2][3] , \AI[2][2] , \AI[2][1] , \AI[2][0] , \AI[1][7] ,
         \AI[1][6] , \AI[1][5] , \AI[1][4] , \AI[1][3] , \AI[1][2] ,
         \AI[1][1] , \AI[1][0] , \AI[0][7] , \AI[0][6] , \AI[0][5] ,
         \AI[0][4] , \AI[0][3] , \AI[0][2] , \AI[0][1] , \AI[0][0] ,
         \genblk1[0].AIB[7] , \genblk1[0].AIB[6] , \genblk1[0].AIB[5] ,
         \genblk1[0].AIB[4] , \genblk1[0].AIB[3] , \genblk1[0].AIB[2] ,
         \genblk1[0].AIB[1] , \genblk1[0].AIB[0] , \genblk1[1].AIB[7] ,
         \genblk1[1].AIB[6] , \genblk1[1].AIB[5] , \genblk1[1].AIB[4] ,
         \genblk1[1].AIB[3] , \genblk1[1].AIB[2] , \genblk1[1].AIB[1] ,
         \genblk1[1].AIB[0] , \genblk1[2].AIB[7] , \genblk1[2].AIB[6] ,
         \genblk1[2].AIB[5] , \genblk1[2].AIB[4] , \genblk1[2].AIB[3] ,
         \genblk1[2].AIB[2] , \genblk1[2].AIB[1] , \genblk1[2].AIB[0] ,
         \genblk1[3].AIB[7] , \genblk1[3].AIB[6] , \genblk1[3].AIB[5] ,
         \genblk1[3].AIB[4] , \genblk1[3].AIB[3] , \genblk1[3].AIB[2] ,
         \genblk1[3].AIB[1] , \genblk1[3].AIB[0] , \genblk1[4].AIB[7] ,
         \genblk1[4].AIB[6] , \genblk1[4].AIB[5] , \genblk1[4].AIB[4] ,
         \genblk1[4].AIB[3] , \genblk1[4].AIB[2] , \genblk1[4].AIB[1] ,
         \genblk1[4].AIB[0] , \genblk1[5].AIB[7] , \genblk1[5].AIB[6] ,
         \genblk1[5].AIB[5] , \genblk1[5].AIB[4] , \genblk1[5].AIB[3] ,
         \genblk1[5].AIB[2] , \genblk1[5].AIB[1] , \genblk1[5].AIB[0] ,
         \genblk1[6].AIB[7] , \genblk1[6].AIB[6] , \genblk1[6].AIB[5] ,
         \genblk1[6].AIB[4] , \genblk1[6].AIB[3] , \genblk1[6].AIB[2] ,
         \genblk1[6].AIB[1] , \genblk1[6].AIB[0] , \genblk1[7].AIB[7] ,
         \genblk1[7].AIB[6] , \genblk1[7].AIB[5] , \genblk1[7].AIB[4] ,
         \genblk1[7].AIB[3] , \genblk1[7].AIB[2] , \genblk1[7].AIB[1] ,
         \genblk1[7].AIB[0] , n16, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160;
  wire   [19:0] DI;
  wire   [10:0] CADDRI;

  sram256w20b \genblk1[0].SRAM_CORE  ( .Q(Q0), .A({\genblk1[0].AIB[7] , 
        \genblk1[0].AIB[6] , \genblk1[0].AIB[5] , \genblk1[0].AIB[4] , 
        \genblk1[0].AIB[3] , \genblk1[0].AIB[2] , \genblk1[0].AIB[1] , 
        \genblk1[0].AIB[0] }), .D({n84, n87, n90, n93, n96, n99, n102, n105, 
        n108, n111, n114, n117, n120, n123, n126, n129, n132, n135, n138, n141}), .CLK(sclk), .CEN(n150), .WEN(n61) );
  sram256w20b \genblk1[1].SRAM_CORE  ( .Q(Q1), .A({\genblk1[1].AIB[7] , 
        \genblk1[1].AIB[6] , \genblk1[1].AIB[5] , \genblk1[1].AIB[4] , 
        \genblk1[1].AIB[3] , \genblk1[1].AIB[2] , \genblk1[1].AIB[1] , 
        \genblk1[1].AIB[0] }), .D({n83, n86, n89, n92, n95, n98, n101, n104, 
        n107, n110, n113, n116, n119, n122, n125, n128, n131, n134, n137, n140}), .CLK(sclk), .CEN(n149), .WEN(n143) );
  sram256w20b \genblk1[2].SRAM_CORE  ( .Q(Q2), .A({\genblk1[2].AIB[7] , 
        \genblk1[2].AIB[6] , \genblk1[2].AIB[5] , \genblk1[2].AIB[4] , 
        \genblk1[2].AIB[3] , \genblk1[2].AIB[2] , \genblk1[2].AIB[1] , 
        \genblk1[2].AIB[0] }), .D({n84, n87, n90, n93, n96, n99, n102, n105, 
        n108, n111, n114, n117, n120, n123, n126, n129, n132, n135, n138, n141}), .CLK(sclk), .CEN(CENI), .WEN(n70) );
  sram256w20b \genblk1[3].SRAM_CORE  ( .Q(Q3), .A({\genblk1[3].AIB[7] , 
        \genblk1[3].AIB[6] , \genblk1[3].AIB[5] , \genblk1[3].AIB[4] , 
        \genblk1[3].AIB[3] , \genblk1[3].AIB[2] , \genblk1[3].AIB[1] , 
        \genblk1[3].AIB[0] }), .D({n83, n86, n89, n92, n95, n98, n101, n104, 
        n107, n110, n113, n116, n119, n122, n125, n128, n131, n134, n137, n140}), .CLK(sclk), .CEN(n150), .WEN(n159) );
  sram256w20b \genblk1[4].SRAM_CORE  ( .Q(Q4), .A({\genblk1[4].AIB[7] , 
        \genblk1[4].AIB[6] , \genblk1[4].AIB[5] , \genblk1[4].AIB[4] , 
        \genblk1[4].AIB[3] , \genblk1[4].AIB[2] , \genblk1[4].AIB[1] , 
        \genblk1[4].AIB[0] }), .D({n84, n87, n90, n93, n96, n99, n102, n105, 
        n108, n111, n114, n117, n120, n123, n126, n129, n132, n135, n138, n141}), .CLK(sclk), .CEN(n149), .WEN(n64) );
  sram256w20b \genblk1[5].SRAM_CORE  ( .Q(Q5), .A({\genblk1[5].AIB[7] , 
        \genblk1[5].AIB[6] , \genblk1[5].AIB[5] , \genblk1[5].AIB[4] , 
        \genblk1[5].AIB[3] , \genblk1[5].AIB[2] , \genblk1[5].AIB[1] , 
        \genblk1[5].AIB[0] }), .D({n83, n86, n89, n92, n95, n98, n101, n104, 
        n107, n110, n113, n116, n119, n122, n125, n128, n131, n134, n137, n140}), .CLK(sclk), .CEN(CENI), .WEN(n58) );
  sram256w20b \genblk1[6].SRAM_CORE  ( .Q(Q6), .A({\genblk1[6].AIB[7] , 
        \genblk1[6].AIB[6] , \genblk1[6].AIB[5] , \genblk1[6].AIB[4] , 
        \genblk1[6].AIB[3] , \genblk1[6].AIB[2] , \genblk1[6].AIB[1] , 
        \genblk1[6].AIB[0] }), .D({n84, n87, n90, n93, n96, n99, n102, n105, 
        n108, n111, n114, n117, n120, n123, n126, n129, n132, n135, n138, n141}), .CLK(sclk), .CEN(n150), .WEN(n67) );
  sram256w20b \genblk1[7].SRAM_CORE  ( .Q(Q7), .A({\genblk1[7].AIB[7] , 
        \genblk1[7].AIB[6] , \genblk1[7].AIB[5] , \genblk1[7].AIB[4] , 
        \genblk1[7].AIB[3] , \genblk1[7].AIB[2] , \genblk1[7].AIB[1] , 
        \genblk1[7].AIB[0] }), .D({n83, n86, n89, n92, n95, n98, n101, n104, 
        n107, n110, n113, n116, n119, n122, n125, n128, n131, n134, n137, n140}), .CLK(sclk), .CEN(n149), .WEN(n146) );
  DFFQX1TS \DI_reg[19]  ( .D(D[19]), .CK(clk), .Q(DI[19]) );
  DFFQX1TS \DI_reg[18]  ( .D(D[18]), .CK(clk), .Q(DI[18]) );
  DFFQX1TS \DI_reg[17]  ( .D(D[17]), .CK(clk), .Q(DI[17]) );
  DFFQX1TS \DI_reg[16]  ( .D(D[16]), .CK(clk), .Q(DI[16]) );
  DFFQX1TS \DI_reg[15]  ( .D(D[15]), .CK(clk), .Q(DI[15]) );
  DFFQX1TS \DI_reg[14]  ( .D(D[14]), .CK(clk), .Q(DI[14]) );
  DFFQX1TS \DI_reg[13]  ( .D(D[13]), .CK(clk), .Q(DI[13]) );
  DFFQX1TS \DI_reg[12]  ( .D(D[12]), .CK(clk), .Q(DI[12]) );
  DFFQX1TS \DI_reg[11]  ( .D(D[11]), .CK(clk), .Q(DI[11]) );
  DFFQX1TS \DI_reg[10]  ( .D(D[10]), .CK(clk), .Q(DI[10]) );
  DFFQX1TS \DI_reg[9]  ( .D(D[9]), .CK(clk), .Q(DI[9]) );
  DFFQX1TS \DI_reg[8]  ( .D(D[8]), .CK(clk), .Q(DI[8]) );
  DFFQX1TS \DI_reg[7]  ( .D(D[7]), .CK(clk), .Q(DI[7]) );
  DFFQX1TS \DI_reg[6]  ( .D(D[6]), .CK(clk), .Q(DI[6]) );
  DFFQX1TS \DI_reg[5]  ( .D(D[5]), .CK(clk), .Q(DI[5]) );
  DFFQX1TS \DI_reg[4]  ( .D(D[4]), .CK(clk), .Q(DI[4]) );
  DFFQX1TS \DI_reg[3]  ( .D(D[3]), .CK(clk), .Q(DI[3]) );
  DFFQX1TS \DI_reg[2]  ( .D(D[2]), .CK(clk), .Q(DI[2]) );
  DFFQX1TS \DI_reg[1]  ( .D(D[1]), .CK(clk), .Q(DI[1]) );
  DFFQX1TS \DI_reg[0]  ( .D(D[0]), .CK(clk), .Q(DI[0]) );
  DFFQX1TS WENI_reg ( .D(WEN), .CK(clk), .Q(WENI) );
  DFFQX1TS \CADDRI_reg[10]  ( .D(CADDR[10]), .CK(clk), .Q(CADDRI[10]) );
  DFFQX1TS \CADDRI_reg[9]  ( .D(CADDR[9]), .CK(clk), .Q(CADDRI[9]) );
  DFFQX1TS \CADDRI_reg[8]  ( .D(CADDR[8]), .CK(clk), .Q(CADDRI[8]) );
  DFFQX1TS \CADDRI_reg[7]  ( .D(CADDR[7]), .CK(clk), .Q(CADDRI[7]) );
  DFFQX1TS \CADDRI_reg[6]  ( .D(CADDR[6]), .CK(clk), .Q(CADDRI[6]) );
  DFFQX1TS \CADDRI_reg[5]  ( .D(CADDR[5]), .CK(clk), .Q(CADDRI[5]) );
  DFFQX1TS \CADDRI_reg[4]  ( .D(CADDR[4]), .CK(clk), .Q(CADDRI[4]) );
  DFFQX1TS \CADDRI_reg[3]  ( .D(CADDR[3]), .CK(clk), .Q(CADDRI[3]) );
  DFFQX1TS \CADDRI_reg[2]  ( .D(CADDR[2]), .CK(clk), .Q(CADDRI[2]) );
  DFFQX1TS \CADDRI_reg[1]  ( .D(CADDR[1]), .CK(clk), .Q(CADDRI[1]) );
  DFFQX1TS \CADDRI_reg[0]  ( .D(CADDR[0]), .CK(clk), .Q(CADDRI[0]) );
  DFFQX1TS \AI_reg[7][7]  ( .D(A7[7]), .CK(clk), .Q(\AI[7][7] ) );
  DFFQX1TS \AI_reg[7][6]  ( .D(A7[6]), .CK(clk), .Q(\AI[7][6] ) );
  DFFQX1TS \AI_reg[7][5]  ( .D(A7[5]), .CK(clk), .Q(\AI[7][5] ) );
  DFFQX1TS \AI_reg[7][4]  ( .D(A7[4]), .CK(clk), .Q(\AI[7][4] ) );
  DFFQX1TS \AI_reg[7][3]  ( .D(A7[3]), .CK(clk), .Q(\AI[7][3] ) );
  DFFQX1TS \AI_reg[7][2]  ( .D(A7[2]), .CK(clk), .Q(\AI[7][2] ) );
  DFFQX1TS \AI_reg[7][1]  ( .D(A7[1]), .CK(clk), .Q(\AI[7][1] ) );
  DFFQX1TS \AI_reg[7][0]  ( .D(A7[0]), .CK(clk), .Q(\AI[7][0] ) );
  DFFQX1TS \AI_reg[6][7]  ( .D(A6[7]), .CK(clk), .Q(\AI[6][7] ) );
  DFFQX1TS \AI_reg[6][6]  ( .D(A6[6]), .CK(clk), .Q(\AI[6][6] ) );
  DFFQX1TS \AI_reg[6][5]  ( .D(A6[5]), .CK(clk), .Q(\AI[6][5] ) );
  DFFQX1TS \AI_reg[6][4]  ( .D(A6[4]), .CK(clk), .Q(\AI[6][4] ) );
  DFFQX1TS \AI_reg[6][3]  ( .D(A6[3]), .CK(clk), .Q(\AI[6][3] ) );
  DFFQX1TS \AI_reg[6][2]  ( .D(A6[2]), .CK(clk), .Q(\AI[6][2] ) );
  DFFQX1TS \AI_reg[6][1]  ( .D(A6[1]), .CK(clk), .Q(\AI[6][1] ) );
  DFFQX1TS \AI_reg[6][0]  ( .D(A6[0]), .CK(clk), .Q(\AI[6][0] ) );
  DFFQX1TS \AI_reg[5][7]  ( .D(A5[7]), .CK(clk), .Q(\AI[5][7] ) );
  DFFQX1TS \AI_reg[5][6]  ( .D(A5[6]), .CK(clk), .Q(\AI[5][6] ) );
  DFFQX1TS \AI_reg[5][5]  ( .D(A5[5]), .CK(clk), .Q(\AI[5][5] ) );
  DFFQX1TS \AI_reg[5][4]  ( .D(A5[4]), .CK(clk), .Q(\AI[5][4] ) );
  DFFQX1TS \AI_reg[5][3]  ( .D(A5[3]), .CK(clk), .Q(\AI[5][3] ) );
  DFFQX1TS \AI_reg[5][2]  ( .D(A5[2]), .CK(clk), .Q(\AI[5][2] ) );
  DFFQX1TS \AI_reg[5][1]  ( .D(A5[1]), .CK(clk), .Q(\AI[5][1] ) );
  DFFQX1TS \AI_reg[5][0]  ( .D(A5[0]), .CK(clk), .Q(\AI[5][0] ) );
  DFFQX1TS \AI_reg[4][7]  ( .D(A4[7]), .CK(clk), .Q(\AI[4][7] ) );
  DFFQX1TS \AI_reg[4][6]  ( .D(A4[6]), .CK(clk), .Q(\AI[4][6] ) );
  DFFQX1TS \AI_reg[4][5]  ( .D(A4[5]), .CK(clk), .Q(\AI[4][5] ) );
  DFFQX1TS \AI_reg[4][4]  ( .D(A4[4]), .CK(clk), .Q(\AI[4][4] ) );
  DFFQX1TS \AI_reg[4][3]  ( .D(A4[3]), .CK(clk), .Q(\AI[4][3] ) );
  DFFQX1TS \AI_reg[4][2]  ( .D(A4[2]), .CK(clk), .Q(\AI[4][2] ) );
  DFFQX1TS \AI_reg[4][1]  ( .D(A4[1]), .CK(clk), .Q(\AI[4][1] ) );
  DFFQX1TS \AI_reg[4][0]  ( .D(A4[0]), .CK(clk), .Q(\AI[4][0] ) );
  DFFQX1TS \AI_reg[3][7]  ( .D(A3[7]), .CK(clk), .Q(\AI[3][7] ) );
  DFFQX1TS \AI_reg[3][6]  ( .D(A3[6]), .CK(clk), .Q(\AI[3][6] ) );
  DFFQX1TS \AI_reg[3][5]  ( .D(A3[5]), .CK(clk), .Q(\AI[3][5] ) );
  DFFQX1TS \AI_reg[3][4]  ( .D(A3[4]), .CK(clk), .Q(\AI[3][4] ) );
  DFFQX1TS \AI_reg[3][3]  ( .D(A3[3]), .CK(clk), .Q(\AI[3][3] ) );
  DFFQX1TS \AI_reg[3][2]  ( .D(A3[2]), .CK(clk), .Q(\AI[3][2] ) );
  DFFQX1TS \AI_reg[3][1]  ( .D(A3[1]), .CK(clk), .Q(\AI[3][1] ) );
  DFFQX1TS \AI_reg[3][0]  ( .D(A3[0]), .CK(clk), .Q(\AI[3][0] ) );
  DFFQX1TS \AI_reg[2][7]  ( .D(A2[7]), .CK(clk), .Q(\AI[2][7] ) );
  DFFQX1TS \AI_reg[2][6]  ( .D(A2[6]), .CK(clk), .Q(\AI[2][6] ) );
  DFFQX1TS \AI_reg[2][5]  ( .D(A2[5]), .CK(clk), .Q(\AI[2][5] ) );
  DFFQX1TS \AI_reg[2][4]  ( .D(A2[4]), .CK(clk), .Q(\AI[2][4] ) );
  DFFQX1TS \AI_reg[2][3]  ( .D(A2[3]), .CK(clk), .Q(\AI[2][3] ) );
  DFFQX1TS \AI_reg[2][2]  ( .D(A2[2]), .CK(clk), .Q(\AI[2][2] ) );
  DFFQX1TS \AI_reg[2][1]  ( .D(A2[1]), .CK(clk), .Q(\AI[2][1] ) );
  DFFQX1TS \AI_reg[2][0]  ( .D(A2[0]), .CK(clk), .Q(\AI[2][0] ) );
  DFFQX1TS \AI_reg[1][7]  ( .D(A1[7]), .CK(clk), .Q(\AI[1][7] ) );
  DFFQX1TS \AI_reg[1][6]  ( .D(A1[6]), .CK(clk), .Q(\AI[1][6] ) );
  DFFQX1TS \AI_reg[1][5]  ( .D(A1[5]), .CK(clk), .Q(\AI[1][5] ) );
  DFFQX1TS \AI_reg[1][4]  ( .D(A1[4]), .CK(clk), .Q(\AI[1][4] ) );
  DFFQX1TS \AI_reg[1][3]  ( .D(A1[3]), .CK(clk), .Q(\AI[1][3] ) );
  DFFQX1TS \AI_reg[1][2]  ( .D(A1[2]), .CK(clk), .Q(\AI[1][2] ) );
  DFFQX1TS \AI_reg[1][1]  ( .D(A1[1]), .CK(clk), .Q(\AI[1][1] ) );
  DFFQX1TS \AI_reg[1][0]  ( .D(A1[0]), .CK(clk), .Q(\AI[1][0] ) );
  DFFQX1TS \AI_reg[0][7]  ( .D(A0[7]), .CK(clk), .Q(\AI[0][7] ) );
  DFFQX1TS \AI_reg[0][6]  ( .D(A0[6]), .CK(clk), .Q(\AI[0][6] ) );
  DFFQX1TS \AI_reg[0][5]  ( .D(A0[5]), .CK(clk), .Q(\AI[0][5] ) );
  DFFQX1TS \AI_reg[0][4]  ( .D(A0[4]), .CK(clk), .Q(\AI[0][4] ) );
  DFFQX1TS \AI_reg[0][3]  ( .D(A0[3]), .CK(clk), .Q(\AI[0][3] ) );
  DFFQX1TS \AI_reg[0][2]  ( .D(A0[2]), .CK(clk), .Q(\AI[0][2] ) );
  DFFQX1TS \AI_reg[0][1]  ( .D(A0[1]), .CK(clk), .Q(\AI[0][1] ) );
  DFFQX1TS \AI_reg[0][0]  ( .D(A0[0]), .CK(clk), .Q(\AI[0][0] ) );
  DFFQX1TS CENI_reg ( .D(CEN), .CK(clk), .Q(CENI) );
  INVX2TS U90 ( .A(n25), .Y(n156) );
  AO22XLTS U91 ( .A0(n51), .A1(n48), .B0(n147), .B1(\AI[7][7] ), .Y(
        \genblk1[7].AIB[7] ) );
  AO22XLTS U92 ( .A0(n158), .A1(n45), .B0(n147), .B1(\AI[7][6] ), .Y(
        \genblk1[7].AIB[6] ) );
  AO22XLTS U93 ( .A0(n51), .A1(n43), .B0(n146), .B1(\AI[7][5] ), .Y(
        \genblk1[7].AIB[5] ) );
  AO22XLTS U94 ( .A0(n51), .A1(n39), .B0(n50), .B1(\AI[7][4] ), .Y(
        \genblk1[7].AIB[4] ) );
  AO22XLTS U95 ( .A0(n23), .A1(n36), .B0(n147), .B1(\AI[7][3] ), .Y(
        \genblk1[7].AIB[3] ) );
  AO22XLTS U96 ( .A0(n158), .A1(n34), .B0(n146), .B1(\AI[7][2] ), .Y(
        \genblk1[7].AIB[2] ) );
  AO22XLTS U97 ( .A0(n51), .A1(n30), .B0(n50), .B1(\AI[7][1] ), .Y(
        \genblk1[7].AIB[1] ) );
  AO22XLTS U98 ( .A0(n158), .A1(n27), .B0(n147), .B1(\AI[7][0] ), .Y(
        \genblk1[7].AIB[0] ) );
  AO22XLTS U99 ( .A0(n81), .A1(n49), .B0(n22), .B1(\AI[6][7] ), .Y(
        \genblk1[6].AIB[7] ) );
  AO22XLTS U100 ( .A0(n80), .A1(n46), .B0(n68), .B1(\AI[6][6] ), .Y(
        \genblk1[6].AIB[6] ) );
  AO22XLTS U101 ( .A0(n81), .A1(n42), .B0(n67), .B1(\AI[6][5] ), .Y(
        \genblk1[6].AIB[5] ) );
  AO22XLTS U102 ( .A0(n80), .A1(n40), .B0(n22), .B1(\AI[6][4] ), .Y(
        \genblk1[6].AIB[4] ) );
  AO22XLTS U103 ( .A0(n81), .A1(n37), .B0(n68), .B1(\AI[6][3] ), .Y(
        \genblk1[6].AIB[3] ) );
  AO22XLTS U104 ( .A0(n80), .A1(n33), .B0(n67), .B1(\AI[6][2] ), .Y(
        \genblk1[6].AIB[2] ) );
  AO22XLTS U105 ( .A0(n81), .A1(n31), .B0(n68), .B1(\AI[6][1] ), .Y(
        \genblk1[6].AIB[1] ) );
  AO22XLTS U106 ( .A0(n80), .A1(n28), .B0(n68), .B1(\AI[6][0] ), .Y(
        \genblk1[6].AIB[0] ) );
  AO22XLTS U107 ( .A0(n79), .A1(n48), .B0(n21), .B1(\AI[5][7] ), .Y(
        \genblk1[5].AIB[7] ) );
  AO22XLTS U108 ( .A0(n78), .A1(n45), .B0(n59), .B1(\AI[5][6] ), .Y(
        \genblk1[5].AIB[6] ) );
  AO22XLTS U109 ( .A0(n79), .A1(n43), .B0(n58), .B1(\AI[5][5] ), .Y(
        \genblk1[5].AIB[5] ) );
  AO22XLTS U110 ( .A0(n78), .A1(n39), .B0(n21), .B1(\AI[5][4] ), .Y(
        \genblk1[5].AIB[4] ) );
  AO22XLTS U111 ( .A0(n79), .A1(n36), .B0(n59), .B1(\AI[5][3] ), .Y(
        \genblk1[5].AIB[3] ) );
  AO22XLTS U112 ( .A0(n78), .A1(n34), .B0(n58), .B1(\AI[5][2] ), .Y(
        \genblk1[5].AIB[2] ) );
  AO22XLTS U113 ( .A0(n79), .A1(n30), .B0(n59), .B1(\AI[5][1] ), .Y(
        \genblk1[5].AIB[1] ) );
  AO22XLTS U114 ( .A0(n78), .A1(n27), .B0(n59), .B1(\AI[5][0] ), .Y(
        \genblk1[5].AIB[0] ) );
  AO22XLTS U115 ( .A0(n77), .A1(n49), .B0(n20), .B1(\AI[4][7] ), .Y(
        \genblk1[4].AIB[7] ) );
  AO22XLTS U116 ( .A0(n76), .A1(n46), .B0(n65), .B1(\AI[4][6] ), .Y(
        \genblk1[4].AIB[6] ) );
  AO22XLTS U117 ( .A0(n77), .A1(n42), .B0(n64), .B1(\AI[4][5] ), .Y(
        \genblk1[4].AIB[5] ) );
  AO22XLTS U118 ( .A0(n76), .A1(n40), .B0(n20), .B1(\AI[4][4] ), .Y(
        \genblk1[4].AIB[4] ) );
  AO22XLTS U119 ( .A0(n77), .A1(n37), .B0(n65), .B1(\AI[4][3] ), .Y(
        \genblk1[4].AIB[3] ) );
  AO22XLTS U120 ( .A0(n76), .A1(n33), .B0(n64), .B1(\AI[4][2] ), .Y(
        \genblk1[4].AIB[2] ) );
  AO22XLTS U121 ( .A0(n77), .A1(n31), .B0(n65), .B1(\AI[4][1] ), .Y(
        \genblk1[4].AIB[1] ) );
  AO22XLTS U122 ( .A0(n76), .A1(n28), .B0(n65), .B1(\AI[4][0] ), .Y(
        \genblk1[4].AIB[0] ) );
  AO22XLTS U123 ( .A0(n145), .A1(n48), .B0(n56), .B1(\AI[3][7] ), .Y(
        \genblk1[3].AIB[7] ) );
  AO22XLTS U124 ( .A0(n145), .A1(n45), .B0(n56), .B1(\AI[3][6] ), .Y(
        \genblk1[3].AIB[6] ) );
  AO22XLTS U125 ( .A0(n144), .A1(n43), .B0(n19), .B1(\AI[3][5] ), .Y(
        \genblk1[3].AIB[5] ) );
  AO22XLTS U126 ( .A0(n55), .A1(n39), .B0(n56), .B1(\AI[3][4] ), .Y(
        \genblk1[3].AIB[4] ) );
  AO22XLTS U127 ( .A0(n145), .A1(n36), .B0(n19), .B1(\AI[3][3] ), .Y(
        \genblk1[3].AIB[3] ) );
  AO22XLTS U128 ( .A0(n144), .A1(n34), .B0(n159), .B1(\AI[3][2] ), .Y(
        \genblk1[3].AIB[2] ) );
  AO22XLTS U129 ( .A0(n144), .A1(n30), .B0(n56), .B1(\AI[3][1] ), .Y(
        \genblk1[3].AIB[1] ) );
  AO22XLTS U130 ( .A0(n145), .A1(n27), .B0(n19), .B1(\AI[3][0] ), .Y(
        \genblk1[3].AIB[0] ) );
  AO22XLTS U131 ( .A0(n75), .A1(n49), .B0(n18), .B1(\AI[2][7] ), .Y(
        \genblk1[2].AIB[7] ) );
  AO22XLTS U132 ( .A0(n74), .A1(n46), .B0(n71), .B1(\AI[2][6] ), .Y(
        \genblk1[2].AIB[6] ) );
  AO22XLTS U133 ( .A0(n75), .A1(n43), .B0(n70), .B1(\AI[2][5] ), .Y(
        \genblk1[2].AIB[5] ) );
  AO22XLTS U134 ( .A0(n74), .A1(n40), .B0(n18), .B1(\AI[2][4] ), .Y(
        \genblk1[2].AIB[4] ) );
  AO22XLTS U135 ( .A0(n75), .A1(n37), .B0(n71), .B1(\AI[2][3] ), .Y(
        \genblk1[2].AIB[3] ) );
  AO22XLTS U136 ( .A0(n74), .A1(n34), .B0(n70), .B1(\AI[2][2] ), .Y(
        \genblk1[2].AIB[2] ) );
  AO22XLTS U137 ( .A0(n75), .A1(n31), .B0(n71), .B1(\AI[2][1] ), .Y(
        \genblk1[2].AIB[1] ) );
  AO22XLTS U138 ( .A0(n74), .A1(n28), .B0(n71), .B1(\AI[2][0] ), .Y(
        \genblk1[2].AIB[0] ) );
  AO22XLTS U139 ( .A0(n54), .A1(n48), .B0(n142), .B1(\AI[1][7] ), .Y(
        \genblk1[1].AIB[7] ) );
  AO22XLTS U140 ( .A0(n160), .A1(n45), .B0(n142), .B1(\AI[1][6] ), .Y(
        \genblk1[1].AIB[6] ) );
  AO22XLTS U141 ( .A0(n54), .A1(n42), .B0(n143), .B1(\AI[1][5] ), .Y(
        \genblk1[1].AIB[5] ) );
  AO22XLTS U142 ( .A0(n53), .A1(n39), .B0(n142), .B1(\AI[1][4] ), .Y(
        \genblk1[1].AIB[4] ) );
  AO22XLTS U143 ( .A0(n54), .A1(n36), .B0(n52), .B1(\AI[1][3] ), .Y(
        \genblk1[1].AIB[3] ) );
  AO22XLTS U144 ( .A0(n54), .A1(n33), .B0(n143), .B1(\AI[1][2] ), .Y(
        \genblk1[1].AIB[2] ) );
  AO22XLTS U145 ( .A0(n53), .A1(n30), .B0(n142), .B1(\AI[1][1] ), .Y(
        \genblk1[1].AIB[1] ) );
  AO22XLTS U146 ( .A0(n53), .A1(n27), .B0(n143), .B1(\AI[1][0] ), .Y(
        \genblk1[1].AIB[0] ) );
  AO22XLTS U147 ( .A0(n73), .A1(n49), .B0(n16), .B1(\AI[0][7] ), .Y(
        \genblk1[0].AIB[7] ) );
  AO22XLTS U148 ( .A0(n72), .A1(n46), .B0(n62), .B1(\AI[0][6] ), .Y(
        \genblk1[0].AIB[6] ) );
  AO22XLTS U149 ( .A0(n73), .A1(n42), .B0(n61), .B1(\AI[0][5] ), .Y(
        \genblk1[0].AIB[5] ) );
  AO22XLTS U150 ( .A0(n72), .A1(n40), .B0(n16), .B1(\AI[0][4] ), .Y(
        \genblk1[0].AIB[4] ) );
  AO22XLTS U151 ( .A0(n73), .A1(n37), .B0(n62), .B1(\AI[0][3] ), .Y(
        \genblk1[0].AIB[3] ) );
  AO22XLTS U152 ( .A0(n72), .A1(n33), .B0(n61), .B1(\AI[0][2] ), .Y(
        \genblk1[0].AIB[2] ) );
  AO22XLTS U153 ( .A0(n73), .A1(n31), .B0(n62), .B1(\AI[0][1] ), .Y(
        \genblk1[0].AIB[1] ) );
  AO22XLTS U154 ( .A0(n72), .A1(n28), .B0(n62), .B1(\AI[0][0] ), .Y(
        \genblk1[0].AIB[0] ) );
  NOR3XLTS U155 ( .A(n157), .B(n25), .C(CADDRI[10]), .Y(n160) );
  INVX2TS U156 ( .A(CADDRI[9]), .Y(n24) );
  INVX2TS U157 ( .A(n24), .Y(n25) );
  INVX2TS U158 ( .A(CADDRI[0]), .Y(n26) );
  INVX2TS U159 ( .A(n26), .Y(n27) );
  INVX2TS U160 ( .A(n26), .Y(n28) );
  INVX2TS U161 ( .A(CADDRI[1]), .Y(n29) );
  INVX2TS U162 ( .A(n29), .Y(n30) );
  INVX2TS U163 ( .A(n29), .Y(n31) );
  INVX2TS U164 ( .A(CADDRI[2]), .Y(n32) );
  INVX2TS U165 ( .A(n32), .Y(n33) );
  INVX2TS U166 ( .A(n32), .Y(n34) );
  INVX2TS U167 ( .A(CADDRI[3]), .Y(n35) );
  INVX2TS U168 ( .A(n35), .Y(n36) );
  INVX2TS U169 ( .A(n35), .Y(n37) );
  INVX2TS U170 ( .A(CADDRI[4]), .Y(n38) );
  INVX2TS U171 ( .A(n38), .Y(n39) );
  INVX2TS U172 ( .A(n38), .Y(n40) );
  INVX2TS U173 ( .A(CADDRI[5]), .Y(n41) );
  INVX2TS U174 ( .A(n41), .Y(n42) );
  INVX2TS U175 ( .A(n41), .Y(n43) );
  INVX2TS U176 ( .A(CADDRI[6]), .Y(n44) );
  INVX2TS U177 ( .A(n44), .Y(n45) );
  INVX2TS U178 ( .A(n44), .Y(n46) );
  INVX2TS U179 ( .A(CADDRI[7]), .Y(n47) );
  INVX2TS U180 ( .A(n47), .Y(n48) );
  INVX2TS U181 ( .A(n47), .Y(n49) );
  INVX2TS U182 ( .A(n158), .Y(n50) );
  INVX2TS U183 ( .A(n50), .Y(n51) );
  INVX2TS U184 ( .A(n160), .Y(n52) );
  INVX2TS U185 ( .A(n52), .Y(n53) );
  INVX2TS U186 ( .A(n52), .Y(n54) );
  INVX2TS U187 ( .A(n19), .Y(n55) );
  INVX2TS U188 ( .A(n55), .Y(n56) );
  INVX2TS U189 ( .A(n21), .Y(n57) );
  INVX2TS U190 ( .A(n57), .Y(n58) );
  INVX2TS U191 ( .A(n57), .Y(n59) );
  INVX2TS U192 ( .A(n16), .Y(n60) );
  INVX2TS U193 ( .A(n60), .Y(n61) );
  INVX2TS U194 ( .A(n60), .Y(n62) );
  INVX2TS U195 ( .A(n20), .Y(n63) );
  INVX2TS U196 ( .A(n63), .Y(n64) );
  INVX2TS U197 ( .A(n63), .Y(n65) );
  INVX2TS U198 ( .A(n22), .Y(n66) );
  INVX2TS U199 ( .A(n66), .Y(n67) );
  INVX2TS U200 ( .A(n66), .Y(n68) );
  INVX2TS U201 ( .A(n18), .Y(n69) );
  INVX2TS U202 ( .A(n69), .Y(n70) );
  INVX2TS U203 ( .A(n69), .Y(n71) );
  INVX2TS U204 ( .A(n16), .Y(n72) );
  INVX2TS U205 ( .A(n61), .Y(n73) );
  INVX2TS U206 ( .A(n18), .Y(n74) );
  INVX2TS U207 ( .A(n70), .Y(n75) );
  INVX2TS U208 ( .A(n20), .Y(n76) );
  INVX2TS U209 ( .A(n64), .Y(n77) );
  INVX2TS U210 ( .A(n21), .Y(n78) );
  INVX2TS U211 ( .A(n58), .Y(n79) );
  INVX2TS U212 ( .A(n22), .Y(n80) );
  INVX2TS U213 ( .A(n67), .Y(n81) );
  INVX2TS U214 ( .A(DI[19]), .Y(n82) );
  INVX2TS U215 ( .A(n82), .Y(n83) );
  INVX2TS U216 ( .A(n82), .Y(n84) );
  INVX2TS U217 ( .A(DI[18]), .Y(n85) );
  INVX2TS U218 ( .A(n85), .Y(n86) );
  INVX2TS U219 ( .A(n85), .Y(n87) );
  INVX2TS U220 ( .A(DI[17]), .Y(n88) );
  INVX2TS U221 ( .A(n88), .Y(n89) );
  INVX2TS U222 ( .A(n88), .Y(n90) );
  INVX2TS U223 ( .A(DI[16]), .Y(n91) );
  INVX2TS U224 ( .A(n91), .Y(n92) );
  INVX2TS U225 ( .A(n91), .Y(n93) );
  INVX2TS U226 ( .A(DI[15]), .Y(n94) );
  INVX2TS U227 ( .A(n94), .Y(n95) );
  INVX2TS U228 ( .A(n94), .Y(n96) );
  INVX2TS U229 ( .A(DI[14]), .Y(n97) );
  INVX2TS U230 ( .A(n97), .Y(n98) );
  INVX2TS U231 ( .A(n97), .Y(n99) );
  INVX2TS U232 ( .A(DI[13]), .Y(n100) );
  INVX2TS U233 ( .A(n100), .Y(n101) );
  INVX2TS U234 ( .A(n100), .Y(n102) );
  INVX2TS U235 ( .A(DI[12]), .Y(n103) );
  INVX2TS U236 ( .A(n103), .Y(n104) );
  INVX2TS U237 ( .A(n103), .Y(n105) );
  INVX2TS U238 ( .A(DI[11]), .Y(n106) );
  INVX2TS U239 ( .A(n106), .Y(n107) );
  INVX2TS U240 ( .A(n106), .Y(n108) );
  INVX2TS U241 ( .A(DI[10]), .Y(n109) );
  INVX2TS U242 ( .A(n109), .Y(n110) );
  INVX2TS U243 ( .A(n109), .Y(n111) );
  INVX2TS U244 ( .A(DI[9]), .Y(n112) );
  INVX2TS U245 ( .A(n112), .Y(n113) );
  INVX2TS U246 ( .A(n112), .Y(n114) );
  INVX2TS U247 ( .A(DI[8]), .Y(n115) );
  INVX2TS U248 ( .A(n115), .Y(n116) );
  INVX2TS U249 ( .A(n115), .Y(n117) );
  INVX2TS U250 ( .A(DI[7]), .Y(n118) );
  INVX2TS U251 ( .A(n118), .Y(n119) );
  INVX2TS U252 ( .A(n118), .Y(n120) );
  INVX2TS U253 ( .A(DI[6]), .Y(n121) );
  INVX2TS U254 ( .A(n121), .Y(n122) );
  INVX2TS U255 ( .A(n121), .Y(n123) );
  INVX2TS U256 ( .A(DI[5]), .Y(n124) );
  INVX2TS U257 ( .A(n124), .Y(n125) );
  INVX2TS U258 ( .A(n124), .Y(n126) );
  INVX2TS U259 ( .A(DI[4]), .Y(n127) );
  INVX2TS U260 ( .A(n127), .Y(n128) );
  INVX2TS U261 ( .A(n127), .Y(n129) );
  INVX2TS U262 ( .A(DI[3]), .Y(n130) );
  INVX2TS U263 ( .A(n130), .Y(n131) );
  INVX2TS U264 ( .A(n130), .Y(n132) );
  INVX2TS U265 ( .A(DI[2]), .Y(n133) );
  INVX2TS U266 ( .A(n133), .Y(n134) );
  INVX2TS U267 ( .A(n133), .Y(n135) );
  INVX2TS U268 ( .A(DI[1]), .Y(n136) );
  INVX2TS U269 ( .A(n136), .Y(n137) );
  INVX2TS U270 ( .A(n136), .Y(n138) );
  INVX2TS U271 ( .A(DI[0]), .Y(n139) );
  INVX2TS U272 ( .A(n139), .Y(n140) );
  INVX2TS U273 ( .A(n139), .Y(n141) );
  INVX2TS U274 ( .A(n160), .Y(n142) );
  INVX2TS U275 ( .A(n53), .Y(n143) );
  OR3X1TS U276 ( .A(n157), .B(n156), .C(CADDRI[10]), .Y(n159) );
  INVX2TS U277 ( .A(n159), .Y(n144) );
  INVX2TS U278 ( .A(n159), .Y(n145) );
  CLKAND2X2TS U279 ( .A(n25), .B(n153), .Y(n23) );
  INVX2TS U280 ( .A(n23), .Y(n146) );
  INVX2TS U281 ( .A(n23), .Y(n147) );
  INVX2TS U282 ( .A(CENI), .Y(n148) );
  INVX2TS U283 ( .A(n148), .Y(n149) );
  INVX2TS U284 ( .A(n148), .Y(n150) );
  INVX2TS U285 ( .A(CADDRI[10]), .Y(n152) );
  NOR2XLTS U286 ( .A(n152), .B(n157), .Y(n153) );
  NOR2XLTS U287 ( .A(n149), .B(WENI), .Y(n151) );
  NAND2X1TS U288 ( .A(CADDRI[8]), .B(n151), .Y(n157) );
  NAND2X1TS U289 ( .A(n153), .B(n156), .Y(n21) );
  NOR4XLTS U290 ( .A(CADDRI[10]), .B(CADDRI[8]), .C(n150), .D(WENI), .Y(n155)
         );
  NAND2X1TS U291 ( .A(n155), .B(n156), .Y(n16) );
  NOR4XLTS U292 ( .A(CENI), .B(CADDRI[8]), .C(WENI), .D(n152), .Y(n154) );
  NAND2X1TS U293 ( .A(n154), .B(n156), .Y(n20) );
  NAND2X1TS U294 ( .A(n25), .B(n154), .Y(n22) );
  NAND2X1TS U295 ( .A(CADDRI[9]), .B(n155), .Y(n18) );
  INVX2TS U296 ( .A(n144), .Y(n19) );
  INVX2TS U297 ( .A(n146), .Y(n158) );
endmodule

