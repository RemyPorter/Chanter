public class Choir {
	Chanters a1, a2, b1, b2, c1, c2, d1, d2;
	3.0/2.0 => float i5;
	5.0/4.0 => float i3;
	10.0/9.0 => float m3;
	15.0/8.0 => float m7;

	fun float fifthUp(float freq) {
		return freq * i5;
	}
	fun float thirdUp(float freq) {
		return freq * i3;
	}
	fun float fifthDown(float freq) {
		return freq / i5;
	}
	fun float thirdDown(float freq) {
		return freq / i3;
	}
	fun float octaveUp(float freq) {
		return freq * 2;
	}
	fun float octaveDown(float freq) {
		return freq / 2;
	}
	fun float mThirdUp(float freq) {
		return freq * m3;
	}
	fun float mThirdDown(float freq) {
		return freq / m3;
	}
	fun float seventhUp(float freq) {
		return freq * m7;
	}
	fun float capped(float val) {
		if (val > 1.0) return 1.0;
		return val;
	}

	fun void gain(float gain) {
		gain => a1.gain;
		gain => a2.gain;
		gain => b1.gain;
		gain => b2.gain;
		gain => c1.gain;
		gain => c2.gain;
		gain => d1.gain;
		gain => d2.gain;
	}

	fun void phoneme(float phoneme) {
		phoneme => a1.phoneme;
		phoneme => a2.phoneme;
		phoneme => b1.phoneme;
		phoneme => b2.phoneme;
		phoneme => c1.phoneme;
		phoneme => c2.phoneme;
		phoneme => d1.phoneme;
		phoneme => d2.phoneme;
	}
	fun void pan(float pan) {
		pan => a1.pan;
		pan => a2.pan;
		pan => b1.pan;
		pan => b2.pan;
		pan => c1.pan;
		pan => c2.pan;
		pan => d1.pan;
		pan => d2.pan;
	}

	fun void freq(float freq) {
		freq => a1.freq; freq => a2.freq;
		fifthUp(freq) => b1.freq;
		fifthUp(freq) => b2.freq;
		mThirdUp(freq) => c1.freq;
		mThirdUp(freq) => c2.freq;
		seventhUp(freq) => d1.freq;
		seventhUp(freq) => d2.freq;
	}

	fun void vibratoFreq(float freq) {
		freq => a1.vibratoFreq;
		freq => b1.vibratoFreq;
		freq => c1.vibratoFreq;
		freq => d1.vibratoFreq;
		freq => thirdDown => float third;
		third =>a2.vibratoFreq;
		third => b2.vibratoFreq;
		third => c2.vibratoFreq; 
		third => d2.vibratoFreq;
	}

	fun void voiced(float v) {
		v => thirdUp => float vu;
		vu => capped => vu;
		v => a1.voiced; vu => a2.voiced;
		v => b1.voiced; vu => b2.voiced;
		v => c1.voiced; vu => c2.voiced;
		v => d1.voiced; vu => d2.voiced;
	}

	fun void init(int voices) {
		a1.init(voices); a2.init(voices);
		b1.init(voices); b2.init(voices);
		c1.init(voices); c2.init(voices);
		d1.init(voices); d2.init(voices);
	}

	fun void toggleA1() {
		if (a1.playing()) { a1.keyOff(); }
		else { a1.keyOn(); }
	}

	fun void toggleA2() {
		if (a2.playing()) { a2.keyOff(); }
		else { a2.keyOn(); }
	}

	fun void toggleB1() {
		if (b1.playing()) { b1.keyOff(); }
		else { b1.keyOn(); }
	}

	fun void toggleB2() {
		if (b2.playing()) { b2.keyOff(); }
		else { b2.keyOn(); }
	}

	fun void toggleC1() {
		if (c1.playing()) { c1.keyOff(); }
		else { c1.keyOn(); }
	}

	fun void toggleC2() {
		if (c2.playing()) { c2.keyOff(); }
		else { c2.keyOn(); }
	}

	fun void toggleD1() {
		if (d1.playing()) { d1.keyOff(); }
		else { d1.keyOn(); }
	}

	fun void toggleD2() {
		if (d2.playing()) { d2.keyOff(); }
		else { d2.keyOn(); }
	}

	
}