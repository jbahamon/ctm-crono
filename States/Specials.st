;===========================================================================
; Special Moves
;===========================================================================

;Lightning
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

;Lightning
[Statedef 1001]
type = S
physics = N
movetype = A
anim = 7100 + IfElse(Root, NumHelper(1020) > 0, 3, 0)
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1001, ParentVar]
type = ParentVarSet
trigger1 = !Time
trigger1 = Anim = 7103
var(22) = 0
ignorehitpause = 1

[State 1100, JumpSnd]
type = Turn
trigger1 = !Time
trigger1 = (Random % 2) > 0
ignorehitpause = 1

[State 1100, JumpSnd]
type = PosSet
trigger1 = !Time
Y = 0
ignorehitpause = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,1
ignorehitpause = 1


[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
trigger1 = Anim = 7100
trigger2 = AnimElem = 4
trigger2 = Anim = 7103
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1.2 + IfElse(Anim = 7103, 0.3, 0), 0.7 + IfElse(Anim = 7103, 0.3, 0)
sprpriority = 0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1001, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = S,SP
damage = Floor(Parent, FVar(39)*82) + IfElse(Anim = 7103, Floor(Parent, FVar(39)*42), 0), 3 + 9 * (Anim = 7103)
animtype = Hard
hitflag = MAF
guardflag = H
pausetime = 0, 30
sparkno = -1
ground.type = High
ground.slidetime = 20
ground.hittime = 20
ground.velocity = -0.4,0
air.velocity  = -0.4, 4
air.fall = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 120, 120, 20
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0 || Parent, Var(22) > 0, 0, 20)

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1001, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1


;Lightning Spark
[Statedef 1901]
type = A
physics = N
movetype = I
anim = 7121
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1001, ParentVar]
type = VelSet
trigger1 = 1
Y = -0.2 * Sin(Time/20.0)
ignorehitpause = 1

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 1001, burst]
type = ChangeState
trigger1 = Root, StateNo = 1003
trigger2 = Time > 600
value = 1002
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = Time > 600
ignorehitpause = 1


;Lightning Burst
[Statedef 1003]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1000
sprpriority = 1
poweradd = 0
facep2 = 1

[State 2010, Super Pause FX]
type = PalFX
trigger1 = time = [0, 32]
add = 256 - 8 * Time, 256 - 8 * Time, 64 - 2 * Time
time = 2

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

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,0
ignorehitpause = 1

[State 1040, End]
type = ChangeState
trigger1 = Time > 30
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Cyclone
[Statedef 1010]
type    = S
movetype= A
physics = S
juggle  = 5
ctrl = 0
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0 ||  NumHelper(1020), 0, 72)
facep2 = 1

[State 1010, Snd]
type = ChangeState
trigger1 = !Time
trigger1 = NumHelper(1020)
value = 1011
ctrl = 0
ignorehitpause = 1
persistent = 0

[State 1010, Snd]
type = PlaySnd
trigger1 = !Time
value = S7110,0
channel = 0
loop = 1
ignorehitpause = 1
persistent = 0

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1010, Jump]
type = VelSet
trigger1 = AnimElemNo(0) > 1
X = 1 + 1*Var(0)
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElemTime(2) = 0 || AnimTime = 0
anim = 7110
ID = 1011
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElem = 3
anim = 7111
ID = 1011
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElem = 4
anim = 7110
ID = 1011
pos = -15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElem = 5
anim = 7111
ID = 1011
pos = 5, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1250, Hit]
type = HitDef
trigger1 = Anim = 1010
trigger1 = AnimElem = 2 || !AnimTime
attr = S, SA
damage = 51, 9
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 7, 7
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.7, -1
air.type = Low
air.velocity = -0.7, -1
air.juggle = 5
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 24, 48)), IfElse(Var(21) > 0, 0, 12)
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.3
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10

[State 1010, Snd]
type = StopSnd
trigger1 = Anim = 1012
channel = 0
ignorehitpause = 1
persistent = 0

[State 1040, End]
type = StateTypeSet
trigger1 = Anim = 1012
movetype = I
persistent = 0

[State 1040, End]
type = ChangeAnim
trigger1 = Time > 30 && !AnimTime
trigger1 = Anim = 1010
value = 1012

[State 1040, End]
type = ChangeState
trigger1 = Anim = 1012 && !AnimTime
value = 0
ctrl = 1


