start:	
		B	#0x20;

    	B.eq	test
        B.ne    test
        B.cs    test
        B.hs    test
        B.cc    test
        B.lo    test
        B.mi    test
        B.pl    test
        B.vs    test
        B.vc    test
        B.hi    test
        B.ls    test
        B.ge    test
        B.lt    test
        B.gt    test
        B.le    test
        B.al    test

    	BR  R0;


test:
		B	#0x20;

    	B.eq	test
        B.ne    test
        B.cs    test
        B.hs    test
        B.cc    test
        B.lo    test
        B.mi    test
        B.pl    test
        B.vs    test
        B.vc    test
        B.hi    test
        B.ls    test
        B.ge    test
        B.lt    test
        B.gt    test
        B.le    test
        B.al    test

    	BR  R0;