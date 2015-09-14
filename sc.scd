s = Server.local; // assign it to interpreter variable 's'
s.boot;

(
SynthDef("sine", { arg freq;
	var osc;
	osc = SinOsc.ar(freq, 0, 0.1); // 800 Hz sine oscillator
	Out.ar(0, osc); // send output to audio bus zero.
}).send(s);
)

s.sendSynthDef("sine");
s.sendMsg("/s_new", "sine", x = s.nextNodeID, 1, 1, "freq", 440);
s.sendMsg("/n_free", x);