;---------------------------------------------------------------------------
; EX Cyclone
[Statedef 1011]
type    = S
movetype= A
physics = S
juggle  = 5
ctrl = 0
anim = 1011
sprpriority = 1
poweradd = 0
facep2 = 1

[State 1210, Push]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 1010, Snd]
type = PlaySnd
trigger1 = !Time
value = S7110,0
channel = 0
loop = 1
ignorehitpause = 1
persistent = 0

[State 220, Explod]
type = Explod
trigger1 = Anim = 1011
trigger1 = AnimElemTime(2) = 0 || AnimTime = 0
anim = 7110
ID = 1011
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1011
trigger1 = AnimElem = 3
anim = 7111
ID = 1011
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1011
trigger1 = AnimElem = 4
anim = 7110
ID = 1011
pos = -15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1011
trigger1 = AnimElem = 5
anim = 7111
ID = 1011
pos = 5, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State -2, PalFX]
type = PalFX
trigger1 = !NumHelper(11777)
time = 1
add = 100 + Floor(100* Sin(GameTime/10.0)) ,100 + Floor(100* Sin(GameTime/10.0)), 40 + Floor(40* Sin(GameTime/10.0))
mul = 256,256,256
invertall = 0
color = 256
ignorehitpause = 1
;persistent = 

[State 1250, Hit]
type = HitDef
trigger1 = AnimElemTime(2) = 1
attr = S, SA
damage = 26, 2
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5,0
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = ifelse(p2dist x > 10, 4, 3), -2.3
air.type = Low
air.velocity = ifelse(p2dist x > 10, 4, 3), -2.3
air.juggle = 0
ground.cornerpush.veloff = -1;-12.74
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10
p2facing = 1
forcestand = 1

[State 1250, Hit]
type = HitDef
trigger1 = AnimElemTime(4) = 1
attr = S, SA
damage = 26, 2
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5,0
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = Low
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.cornerpush.veloff = -1;-12.74
ground.velocity = -ifelse(p2dist x > 10, 4, 3), -2.3
air.velocity = -ifelse(p2dist x > 10, 4, 3), -2.3
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10
p2facing = -1

[State 1010, Snd]
type = StopSnd
trigger1 = Anim = 1012
channel = 0
ignorehitpause = 1
persistent = 0

[State 1040, End]
type = StateTypeSet
trigger1 = Anim = 1012
movetype = I
persistent = 0

[State 1040, End]
type = ChangeAnim
trigger1 = Time > 30 && !AnimTime
trigger1 = Anim = 1011
value = 1012

[State 1040, End]
type = ChangeState
trigger1 = Anim = 1012 && !AnimTime
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Cyclone (Air)
[Statedef 1015]
type    = A
movetype= A
physics = N
juggle  = 5
ctrl = 0
velset = 0,-2.5
anim = 1010
sprpriority = 1
poweradd = IfElse(Var(21) > 0, 0, 72)
facep2 = 1


[State 1010, Snd]
type = ChangeState
trigger1 = !Time
trigger1 = NumHelper(1020)
value = 1016
ctrl = 0
ignorehitpause = 1
persistent = 0

[State 1010, Snd]
type = PlaySnd
trigger1 = !Time
value = S7110,0
channel = 0
loop = 1
ignorehitpause = 1
persistent = 0

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = ifelse(command = "qcbc", 2, ifelse(command = "qcbb", 1, 0))

[State 1010, Jump]
type = VelAdd
trigger1 = 1
Y = 0.1
ignorehitpause = 1

[State 1010, Jump]
type = VelSet
trigger1 = AnimElemNo(0) > 1
X = 1 + 1*Var(0)
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElemTime(2) = 0 || AnimTime = 0
anim = 7110
ID = 1011
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElem = 3
anim = 7111
ID = 1011
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElem = 4
anim = 7110
ID = 1011
pos = -15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1010
trigger1 = AnimElem = 5
anim = 7111
ID = 1011
pos = 5, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1250, Hit]
type = HitDef
trigger1 = Anim = 1010
trigger1 = AnimElem = 2 || !AnimTime
attr = A, SA
damage = 51, 9
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 7, 7
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -0.7, -1
air.type = Low
air.velocity = -0.7, -1
air.juggle = 5
guard.cornerpush.veloff = 0;-12.74
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 24, 48)), IfElse(Var(21) > 0, 0, 12)
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 1
fall.recovertime = 120
yaccel = 0.3
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10


[State 1010, Snd]
type = StopSnd
trigger1 = Anim = 1012
trigger2 = Vel Y > 0 && Vel Y > -Pos Y
channel = 0
ignorehitpause = 1
persistent = 0


