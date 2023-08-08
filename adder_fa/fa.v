module fa(a,b,cin,sum,carry);
 input wire  a;
 input wire  b;
 input wire  cin;
 output wire sum;
 output wire carry;
 wire so;
 wire co;
 wire c1;

 assign so=a^b;
 assign co=a&b;
 assign c1=so&cin;
 assign carry=c1|co;
 assign sum=so^cin;
endmodule

  