module digitaldesign1(input i4,i3,i2,i1,i0,j4,j3,j2,j1,j0, output em,k8,k7,k6,k5,k4,k3,k2,k1,k0);

assign em=(i0&j1&j0)|(i1&j1)|(i1&i0&j0);
assign k4=(~i1&~i0)|(~i1&~j1)|(~i1&~j0)|(~i0&~j1)|(~j1&~j0)|(i1&i0&j1&j0);
assign k3=(~i1&i0&~j1&j0)|(~i1&j1&~j0)|(~i0&j1&j0)|(i1&~i0&~j1)|(i1&i0&~j0);
assign k2=(~i1&~i0&j0)|(~i0&~j1&j0)|(~i1&i0&~j0)|(i0&~j1&~j0)|(i1&~i0&j1&~j0);
assign k1=(~i1&i0&j1)|(i0&j1&~j0)|(i1&~i0&j0)|(i0&~j1&j0);
assign k0=(i0&j0);

endmodule
