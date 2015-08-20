# Chanter - Vocaloid
This is a ChucK synth that uses OSC to control the sounds. It's currently designed to be controlled by the Automat5 template in [TouchOSC](http://hexler.net/software/touchosc).

The basic structure of the voices- and this still needs a lot of tweaking- are that a pair of drifting voices are turned into a chorus through a set of delays and pitch shifts. This is wrapped up in a class called "Chanters".

To run it, simply use `chuck run.ck`, which launches the OSC server on port 8081.

You can then connect any OSC controller to that server, and control the voices.

## Messages

* */3/xyM_r*,f(0,1),f(0,1) - controls gain and phoneme spoken
* */3/xyM_l*,f(0,1),f(0,1) - controls pitch and the "voiced" property of the synth
* */faderM*,f(0,1) - controls the pan.