[State 1040, End]
type = StateTypeSet
trigger1 = Anim = 1012
movetype = I
persistent = 0

[State 1040, End]
type = ChangeAnim
trigger1 = Time > 30 && !AnimTime
trigger1 = Anim = 1010
value = 1012

[State 1040, End]
type = ChangeState
trigger1 = Anim = 1012 && !AnimTime
value = 50
ctrl = 0

[State 1000, End]
type = changestate
trigger1 = Vel Y > 0 && Vel Y > -Pos Y
value = 52
ctrl = 1


;---------------------------------------------------------------------------
; EX Cyclone (Air)
[Statedef 1016]
type    = A
movetype= A
physics = N
juggle  = 5
ctrl = 0
anim = 1011
sprpriority = 1
poweradd = 0
velset = 0,0
facep2 = 1


[State -2, PalFX]
type = PalFX
trigger1 = !NumHelper(11777)
time = 1
add = 100 + Floor(100* Sin(GameTime/10.0)) ,100 + Floor(100* Sin(GameTime/10.0)), 40 + Floor(40* Sin(GameTime/10.0))
mul = 256,256,256
invertall = 0
color = 256
ignorehitpause = 1
;persistent = 

[State 1210, Push]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 1010, Snd]
type = PlaySnd
trigger1 = !Time
value = S7110,0
channel = 0
loop = 1
ignorehitpause = 1
persistent = 0

[State 220, Explod]
type = Explod
triggerall = Anim = 1011
trigger1 = AnimElemTime(2) = 0 || AnimTime = 0
anim = 7110
ID = 1011
pos = 15, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
triggerall = Anim = 1011
trigger1 = AnimElem = 3
anim = 7111
ID = 1011
pos = 0, 0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = -1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
triggerall = Anim = 1011
trigger1 = AnimElem = 4
anim = 7110
ID = 1011
pos = -15, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 220, Explod]
type = Explod
triggerall = Anim = 1011
trigger1 = AnimElem = 5
anim = 7111
ID = 1011
pos = 5, -28
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 2
scale = 1,1
sprpriority = -1
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1250, Hit]
type = HitDef
trigger1 = AnimElemTime(2) = 1
attr = S, SA
damage = 26, 2
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5,0
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = 4, -2.3
air.type = Low
air.velocity = 4, -2.3
air.juggle = 0
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10
p2facing = 1
forcestand = 1

[State 1250, Hit]
type = HitDef
trigger1 = AnimElemTime(4) = 1
attr = S, SA
damage = 26, 2
animtype = Hard
guardflag = MA
hitflag = MAF
priority = 4, Hit
pausetime = 5,0
sparkno = -1
hitsound = -1
guardsound = s2, 0
ground.type = Low
air.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -4, -2.3
air.velocity = -4, -2.3
guard.cornerpush.veloff = 0;-12.74
getpower = 0
givepower = 12, 12
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
fall = 1
fall.recover = 0
yaccel = 0.5
airguard.ctrltime = 16
airguard.velocity = -8, -1.5
forcestand = 1
palfx.color = 0
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 10
p2facing = -1

[State 1010, Jump]
type = VelAdd
trigger1 = Anim = 105
Y = 0.4
ignorehitpause = 1

[State 1010, Snd]
type = StopSnd
trigger1 = Time > 30 && !AnimTime
trigger2 = Vel Y > 0 && Vel Y > -Pos Y
channel = 0
ignorehitpause = 1
persistent = 0

[State 1000, End]
type = changestate
trigger1 = Vel Y > 0 && Vel Y > -Pos Y
value = 52
ctrl = 1

[State 1000, End]
type = StateTypeSet
trigger1 = Anim = 105
movetype = I
persistent = 0

[State 1040, End]
type = ChangeAnim
trigger1 = Time > 30 && Anim = 1011 && !AnimTime
value = 105

;---------------------------------------------------------------------------
;Volt Hit
[Statedef 1020]
type    = S
movetype= I
physics = S
juggle  = 3
ctrl = 0
anim = 1020
sprpriority = 1
poweradd = -500
facep2 = 1

[State 1100, JumpSnd]
type = VarSet
trigger1 = !Time
var(0) = 0
ignorehitpause = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,0
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = Time < 70
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

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 3
trigger1 = Var(0) := 1
name = "Self Lightning"
ID = 1021
stateno = 1021
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1000, Pawnch]
type = Helper
trigger1 = Var(0) = 1
trigger1 = NumHelper(1021)
trigger1 = Helper(1021), AnimElemTime(6) = 20
trigger1 = Var(0) := 2
trigger1 = !NumHelper(1020)
name = "Volt Spark"
ID = 1020
stateno = 1022
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = Var(0) = 2
value = 0
ctrl = 1

