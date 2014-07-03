

# keywalk-gen v1.0 by d3ad0ne

my $charset = $ARGV[0];
my $passlen = $ARGV[1];

sub combine {
    my($length,$chars,$ready)= @_;
    my($char);
        if ($length) {
            foreach $char (@$chars) {
                combine ($length-1, $chars, $ready.$char);
            }
        }
        else {
			print $ready,"\n";
        }
}

if (scalar(@ARGV) == 2) {
	if($ARGV[0] == 1){
		# 3 character set, 120 elements, 15 character passwords - 120^5 = 24,883,200,000 combinations
		@chars=("-pl","!\@#","!QA","#\@!","#ED","#WA","\$ES","\$RF","%RD","%TG","&UJ","&YG","(IJ","(OL",")OK","*IK","*UH",",ki","\@WS","^TF","^YH","_PL","<KI","0ok","123","1qa","2ws","321","3ed","3wa","4es","4rf","5rd","5tg","6tf","6yh","7uj","7yg","8ik","8uh","9ij","9ol","AQ!","aq1","asd","ASD","AW#","aw3","bgt","BGT","cde","CDE","cxz","CXZ","DE#","de3","DR%","dr5","dsa","DSA","edc","EDC","ewq","EWQ","FR\$","fr4","FT^","ft6","GT%","gt5","GY&","gy7","HU*","hu8","HY^","hy6","ik,","IK<","JI(","ji9","JU&","ju7","KI*","ki8","KO)","ko0","LO(","lo9","lp-","LP_","mju","MJU","nhy","NHY","qaz","QAZ","qwe","QWE","rfv","RFV","SE\$","se4","SW\@","sw2","tgb","TGB","ujm","UJM","vfr","VFR","wsx","WSX","xsw","XSW","yhn","YHN","zaq","ZAQ","zxc","ZXC");
	} elsif($ARGV[0] == 2){
		# small 4 character set, 20 elements - 20 Character passwords - 20^5 = 3,200,000 combinations, Even 24 character passes - 20^6 = 64,000,000 combinations
		@chars=("!QAZ","#EDC","\$RFV","%TGB","\@WSX","1qaz","2wsx","3edc","4rfv","5tgb","BGT%","bgt5","CDE#","cde3","VFR\$","vfr4","XSW\@","xsw2","ZAQ!","zaq1");
	} elsif($ARGV[0] == 3){
		# medium 4 characcter set, 76 elements, 20 char passwords - 76^4 = 33,362,176 combinations , 5 combinations - 76^5 = 2,535,525,376 combinations
		@chars=("-pl,","!QAZ","#EDC","\$ESZ","\$RFV","%RDX","%TGB","&UJM","&YGV","(IJN","(OL>",")OKM",")P:?","*IK<","*UHB",",ki8",",lp-",".;[=",".lo9","/;p0","?:P)","\@WSX","^TFC","^YHN","_PL<","+{:>","<KI*","<LP_","=[;.",">:{+",">LO(","0okm","0p;/","1qaz","2wsx","3edc","4esz","4rfv","5rdx","5tgb","6tfc","6yhn","7ujm","7ygv","8ik,","8uhb","9ijn","9ol.","BGT%","bgt5","BHU*","bhu8","CDE#","cde3","CFT^","cft6","MJU&","mju7","MKO)","mko0","NHY^","nhy6","NJI(","nji9","VFR\$","vfr4","VGY&","vgy7","XDR%","xdr5","XSW\@","xsw2","ZAQ!","zaq1","ZSE\$","zse4");
	} elsif($ARGV[0] == 4){
		# large 4 character set, 193 elements, length 16 passwords - 193^4 = 1,387,488,001 combinations 
		@chars=("-pl,","-pL<","!\@#\$","!\@34","!Q\@W","!Q2w","!Qaz","!QAZ","#E\$R","#E4r","#Edc","#EDC","\$Esz","\$ESZ","\$Rfv","\$RFV","%Rdx","%RDX","%Tgb","%TGB","&Ujm","&UJM","&Ygv","&YGV","(Ijn","(IJN","(Ol.","(OL>",")Okm",")OKM",")P:?",")P;/","*Ik,","*IK<","*Uhb","*UHB",",kI*",",ki8",",lp-",",lP_",".;[=",".;{+",".lO(",".lo9","/;P)","/;p0","?:P)","?:p0","\@Wsx","\@WSX","^Tfc","^TFC","^Yhn","^YHN","_Pl,","_PL<","+{:>","+{;.","<KI*","<Ki8","<Lp-","<LP_","=[:>","=[;.",">:[=",">:{+",">LO(",">Lo9","0okm","0oKM","0p:?","0p;/","12#\$","1234","1q\@W","1q2w","1qaz","1qAZ","2wsx","2wSX","3e\$R","3e4r","3edc","3eDC","4esz","4eSZ","4rfv","4rFV","5rdx","5rDX","5tgb","5tGB","6tfc","6tFC","6yhn","6yHN","7ujm","7uJM","7ygv","7yGV","8ik,","8iK<","8uhb","8uHB","9ijn","9iJN","9ol.","9oL>","asdf","asDF","ASdf","bgT%","BGT%","bgt5","BGt5","bhU*","BHU*","bhu8","BHu8","bnm,","BNm,","bnM<","BNM<","cdE#","CDE#","cde3","CDe3","cfT^","CFT^","cft6","CFt6","ghjk","ghJK","GHjk","GHJK","mjU&","MJU&","mju7","MJu7","mkO)","MKO)","mko0","MKo0","nhY^","NHY^","nhy6","NHy6","njI(","NJI(","nji9","NJi9","op[]","OP[]","op{}","OP{}","qwer","qwER","QWer","QWER","qwerty","Qwerty","tyui","tyUI","TYui","TYUI","vfR\$","VFR\$","vfr4","VFr4","vgY&","VGY&","vgy7","VGy7","xdR%","XDR%","xdr5","XDr5","xsW\@","XSW\@","xsw2","XSw2","zaQ!","ZAQ!","zaq1","ZAq1","zsE\$","ZSE\$","zse4","ZSe4","zxcv","zxCV","ZXcv","ZXCV");
	} elsif($ARGV[0] == 5){
		# large 4 character set, 229 elements, length 16 passwords - 229^4 = 2,750,058,481 combinations 
		@chars=("-pl,","-pL<","!#QE","!\$QR","!)MZ","!\@#\$","!\@34","!A2s","!Q\@W","!Q2w","!Qaz","!QAZ","#%ET","#D4f","#E\$R","#E4r","#Edc","#EDC","\$#\@!","\$#RE","\$rfv","\$Esz","\$ESZ","\$R#E","\$Rfv","\$RFV","%G6h","%Rdx","%RDX","%Tgb","%TGB","&J8k","&Ujm","&UJM","&Ygv","&YGV","(Ijn","(IJN","(Ol.","(OL>",")Okm",")OKM",")P:?",")P(O",")P;/","*Ik,","*IK<","*ik,","*I&U","*Uhb","*UHB",",kI*",",ki8",",lp-",",lP_",".;[=",".;{+",".lO(",".lo9","/;P)","/;p0","?:P)","?:p0","\@W!Q","\@Wsx","\@WSX","^Tfc","^TFC","^Yhn","^YHN","_Pl,","_PL<","+{:>","+{;.","<KI*","<Ki8","<Lp-","<LP_","=[:>","=[;.",">:[=",">:{+",">LO(",">Lo9","0okm","0oKM","0p:?","0p;/","0p9o","10mz","12#\$","1234","13qe","1q\@W","1q2w","1qaz","1qAZ","21wq","24wr","2w1q","2wsx","2wSX","3e\$R","3e4r","3edc","3eDC","4321","46ry","4esz","4eSZ","4r3e","4rfv","4rFV","5rdx","5rDX","5tgb","5tGB","6tfc","6tFC","6yhn","6yHN","7ujm","7uJM","7ygv","7yGV","8ik,","8iK<","8uhb","8uHB","8i7u","9ijn","9iJN","9ol.","9oL>","ABcd","adzc","asdf","asDF","ASdf","bgT%","BGT%","bgt5","BGt5","bhU*","BHU*","bhu8","BHu8","bnm,","BNm,","bnM<","BNM<","cdE#","CDE#","cde3","CDe3","cfT^","CFT^","cft6","CFt6","dgcb","DGCB","FDVC","fhvn","ghjk","ghJK","GHjk","GHJK","mjU&","MJU&","mju7","MJu7","mkO)","MKO)","mko0","MKo0","nhY^","NHY^","nhy6","NHy6","njI(","NJI(","nji9","NJi9","op[]","OP[]","op{}","OP{}","qwer","qwER","QWer","QWER","qwerty","Qwerty","rewq","REWQ","saxz","sfxv","tyui","tyUI","TYui","TYUI","vfR\$","VFR\$","vfr4","VFr4","vgY&","VGY&","vgy7","VGy7","xdR%","XDR%","xdr5","XDr5","xsW\@","XSW\@","xsw2","XSw2","zaQ!","ZAQ!","zaq1","ZAq1","zsE\$","ZSE\$","zse4","ZSe4","zxcv","zxCV","ZXcv","ZXCV");
	} else {
		print "Argument 1 must be 1 - 5";
	}
	combine ($passlen, \@chars, '');
	} else {
	print "Keywalk-gen.pl v1.0 by d3ad0ne \n";
	print "Syntax: keywalk-gen.pl [1-5] [1-6] \n";
	print "Argument 1 selects charset to use, argument 2 selects amount of combinations of charset \n\n";
	print "\t Charset 1 = Full    3 character set, 120 elements, 15 character passwords - 120^5 = 24,883,200,000 combinations \n";
	print "\t Charset 2 = Small   4 character set,  20 elements, 24 character passwords -  20^6 =     64,000,000 combinations \n";
	print "\t Charset 3 = Medium  4 character set,  76 elements, 20 character passwords -  76^5 =  2,535,525,376 combinations \n";
	print "\t Charset 4 = Large   4 character set, 193 elements, 16 character passwords - 193^4 =  1,387,488,001 combinations \n";
	print "\t Charset 5 = X-large 4 character set, 229 elements, 16 character passwords - 229^4 =  2,750,058,481 combinations \n";
}

