AutoCrack
=========

______
STEP 1

local_domain_enum...

______
STEP 2

Get hahses "SAM/SYSTEM, ntds.dit/SYSTEM, hashdump, unshadow, type-7, ios-config, etc..."

______
STEP 3

Extract Hashes and Format from various sources...

ntds.dit/SYSTEM
	1. libesedb-20120102
https://github.com/libyal/libesedb/wiki/Building
~/tools/ntds.dit/libesedb-20120102/esedbtools
./esedbexport ntds.dit

	2. NTDSXtract_1.0
		a. dshashes.py
wget http://ptscripts.googlecode.com/svn/trunk/dshashes.py

python dsusers.py <DATATABLE FILE><LINKTABLE FILES><DIRECTORY TO WORK IN>–passwordhashes –lmoutfile <LM OUT FILE> –ntoutfile <NTLM OUT FILE> –pwdformat john –syshive <SYSTEM FILE>

sudo pip install pycrypto

Replace blank lm hashes
sed 's/aad3b435b51404eeaad3b435b51404ee/**********NO_PASSWORD!**********/'

_______
STEP 4

Crack Passwords...

JtR
	1. wordlists
		rockyou.txt -rules
		wordlist.txt -rules
	2. LM2NT
		JtR
http://www.openwall.com/lists/john-users/2006/07/08/2

This post explains how to crack NT hash from LM password with john-the-ripper (need to modify john's configuration file to use [List.Rules:NT] se
ction).
        john -show pwfile | cut -d: -f2 > cracked
        john -w=cracked -rules -format=nt pwfile
        john -show -format=nt pwfile

One known problem with this approach is that it'll fail for passwords containing colons (':' is cut delimiter).

This problem does not impact "lm2ntcrack".

		lm2ntcrack.rb - MSF
/usr/share/metasploit-framework/tools# ./lm2ntcrack.rb -h

Usage: ./lm2ntcrack.rb -t type <options>

OPTIONS:

    -a <opt>  The hash to crack
    -c <opt>  The LM/NTLM Client Challenge (NETNTLM2_SESSION/NETLMv2/NETNTLMv2/ type only)
    -d <opt>  The domain (machine) name    (NETLMv2/NETNTLMv2 type only)
    -h        Display this help information
    -l <opt>  The list of password to check against an hash
    -p <opt>  The password 
    -s <opt>  The LM/NTLM Server Challenge (NET* type only)
    -t <opt>  The type of hash to crack : HALFLM/LM/NTLM/HALFNETLMv1/NETLMv1/NETNTLMv1/NETNTLM2_SESSION/NETLMv2/NETNTLMv2
    -u <opt>  The user name                (NETLMv2/NETNTLMv2 type only)

This tool can be use in 3 ways whatever type is choosen
-If only a password (-p) is provided, it will display the hash.
-If a password (-p) and an hash (-a) is provided, it will test the password against the hash.
-If a list of password (-l) is provided and an hash (-a), it will try to bruteforce the hash 

perl /root/Desktop/NTDS/lm2ntcrack/lm2ntcrack.pl -l="AZERTY123$" -p | grep -e DICO | cut -d " " -f 2 > /root/Desktop/NTDS/wordlist_LM_AZERTY123$.txt



		LM2NTCRACK - NEW
wget http://www.atenlabs.com/lm2ntcrack-viss.txt
mv lm2ntcrack-viss.txt lm2ntcrack-viss.pl

Usage: lm2ntcrack-viss.pl [ -v | -q ] [ -h ] [ -p ] < -l=Clear_LM_Password -n=MY_NT_HASH > | < -f=MY_JOHN_OUTPUT_FILE >
                -h, --help                                              : This (help) message
                -v, --verbose                                           : Verbose output (Optionnal)
                -q, --quiet                                             : No output debug (Optionnal)
                -p, --print                                             : Print generated DICO from LM PASSWORD (Optionnal)
                -f=file, --file=file                                    : Full path to "John the ripper" output file (cmd: john --show dumpfile > <file>)
                -n=hash, --nthash=hash                                  : NT hash to CRACK (Mandatory with -l option)
                -l=Clear_Text_LM_Pwd, --lmpass=Clear_Text_LM_Pwd        : Cracked LM password

Example 1: perl lm2ntcrack-viss.pl -v -f="<JOHN-THE-RIPPER OUTPUT FILE>"

Example 2: john --format=LM --show myDump > ./crackedLM && perl lm2ntcrack-viss.pl -q -f=./crackedLM

Example 3: perl lm2ntcrack-viss.pl -v -l="AZERTY123$" -n="81CD1A1C4CBCE05C0F8D411ACEC7587F"

Example 4: perl lm2ntcrack-viss.pl -v -l="AZERTY123$" -p

john 2012_john_dshashes_sans_blank_lm.txt --show --format=lm > 2012_cracked_lm.txt && perl ./lm2ntcrack/lm2ntcrack-viss.pl -f=2012_cracked_lm.txt


 		LM2NTCRACK - OLD "Works with 2009 ver JtR"
wget http://www.xmco.fr/lm2ntcrack/lm2ntcrack-current.tgz
tar -zxvf lm2ntcrack-current.tgz

	3. Keyboardwalk
https://source/redteam/penetration-testing-scripts/blob/master/password_cracking/keywalk-gen.pl

perl /pentest/penetration-testing-scripts/password_cracking/keywalk-gen.pl -h
Keywalk-gen.pl v1.0 by d3ad0ne 
Syntax: keywalk-gen.pl [1-5] [1-6] 
Argument 1 selects charset to use, argument 2 selects amount of combinations of charset 

	 Charset 1 = Full    3 character set, 120 elements, 15 character passwords - 120^5 = 24,883,200,000 combinations 
	 Charset 2 = Small   4 character set,  20 elements, 24 character passwords -  20^6 =     64,000,000 combinations 
	 Charset 3 = Medium  4 character set,  76 elements, 20 character passwords -  76^5 =  2,535,525,376 combinations 
	 Charset 4 = Large   4 character set, 193 elements, 16 character passwords - 193^4 =  1,387,488,001 combinations 
	 Charset 5 = X-large 4 character set, 229 elements, 16 character passwords - 229^4 =  2,750,058,481 combinations 

_______
STEP 5

No Rest for the Wicked...Consolidate and Run Again!
STEPs 3-5
_______
STEP 6
Analyze and Present the Data. 

Now we need to provide highlights of the data. We use a tool called pipal. This is a ruby script that takes an input file of the cracked passwords and returns useful metrics that can be incorporated into reports or presentations very easily.

Get pipal.
git clone https://github.com/digininja/pipal

cd pipal && ruby pipal.rb demo_pipal_in.txt >> pipal_out.txt

_______
STEP NEXT

Test	"john pwdump.txt -format=nt -loopback=john.pot -rules=nt"
