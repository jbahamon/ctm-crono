;Ultimate 100% - Buster Cannon
[Statedef 13000]
type    = S
movetype= A
physics = S
juggle  = 8
ctrl = 0
anim = 13000
sprpriority = 1
poweradd= 0
facep2 = 1

[State 13000, Explod]
type = Explod
trigger1 = !Time
anim = 13005
ID = 13005
pos = -15,-16
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0
supermovetime = 9999
pausemovetime = 9999


[State 13000, Explod]
type = Explod
trigger1 = !Time
anim = 13005
ID = 13005
pos = 15,-16
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0
supermovetime = 9999
pausemovetime = 9999

[State 13000, Explod]
type = ModifyExplod
trigger1 = NumExplod(13005)
anim = 13005
ID = 13005
scale = 1 + ((GameTime % 3) - 1) * 0.2, 1 + ((GameTime % 3) - 1) * 0.2

[State 13000, ExplodTransition]
type = RemoveExplod
triggerall = Anim = 13000
trigger1 = AnimElem = 2
trigger2 = AnimElem = 3
ID = 13005


[State 13000, Explod]
type = Explod
triggerall = Anim = 13000
trigger1 = AnimElem = 2
anim = 13005
ID = 13005
pos = -11,-10
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0
supermovetime = 9999
pausemovetime = 9999


[State 13000, Explod]
type = Explod
triggerall = Anim = 13000
trigger1 = AnimElem = 2
anim = 13005
ID = 13005
pos = 11,-10
postype = p1
bindtime = -1
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0
supermovetime = 9999
pausemovetime = 9999

[State 2200, Super Pause FX]
type = helper
triggerall = Anim = 13000
trigger1 = AnimElemtime(1) = 10
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 8520, Portrait]
type = Helper
triggerall = Anim = 13000
trigger1 = AnimElemtime(1) = 3
stateno = 7001
name = "Super BG"
ID = 7001
sprpriority = -16
postype = back
ownpal = 1
supermovetime = 99999

[State 2200, Super Pause]
type = SuperPause
triggerall = Anim = 13000
trigger1 = AnimElemtime(1) = 3
time = 45
movetime = 45
anim = -1
sound = S1,1;S a7,2
p2defmul = 1
poweradd = -1000
darken = 0

[State 2201, Fire]
type = Helper
triggerall = Anim = 13000
trigger1 = AnimElem = 3
stateno = 13001
ID = 13001
name = "Beam"
postype = p1
pos = 14, -24
ownpal = 1
persistent = 0
;supermovetime = 9999


[State 1020, End]
type = EnvShake
triggerall = Anim = 13000
trigger1 = AnimElemNo(0) > 2
trigger1 = GameTime % 12 = 0
freq = 120
ampl = 5
time = 12


[State 1020, End]
type = ChangeAnim
triggerall = Anim = 13000
trigger1 = AnimElemNo(0) > 2
trigger1 = !NumHelper(13001)
value = 13006

[State 1020, End]
type = ChangeState
trigger1 = Anim = 13006
trigger1 = !AnimTime
value = 11
ctrl = 1

;Beam
[Statedef 13001]
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 13001
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 2201, var]
type = AngleDraw
trigger1 = 1
value = 30

[State 2201, Vel]
type = PosSet
trigger1 = 1
X = Parent, Pos X + 17 * Facing
Y = Parent, Pos Y - 27
ignorehitpause = 1

[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2202, Beam Head]
type = helper
trigger1 = AnimElem = 3
stateno = 13005
ID = 13005
name = "Beam Base Effect"
postype = p1
pos = -1,1
ownpal = 1
persistent = 0



[State 3055, Hit]
type = hitdef
triggerall = AnimElemNo(0) = [3,13]
triggerall = AnimElemTime(13) < 74
trigger1 = (Abs(AnimElemTime(13)) % 3) = 2
attr = S, HP
damage = Ceil(IfElse(GameTime % 2, 8, 7)*Root, Fvar(39)), 1
animtype = Hard
hitsound = -1
fall.animtype = Hard
hitflag = MAFD
priority = 4, Hit
pausetime = 0, 2
p1sprpriority = 3
guard.dist = 320
sparkno = -1
guard.sparkno = -1
guardsound = -1
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -2, 0
ground.cornerpush.veloff = 0
guard.velocity = -2
air.velocity = -2, -.5
down.velocity = -2, -.5
getpower = 0
givepower = 36, 36
fall = 1
fall.recover = 0
yaccel = 0.5
forcestand = 1
ignorehitpause = 1



