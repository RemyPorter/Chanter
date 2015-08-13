ADSR env;
Mix2 mixer => NRev rev => Echo near => Echo far => dac;
rev => DelayL d1 => PitShift p1 => near;
rev => DelayL d2 => PitShift p2 => near;
rev => DelayL d3 => PitShift p3 => near;

VoicForm blend => mixer.left;
VoicForm voc => mixer.right;

4::ms => near.delay;
8::ms => far.delay;

0.4 => voc.vibratoFreq => blend.vibratoFreq;
1.0 => voc.voiced => blend.voiced;
8::ms => d1.delay;
6::ms => d2.delay;
3::ms => d3.delay;
0.1 => p1.shift;
0.9 => p2.shift;
-0.2 => p3.shift;

(100::ms,100::ms,0.8,200::ms) => env.set;

[	"eee",  "ihh",  "ehh",  "aaa", 
    "ahh",  "aww",  "ohh",  "uhh", 
    "uuu",  "ooo",  "rrr",  "lll", 
    "mmm",  "nnn",  "nng",  "ngg", 
    "hee",  "hoo",  "hah", 
    "bbb",  "ddd",  "jjj",  "ggg"] @=> string phonemes[];


0.25 => rev.mix;
110 => voc.freq => blend.freq => float baseFreq;
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
	1 +=> baseFreq;
	baseFreq => voc.freq => blend.freq;
}

