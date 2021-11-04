start:	
		B	#0x20;

    	B.eq	Label, #0x20;
        B.ne    Label, #0x20;
        B.cs    Label, #0x20;
        B.hs    Label, #0x20;
        B.cc    Label, #0x20;
        B.lo    Label, #0x20;
        B.mi    Label, #0x20;
        B.pl    Label, #0x20;
        B.vs    Label, #0x20;
        B.vc    Label, #0x20;
        B.hi    Label, #0x20;
        B.ls    Label, #0x20;
        B.ge    Label, #0x20;
        B.lt    Label, #0x20;
        B.gt    Label, #0x20;
        B.le    Label, #0x20;
        B.al    Label, #0x20;

    	BR  R0;


test:
		B	#0x20;

    	B.eq	Label, #0x20;
        B.ne    Label, #0x20;
        B.cs    Label, #0x20;
        B.hs    Label, #0x20;
        B.cc    Label, #0x20;
        B.lo    Label, #0x20;
        B.mi    Label, #0x20;
        B.pl    Label, #0x20;
        B.vs    Label, #0x20;
        B.vc    Label, #0x20;
        B.hi    Label, #0x20;
        B.ls    Label, #0x20;
        B.ge    Label, #0x20;
        B.lt    Label, #0x20;
        B.gt    Label, #0x20;
        B.le    Label, #0x20;
        B.al    Label, #0x20;

    	BR  R0;