;Self Lightning
[Statedef 1021]
type = A
physics = N
movetype = I
anim = 7100
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7100,1
ignorehitpause = 1

[State 1001, NoShadow]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = 0, 7
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = 5, -18
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 5
anim = 7101
ID = 200
postype = p1  ;p2,front,back,left,right
pos = -7, -13
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 7,12
removetime = -2
scale = 0.7, 0.7
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = AnimElem = 6
var(22) = 480
persistent = 0
ignorehitpause = 1

[State 1000, burst]
type = Trans
trigger1 = AnimElemTime(6) > 0
trans = addalpha
alpha = 256 - 8 * AnimElemTime(6), 256
ignorehitpause = 1

[State 1001, burst]
type = DestroySelf
trigger1 = AnimElemTime(6) > 32
trigger2 = MoveReversed
ignorehitpause = 1

;Volt Spark
[Statedef 1022]
type = A
physics = N
movetype = I
anim = 7121
ctrl = 0
velset = 0,0
sprpriority = 3

[State 1022, FollowPlayer]
type = PosAdd
trigger1 = 1
X = (ParentDist X - 17)/5.0 
Y = (ParentDist Y - 30 + 10 * Sin(GameTime/20.0))/5.0
ignorehitpause = 1


[State 1022, FollowPlayer]
type = Turn
trigger1 = Facing != Parent, Facing
ignorehitpause = 1

[State 1022, FollowPlayer]
type = AssertSpecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1022, FollowPlayer]
type = DestroySelf
trigger1 = Root, NumHelper(1000)
trigger2 = Root, StateNo = 1011
trigger3 = Root, StateNo = 1031
ignorehitpause = 1

;---------------------------------------------------------------------------
; Spincut
[Statedef 1030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
velset = 0,0
poweradd=IfElse(Var(21) > 0 ||  NumHelper(1020), 0, 115)
sprpriority=1
facep2= 1

[State 1010, Snd]
type = ChangeState
trigger1 = !Time
trigger1 = NumHelper(1020)
value = 1031
ctrl = 0
ignorehitpause = 1
persistent = 0

[State 1100, nothitby]
type = NotHitBy
trigger1 = Anim = 1030 && animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Vel]
type = Velmul
trigger1 = 1
x = 0.9 

[State 1010, Jump]
type = VelAdd
trigger1 = Anim = 1030
trigger1 = AnimElemNo(0) = 3
trigger2 = Anim = 1031
trigger2 = AnimElemNo(0) < 3
Y = 0.45


[State 1010, Jump]
type = VelAdd
trigger1 = Anim = 1031
trigger1 = AnimElemNo(0) = 3
Y = 0.15

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "dfc", 2, IfElse(command = "dfb", 1, 0))

[State 1010, Jump]
type = StateTypeSet
trigger1 = Anim = 1030
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1010, Jump]
type = VelSet
trigger1 = Anim = 1030
trigger1 = AnimElem = 3
X = IfElse(Var(0) = 2, 7, IfElse(var(0) = 1, 4, 2))
Y = IfElse(Var(0) = 2, -10, IfElse(var(0) = 1, -8, -6))

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Anim = 1030
time = 3
ignorehitpause = 1

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = !Time
length = 8
palbright = 0, 0, 0
palcolor = 256
paladd = 1,1,1
palcontrast = 256, 256, 256
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = none
;alpha = 256, 0
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Anim != 1030
time = 0
ignorehitpause = 1

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7010,1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1031
trigger1 = AnimElem = 2
anim = 7130
ID = 1030
pos = 20, 0
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1030, Hit]
type = HitDef
trigger1 = !Time
damage = 77 + var(0) * 7, 10
pausetime = 12, 12
animtype = Back
attr = S, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity =  Ifelse(Var(0) = 2, -3.5, IfElse(Var(0) = 1, -2, -1)), IfElse(Var(0) = 2, -10, IfElse(Var(0) = 1, -8, -6))
air.velocity = Ifelse(Var(0) = 2, -3.5, IfElse(Var(0) = 1, -2, -1)), IfElse(Var(0) = 2, -10, IfElse(Var(0) = 1, -8, -6))
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 20)


