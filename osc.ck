OscIn server;
8081 => server.port;
"/3/xyM_r" => string rightXY => server.addAddress;
"/3/xyM_l" => string leftXY => server.addAddress;
"/faderM" => string fader => server.addAddress;
"/toggleA_1" => string t_a1 => server.addAddress;
"/toggleA_2" => string t_a2 => server.addAddress;
"/toggleB_1" => string t_b1 => server.addAddress;
"/toggleB_2" => string t_b2 => server.addAddress;
"/toggleC_1" => string t_c1 => server.addAddress;
"/toggleC_2" => string t_c2 => server.addAddress;
"/toggleD_1" => string t_d1 => server.addAddress;
"/toggleD_2" => string t_d2 => server.addAddress;

OscMsg msg;

Choir c;
10 => c.init;
while (true) {
	server => now;
	while(server.recv(msg)) {
		decode(msg);
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

fun void decode(OscMsg msg) {
	if (msg.address == leftXY) {
		lxy(msg.getFloat(1), msg.getFloat(0)); 
	} else if (msg.address == rightXY) {
		rxy(msg.getFloat(1), msg.getFloat(0)); 
	} else if (msg.address == fader) {
		fade(msg.getFloat(0)); 
	} else if (msg.address == t_a1) {
		c.toggleA1(); 
	} else if (msg.address == t_a2) {
		c.toggleA2(); 
	} else if (msg.address == t_b1) {
		c.toggleB1(); 
	} else if (msg.address == t_b2) {
		c.toggleB2(); 
	} else if (msg.address == t_c1) {
		c.toggleC1(); 
	} else if (msg.address == t_c2) {
		c.toggleC2(); 
	} else if (msg.address == t_d1) {
		c.toggleD1(); 
	} else if (msg.address == t_d2) {
		c.toggleD2(); 
	} 
}

