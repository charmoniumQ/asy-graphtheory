import nodebox;

// define styles
nodestyle ns0=defaultnodestyle;
nodestyle ns1=nodestyle(FillDrawer(yellow));
nodestyle ns2=nodestyle(FillDrawer(gray));
nodestyle ns3=nodestyle(white, FillDrawer(darkgreen));
nodestyle ns4=nodestyle(FillDrawer(red));
nodestyle ns5=nodestyle(FillDrawer(blue));

// define nodes
node[] a=boxes(10cm, new real[]{13/16, 1/16, 2/16}, "Index", "TI", "RPL");
labelin("15", a[0], NW, NE);
labelin("2", a[1], N);
labelin("1", a[2], NW, NE);
labelin("0", a[2], NE, NW);
node c1=hpack(a[0], a[1], a[2]);
node c2=hbox(10cm, new real[]{13/16, 1/16, 2/16}, "Index", "Long TI", "RPL");
node c3=hbox(10cm, new real[]{13/16, 1/16, 2/16}, new nodestyle[]{ns1, ns2, ns3}, "Index", "Long TI", "RPL");
node c4=vbox(3cm, "$\cdots$", "PDE $n$", "PDE $n+1$", "$\cdots$");
node c5=vbox(1cm, "$\cdots$", "PDE $n$", "PDE $n+1$", "$\cdots$");
node c6=vbox(flush=W, "$\cdots$", "PDE $n$", "PDE $n+1$", "$\cdots$");
node c7=hbox(flush=N, "one line", minipage2("two\par lines"), "flush up");
node c8=vbox("$\cdots$", "PDE $n$", "PDE $n+1$", "$\cdots$");
node c9=vpack(
    hbox("G","D","0","0","0","0","Limit"),
    sbox("Base Address"),
    hbox("1","1","0","1"));
node c10=vpack(
    hbox(new nodestyle[]{ns2, ns2, ns4, ns4, ns4, ns4, ns3}, "G","D","0","0","0","0","Limit"),
    sbox("Base Address",ns1),
    hbox(new nodestyle[]{ns5}, "1","1","0","1"));
node c11=copy(c10);

// dock
vdock(1.5cm, 
    c1, c2, c3, hdock(1cm, c4, c5, c6), hdock(7cm, c7, c8), c9, hdock(3cm, c10, c11)) @ refresh @ deepdraw;

// edge styles
defaultdrawstyle=drawstyle(Arrow);
drawstyle es2=drawstyle(p=red,Arrow);
drawstyle es3=drawstyle(p=green,Arrow);
drawstyle es4=drawstyle(p=blue,Arrow);
drawstyle es5=drawstyle(p=red+dashed,Arrow);

// draw edges
// fraction
(c3--VHV(0.5)--c4).draw();
(c3--VHV(0.5)--c5).draw();
// rel=false
(c3--VHV(0.5, rel=false)--c4).style(es2).draw();
(c3--VHV(0.5, rel=false)--c5).style(es2).draw();
// length
(c5--VHVd(0.5cm)--c7).style(es3).draw();
(c5--VHVd(0.5cm)--c8).style(es3).draw();
(c5--VHVd(0.5cm)--c9).style(es3).draw();
// large dist and minus dist
(c9--HVHd(0cm)--c10).draw();
(c9--HVHd(1cm)--c10).l("reference").style(es2).draw();
(c9--HVHd(5cm)--c10).style(es3).draw();
(c9--HVHd(-4cm)--c10).style(es4).draw();