[State 2202, Beam Head]
type = helper
trigger1 = AnimElem = 3
stateno = 13002
ID = 13002
name = "Beam Head"
postype = p1
pos = -1,1
ownpal = 1
persistent = 0

[State 2202, Beam Head]
type = helper
trigger1 = AnimElem = 3
stateno = 13003
ID = 13003
name = "Beam Body"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0


[State 2203, RemoveExplod]
type = DestroySelf
trigger1 =  !AnimTime || !PlayerIDExist(var(0)) || Root, StateNo != 13000


;Beam Head
[Statedef 13002]
type    = S
movetype= A
physics = N
juggle  = 3
ctrl = 0
anim = 13002
sprpriority = 3
poweradd = 0
velset = 0, 0

[State 2201, Vel]
type = PosSet
trigger1 = !Time
X = Parent, Pos X - 1 * Facing
Y = Parent, Pos Y + 1
ignorehitpause = 1

[State 2203, Start]
type = AngleDraw
trigger1 = 1
value = 30

[State 2202, Beam Head]
type = helper
trigger1 = !Time
stateno = 13004
ID = 13004
name = "Beam Head Effect"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0


[State 2202, !Shadow]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, Beam Velocity]
trigger1 = !Time
type = varset
var(1) = 15

[State 2203, Vel]
type = VelSet
trigger1 = Time > 0
ignorehitpause = 1
X = Var(1) * 0.86602540378
Y = -Var(1) * 0.5

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 13001 || !AnimTime


; Beam Body
[Statedef 13003]
movetype = I
type = S
anim = 13003
physics = N
juggle  = 0
ctrl = 0
sprpriority = 1
poweradd = 0
velset = 0,0

[State 2202, Trans]
type = Trans
trigger1 = 1
trans = add
ignorehitpause = 1

[State 2202, Trans]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, ExplodScale]
type = AngleDraw
trigger1 = 1
value = 30
scale = 0.01 + 15*(Time)/15.0, 1 
ignorehitpause = 1

[State 2203, ExplodScale]
type = BindToParent
trigger1 = 1
pos = -1,1
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 13001 || !AnimTime

; Beam Head Effect
[Statedef 13004]
movetype = I
type = S
anim = 13004
physics = N
juggle  = 0
ctrl = 0
sprpriority = 3
poweradd = 0
velset = 0,0

[State 2202, Trans]
type = AssertSpecial
trigger1 = !Time
flag = Invisible
ignorehitpause = 1


[State 2202, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2202, Trans]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, ExplodScale]
type = AngleDraw
trigger1 = 1
value = 30
scale = 1.5, 1.5
ignorehitpause = 1

[State 2203, ExplodScale]
type = BindToParent
trigger1 = 1
pos = 10,-7
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 13002

; Beam Base Effect
[Statedef 13005]
movetype = I
type = S
anim = 13004
physics = N
juggle  = 0
ctrl = 0
sprpriority = 3
poweradd = 0
velset = 0,0

[State 2202, Trans]
type = AssertSpecial
trigger1 = !Time
flag = Invisible
ignorehitpause = 1


[State 2202, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = 256, 128
ignorehitpause = 1

[State 2202, Trans]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 2203, Start]
trigger1 = !Time
type = varset
var(0) = Parent, ID

[State 2203, ExplodScale]
type = AngleDraw
trigger1 = 1
value = 210
scale = 1.5, 1.5
ignorehitpause = 1

[State 2203, ExplodScale]
type = BindToParent
trigger1 = 1
pos = -10, 7
ignorehitpause = 1

[State 2203, RemoveExplod]
type = DestroySelf
trigger1 = !PlayerIDExist(var(0)) || Parent, StateNo != 13001


;Ultimate 150% - Burning Attack
[Statedef 13010]
type    = S
movetype= A
physics = S
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= 72
facep2 = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Ultimate 200% - Heat Dome Attack/Finish Buster
[Statedef 13020]
type    = S
movetype= A
physics = S
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= 72
facep2 = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

