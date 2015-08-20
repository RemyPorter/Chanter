OscIn server;
8081 => server.port;
"/3/xyM_r" => string rightXY => server.addAddress;
"/3/xyM_l" => string leftXY => server.addAddress;
"/faderM" => string fader => server.addAddress;
OscMsg msg;
Chanters c;
10 => c.init;
while (true) {
	server => now;
	while(server.recv(msg)) {
		if (msg.address == leftXY) {
			lxy(msg.getFloat(1), msg.getFloat(0));
		} else if (msg.address == rightXY) {
			rxy(msg.getFloat(1), msg.getFloat(0));
		} else if (msg.address == fader) {
			fade(msg.getFloat(0));
		}
	}
}

fun void lxy(float x, float y) {
	y + 0.1 => c.gain;
	x => c.phoneme;
}
fun void rxy(float x, float y) {
	1 + y * 1000 => c.freq;
	x => c.voiced;
}
fun void fade(float p) {
	c.pan(p*2-1);
}