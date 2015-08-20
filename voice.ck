public class Chanters {
	DelayL delays[20];
	PitShift shifts[20];
	int numVoices;
	Mix2 mix;
	VoicForm rootVoice => mix.left;
	VoicForm blendVoice => mix.right;
	mix => NRev reverb => Echo near => Echo far => Gain g => Pan2 p => dac;
	fun void buildVoices(int voiceCount) {
		for (0 => int j; j < voiceCount; j++) {
			reverb => DelayL d => PitShift ps => near;
			d => delays[j];
			ps => shifts[j];
		}
		voiceCount => numVoices;
	}
	fun void vibratoFreq(float freq) {
		freq => rootVoice.vibratoFreq;
		freq => blendVoice.vibratoFreq;
	}
	fun void voiced(float vd) {
		vd => rootVoice.voiced;
		vd => blendVoice.voiced;
	}
	fun void drift() {
		for (0 => int i; i < numVoices; 2 +=> i) {
			delays[i] @=> DelayL d;
			shifts[i] @=> PitShift p;
			(Math.random2f(0,10))::ms => d.delay;
			Math.random2f(0,1) => p.shift;
		}
	}
	fun float gain(float gain) {
		gain => g.gain;
		return g.gain();
	}
	fun float gain() {
		return g.gain();
	}
	fun void freq(float freq) {
		freq => rootVoice.freq;
		freq => blendVoice.freq;
	}
	fun void phoneme(string phn) {
		phn => rootVoice.phoneme => blendVoice.phoneme;
		0 => mix.pan;
	}
	fun void phoneme(string phn, dur shiftTime) {
		rootVoice.phoneme() => blendVoice.phoneme;
		phn => rootVoice.phoneme;
		-1 => mix.pan;
		for (0 => int i; i < 20; i++) {
			mix.pan() + 0.1 => mix.pan;
			(shiftTime/20) => now;
		}
	}
	fun void phoneme(float phn) {
		(phn*128.0) $ int => int phon;
		rootVoice.phonemeNum(phon);
		1::ms => now;
		blendVoice.phonemeNum(phon);
	}
	fun void pan(float pan) {
		pan => p.pan;
	}
	fun void init(int voices) {
		4::ms => near.delay;
		8::ms => far.delay;
		buildVoices(voices);
		vibratoFreq(0.4);
		voiced(0.8);
		gain(1.0);
		phoneme("eee");
	}
}

[	"eee",  "ihh",  "ehh",  "aaa", 
    "ahh",  "aww",  "ohh",  "uhh", 
    "uuu",  "ooo",  "rrr",  "lll", 
    "mmm",  "nnn",  "nng",  "ngg", 
    "hee",  "hoo",  "hah", 
    "bbb",  "ddd",  "jjj",  "ggg"] @=> string phonemes[];
