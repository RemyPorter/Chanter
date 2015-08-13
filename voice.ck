ADSR env;
Mix2 mixer => NRev rev => Echo near => Echo far => dac;
rev => DelayL d1 => env;
rev => DelayL d2 => env;
rev => DelayL d3 => env;

VoicForm blend => mixer.left;
VoicForm voc => mixer.right;

4::ms => near.delay;
8::ms => far.delay;

0.25 => voc.vibratoFreq => blend.vibratoFreq;
1.0 => voc.voiced => blend.voiced;
8::ms => d1.delay;
6::ms => d2.delay;
3::ms => d3.delay;

(100::ms,100::ms,0.8,200::ms) => env.set;

[	"eee",  "ihh",  "ehh",  "aaa", 
    "ahh",  "aww",  "ohh",  "uhh", 
    "uuu",  "ooo",  "rrr",  "lll", 
    "mmm",  "nnn",  "nng",  "ngg", 
    "hee",  "hoo",  "hah", 
    "bbb",  "ddd",  "jjj",  "ggg"] @=> string phonemes[];


0.25 => rev.mix;
220 => voc.freq;
Math.random2(0,1) => float bfon;
0 => int bottom => int top;
while (true) {
	Math.ceil(bfon) $ int=> top;
	Math.floor(bfon)$ int => bottom;
	phonemes[top] => voc.phoneme;
	phonemes[bottom] => blend.phoneme;
	top - bottom => mixer.pan;
	env.keyOn();
	2::second => now;
	0.1 +=> bfon;
	env.keyOff();
	500::ms => now;
}