[State 1030, Hit]
type = HitDef
trigger1 = Anim = 1030
trigger1 = AnimElem = 3
trigger1 = !movecontact && !movereversed
damage = 28, 7
pausetime = 12, 12
animtype = Back
attr = S, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity =  Ifelse(Var(0) = 2, -3.5, IfElse(Var(0) = 1, -2, -1)), IfElse(Var(0) = 2, -10, IfElse(Var(0) = 1, -8, -6))
air.velocity = Ifelse(Var(0) = 2, -3.5, IfElse(Var(0) = 1, -2, -1)), IfElse(Var(0) = 2, -10, IfElse(Var(0) = 1, -8, -6))
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 20)


[State 1030, Hit]
type = HitDef
trigger1 = Anim = 1031
trigger1 = !movereversed
damage = 32, 8
pausetime = 12, 12
animtype = Hard
ground.type = Low
air.type = Low
attr = S, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity =  -5, -1
air.velocity = -5, -1
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 20)


[State 1100, Anim]
type = ChangeAnim
trigger1 = Anim = 1030
trigger1 = Animelemtime(3) > 0 
trigger1 = Vel Y > IfElse(Var(0) = 2, -5.3, IfElse(Var(0) = 1, -4, -2.7))
value = 1031
persistent = 0

[State 1030, Fall]
type = StateTypeSet
trigger1 = Anim = 1031
trigger1 = AnimElem = 3
movetype = I

[State 1030, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621

; EX Spincut
[Statedef 1031]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1030
velset = 0,0
poweradd=IfElse(Var(21) > 0, 0, 115)
sprpriority=1
facep2= 1

[State -2, PalFX]
type = PalFX
trigger1 = !NumHelper(11777)
time = 1
add = 100 + Floor(100* Sin(GameTime/10.0)) ,100 + Floor(100* Sin(GameTime/10.0)), 40 + Floor(40* Sin(GameTime/10.0))
mul = 256,256,256
invertall = 0
color = 256
ignorehitpause = 1
;persistent = 

[State 1100, nothitby]
type = NotHitBy
trigger1 = Anim = 1030 && animelemtime(3) < 0
value = SCA
time = 1
ignorehitpause = 1

[State 1100, Vel]
type = Velmul
trigger1 = 1
x = 0.9 

[State 1010, Jump]
type = StateTypeSet
trigger1 = Anim = 1030
trigger1 = AnimElem = 3
statetype = A
physics = N

[State 1010, Jump]
type = VelSet
trigger1 = Anim = 1030
trigger1 = AnimElem = 3
X = 8
Y = -10.5

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Anim = 1030
time = 3
ignorehitpause = 1

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = !Time
length = 8
palbright = 0, 0, 0
palcolor = 256
paladd = 1,1,1
palcontrast = 256, 256, 128
palmul = 1, 1, 1
timegap  = 2
framegap = 2
trans = addalpha
alpha = 192, 256
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Anim != 1030
time = 0
ignorehitpause = 1

[State 1030, Jump]
type = PlaySnd
trigger1 = !Time
value = 7010,1

[State 220, Explod]
type = Explod
trigger1 = Anim = 1031
trigger1 = AnimElem = 2
anim = 7130
ID = 1030
pos = 20, 0
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1
persistent = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1030, Hit]
type = HitDef
trigger1 = !Time
damage = 77 + var(0) * 7, 10
pausetime = 12, 12
animtype = Back
attr = S, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity =  -3, -10
air.velocity = -3, -10
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 20)


[State 1030, Hit]
type = HitDef
trigger1 = Anim = 1030
trigger1 = AnimElem = 3
damage = 28, 7
pausetime = 12, 12
animtype = Back
attr = S, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity =  -3, -10
air.velocity = -3, -10
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 1
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 20)


[State 1010, Jump]
type = VelAdd
trigger1 = Anim = 1030
trigger1 = AnimElemNo(0) = 3
trigger2 = Anim = 1031
trigger2 = AnimElemNo(0) < 3
Y = 0.45


[State 1010, Jump]
type = VelAdd
trigger1 = Anim = 1031
trigger1 = AnimElemNo(0) = 3
Y = 0.15

[State 1030, Hit]
type = HitDef
trigger1 = Anim = 1031
damage = 32, 8
pausetime = 12, 12
animtype = Hard
ground.type = Low
air.type = Low
attr = S, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity =  -5, -1
air.velocity = -5, -1
yaccel = 0.5
forcestand = 1
fall = 1
fall.recover = 0
fall.recovertime = 120
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
getpower=IfElse(Var(21) > 0, 0, 20)


