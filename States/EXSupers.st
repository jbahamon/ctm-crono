[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = IfElse(Var(21) > 0 ||  NumHelper(1020), 0, 72)
facep2 = 1


[State -2, PalFX]
type = PalFX
trigger1 = !NumHelper(11777)
trigger1 =  NumHelper(1020)
time = 1
add = 100 + Floor(100* Sin(GameTime/10.0)) ,100 + Floor(100* Sin(GameTime/10.0)), 40 + Floor(40* Sin(GameTime/10.0))
mul = 256,256,256
invertall = 0
color = 256
ignorehitpause = 1
;persistent = 

[State 200, Explod]
type = Explod
trigger1 = Time < 50
trigger1 = GameTime % 5 = 0
anim = 7102
ID = 1000
postype = p1  ;p2,front,back,left,right
bindtime = 1
vel = 0,-1 + (Random/1000.0)*0.7
accel = 0,-0.3
random = 27,7
sprpriority = 2
removetime = -2
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,0
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 3
name = "Lightning"
ID = 1000
stateno = 1001
pos = 40 + 70*Var(0), 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 2010, Super Pause FX]
type = PalFX
trigger1 = time = [0, 32]
add = 256 - 8 * Time, 256 - 8 * Time, 64 - 2 * Time
time = 2
[State 1040, End]
type = ChangeState
trigger1 = Time > 30
value = 0
ctrl = 1
