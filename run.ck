Machine.add("voice.ck");

if (me.args() > 0 && me.arg(0) == "test") {
	Machine.add("voicetest.ck");
} else {
	Machine.add("choir.ck");
	Machine.add("osc.ck");
}