[State 1100, Anim]
type = ChangeAnim
trigger1 = Anim = 1030
trigger1 = Animelemtime(3) > 0 
trigger1 = Vel Y > IfElse(Var(0) = 2, -5.3, IfElse(Var(0) = 1, -4, -2.7))
value = 1031
persistent = 0

[State 1030, Fall]
type = StateTypeSet
trigger1 = Anim = 1031
trigger1 = AnimElem = 3
movetype = I

[State 1030, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621

;---------------------------------------------------------------------------
; Slash
[Statedef 1040]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 1040
sprpriority = 1
poweradd = IfElse(Var(21) > 0 || Var(22) > 0, 0, 72)
facep2 = 1

[State 1010, Strength]
type = VarSet
trigger1 = !Time
var(0) = IfElse(command = "qcfc", 2, IfElse(command = "qcfb", 1, 0))

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7040,1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 2
name = "Wind Slash"
ID = 1040
stateno = 1041
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1040, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

;Wind Slash
[Statedef 1041]
type = S
physics = N
movetype = A
anim = 7141
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1001, Speed]
type = VelSet
trigger1 = !Time
X = IfElse(Parent, Var(0) = 2, 3.4, IfElse(Parent, Var(0) = 1, 2.9, 2.5))
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 1043
ignorehitpause = 1

[State 1021, HB]
type = NotHitBy
trigger1 = 1
time = -1
value = , AT
ignorehitpause = 1

[State 1001, Speed]
type = VarSet
trigger1 = !Time
v = 0
value = 0
ignorehitpause = 1

[State 1001, hitdef]
type = HitDef
triggerall = !MoveContact
triggerall = !MoveReversed
trigger1 = Time > 0
priority = 6, Hit
attr = S,SP
damage = Floor(Parent, FVar(39)*50), 4
animtype = Hard
hitflag = MAF
guardflag = H
pausetime = 0, 12
sparkno = S7140
ground.type = High
ground.slidetime = 12
ground.hittime = 12
ground.velocity = -0.4,0
air.velocity  = -0.4, -1
air.fall = 1
p2facing = 1
palfx.invertall = 1
palfx.color = 0
palfx.add = 120, 120, 20
palfx.time = 12
guard.dist = 100
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
getpower = IfElse(Parent, Var(21) > 0, 0, 20)

[State 200, Explod]
type = Explod
triggerall = !MoveHit
trigger1 = MoveContact
trigger2 = MoveReversed
anim = 7140
ID = 1040
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = !Time
anim = 7140
ID = 1040
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 3
ontop = 0
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
fvar(39) = parent, Fvar(39)*0.86
persistent = 0
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = !Time
name = "Slash Trail"
ID = 1042
stateno = 1042
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
ignorehitpause = 1

[State 1001, burst]
type = ChangeState
trigger1 = Time >= 60
trigger2 = MoveReversed
trigger3 = MoveContact
value = 1043
ignorehitpause = 1

;Slash Trail
[Statedef 1042]
type = S
physics = N
movetype = A
anim = 7141
ctrl = 0
velset = 0,0
sprpriority = 2

[State 1001, Speed]
type = VelSet
trigger1 = Time = 3
X = Parent, Vel X

[State 1001, Speed]
type = VarSet
trigger1 = !Time
v = 0
value = Parent, Var(0) + 1

[State 1001, Speed]
type = VarSet
trigger1 = !Time
v = 1
value = 0

[State 1001, Speed]
type = ChangeAnim
trigger1 = !Time
value = (Parent, Anim) + 1

[State 1000, Pawnch]
type = Helper
trigger1 = Time = 2
trigger1 = Var(0) < 4
name = "Slash Trail"
ID = 1042
stateno = 1042
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1001, burst]
type = ChangeState
trigger1 = Parent, StateNo = 1043
value = 1043


;Wind Slash End
[Statedef 1043]
type = S
physics = N
movetype = I
ctrl = 0
sprpriority = 2

[State 1001, ChangeState]
type = VelMul
trigger1 = 1
X = 0.9

[State 1001, ChangeState]
type = ChangeAnim
trigger1 = !Time
trigger1 = Anim = 7141
value = 7146

[State 1001, ChangeState]
type = Trans
trigger1 = Time = [0, 16]
trans = addalpha
alpha = 256 - Time * 16, 128 + Time * 8

[State 1001, End]
type = DestroySelf
trigger1 = Time >= 16
