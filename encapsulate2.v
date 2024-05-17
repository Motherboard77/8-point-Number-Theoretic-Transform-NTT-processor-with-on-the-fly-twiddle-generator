
module encapsulate2(i,j,t,tprev,start,clock,index1,index2);

input [4:0] i;
input [4:0] j;
input [4:0] t;
input [4:0] tprev;
input start;
input clock;
output [4:0] index1;    //for access x[k]
output [4:0] index2;    //for access x[k+t]

wire [4:0] jmod_out;

jmod JMOD1(j,t,clock,jmod_out,start);
index_GEN BUFINDEX1(j,t,i,jmod_out,tprev,index1,index2);

endmodule

