;Hyper Dash / Z Cancel
[Statedef 11000]
type    = U
movetype= A
physics = N
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= -IfElse(PrevStateNo = 10212, 25, 50)
anim = IfElse(PrevStateNo = 10212, 11001, 11000)
facep2 = 1


[State 3111, X]
Type = PlaySnd
Trigger1 = AnimElem = 2
value = S7020,5
ignorehitpause = 1

[State 3111, X]
Type = NotHitBy
Trigger1 = AnimElemNo(0) = [2,3]
value =, AP
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElemNo(0) = [2,3]
trigger1 = AnimElemTime(2) % 4 = 0
anim = 11002
ID = 11000
pos = 15, -13
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = -1
trans=addalpha
alpha= 150,0
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 200, Explod]
type = Explod
trigger1 = AnimElemNo(0) = [2,3]
trigger1 = AnimElemTime(2) % 4 = 0
anim = 11002
ID = 11000
pos = 15, -13
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1,1
sprpriority = 2
trans=addalpha
alpha= 120,256
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


;Thanks to Bia/SMEE for the heat-seeking projectile code :) 

[State 3111, X]
Type = VarSet
Trigger1 = 1
fvar(0) = (EnemyNear(0), Pos X- Pos X) * Facing
ignorehitpause = 1

[State 3111, Y]
Type = VarSet
trigger1 = 1
fvar(1) = (EnemyNear(0), pos Y - Pos Y +Enemynear(0),Const(size.mid.pos.y))
ignorehitpause = 1

[State 3111, Vector Length]
Type = VarSet
trigger1 =1
fvar(2) = Exp(0.5*ln((fvar(0) * fvar(0))+(fvar(1) * fvar(1))))
ignorehitpause = 1

[State 3111, vel]
type = Velset
trigger1 = AnimElemNo(0) = 2
trigger1 = FVar(0) > 0
trigger1 = !MoveContact
x = Fvar(0)/fvar(2) * 9
y = FVar(1)/fvar(2) * 9
ignorehitpause = 1


[State 3111, vel]
type = Velset
trigger1 = AnimElemNo(0) = 2
trigger1 = FVar(0) > 0
trigger1 = MoveContact
x = Fvar(0)/fvar(2) * 3
y = FVar(1)/fvar(2) * 3
ignorehitpause = 1

[State 1020, End]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 1020, End]
type = Null;VelMul
trigger1 = AnimElem = 3
trigger2 = MoveContact
Y = 0.5
X = 0.5

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = A, SA                     ;Attribute: Standing, Normal Attack
damage = 42, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 6, 22                 ;Time attacker pauses, time opponent shakes
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = -7, -12               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7100,1                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 14             ;Time that the opponent slides back
ground.hittime  = 25             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 25
ground.velocity = -3,0            ;Velocity at which opponent is pushed
airguard.velocity = -.5, 0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -2, 0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
getpower = 0,0
givepower = 36, 36
envshake.time = 6
envshake.freq = 120
envshake.ampl = 3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1

;Suprise Attack - Rapid Sword Stream?
[Statedef 11010]
type    = S
movetype= A
physics = N
juggle  = 8
ctrl = 0
anim = 11010
sprpriority = 1
poweradd= 72
facep2 = 1
velset = 0,0


[State 3111, X]
Type = PlaySnd
Trigger1 = AnimElem = 2
value = S7010,1
ignorehitpause = 1



[State 3111, X]
Type = AssertSpecial
Trigger1 = AnimElemNo(0) = [6,7]
flag = noshadow
ignorehitpause = 1


[State 3111, X]
Type = VelSet
Trigger1 = AnimElem = 3
X = 3
ignorehitpause = 1

[State 3111, X]
Type = PlayerPush
Trigger1 = AnimElemNo(0) = 7
value = 0
ignorehitpause = 1

[State 3111, X]
Type = VelSet
Trigger1 = AnimElem = 7
X = 1.6
ignorehitpause = 1


[State 3111, X]
Type = StateTypeSet
Trigger1 = AnimElem = 8
statetype = S
physics = S
ignorehitpause = 1


[State 2102, Sparks]
type = PlaySnd
trigger1 = AnimElemNo(0) = 7
trigger1 = AnimElemTime(7) % 10 = 0
trigger1 = AnimElemTime(7) < 40
value = S7040, (Random % 4)

[State 2102, Sparks]
type = Explod
trigger1 = AnimElemNo(0) = 7
trigger1 = AnimElemTime(7) % 6 = 3
trigger1 = AnimElemTime(7) < 40
anim = 7000 + (random % 2)
ID = 11010
sprpriority = 5
postype = p1
pos = 5, -15
random = 5, 5
facing = IfElse(Random % 2, 1, -1)
vfacing = IfElse(Random % 2, 1, -1)
ownpal = 1
ontop = 1
removetime = -2

[State 200, 1]
type = HitDef
trigger1 = AnimElem = 7
attr = S, SA                     ;Attribute: Standing, Normal Attack
damage = 82, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 0, 32                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
;Y-offset for the spark rel. to p1
hitsound = -1                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 14             ;Time that the opponent slides back
ground.hittime  = 25             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 25
ground.velocity = -2,-7            ;Velocity at which opponent is pushed
airguard.velocity = -1, -3     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -2, -7           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
getpower = 72,36
givepower = 36, 36
envshake.time = 32
envshake.freq = 120
envshake.ampl = 6
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
numhits = 10


[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Blitz Attack - Change the Future
[Statedef 11020]
type    = S
movetype= A
physics = N
juggle  = 8
ctrl = 0
sprpriority = 2
poweradd= -25
velset = 6,0
anim = 11020
facep2 = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1
channel = 0

[State 210, 1]
type = VelSet
trigger1 = AnimElem = 5
X = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimelemTime(6) = 0
name = "Ki Blast"
ID = 11020
stateno = 11021
pos = 18, -17
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Ki Burst
[Statedef 11021]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4


[State 10227, Anim]
type = PlaySnd
trigger1 = !Time 
value = S7100,1

[State 10227, Anim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 11021
value = 11021

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
trigger1 = !(target, time) && target, movetype = H
fvar(39) = parent, Fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 11021
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = PrevStateNo != 11021
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1


[State 1005, HB]
type = nothitby
trigger1 = PrevStateNo = 11021
time = -1
value = , AA, AP, AT
ignorehitpause = 1

[State 1005, timevar]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1055, Hit]
type = hitdef
trigger1 = !(PrevStateNo = 11021)
priority = 4, Hit
attr = S, SP
damage = ceil(127 * root, fvar(39)), 7
animtype = Hard
hitflag = MAF
guardflag = MA
pausetime = 0, 8
sparkno = 10226
sparkxy = -10, 0
hitsound = S7020,5
guardsound = s2, 0
ground.type = High
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -5, -1
guard.velocity = -0.5
ground.cornerpush.veloff = 0
air.velocity = -5, -1
down.hittime = 20
down.velocity = 0, 0
fall = 1
air.fall = 1
fall.recover = 1
fall.recovertime = 16
getpower = 0,0
givepower = 36, 36
p1sprpriority = 4
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 10
envshake.freq = 120
envshake.ampl = 8
airguard.ctrltime = 16
airguard.velocity = -2,-.5
forcestand = 1
persistent = 0

[State 1006, End]
type = destroyself
trigger1 = !AnimTime
trigger2 = Root, StateNo != 11020
ignorehitpause = 1

; Sleeper Hold - Shining Slash
[Statedef 11030]
type    = S
movetype= A
physics = N
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= -50
facep2 = 1
anim = 11030


[State 1010, Jump]
type = VelAdd
trigger1 = AnimElemNo(0) > 1
Y = 0.35

[State 1010, Jump]
type = StateTypeSet
trigger1 = AnimElem = 2
statetype = A
physics = N

[State 1010, Jump]
type = VelSet
trigger1 = AnimElem = 2
X = 3
Y = -3

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = AnimElemNo(0) < 3
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
trigger1 = Anim != 11030
time = 0
ignorehitpause = 1

[State 220, Explod]
type = Explod
trigger1 = AnimElem = 3
anim = 7130
ID = 1030
pos = 20, 0
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 7
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
damage = 8, 0
pausetime = 0, 0
animtype = Back
attr = A, SA 
guardflag = M
hitflag = MAF
sparkno = -1
hitsound = s7040, 3
guard.dist = 0
ground.velocity = 0,0
air.velocity = 0,0
forcestand = 1
fall = 0
persistent = 0
palfx.add=200,200,200
palfx.mul=256,256,256
palfx.time=18
envshake.time = 6
envshake.freq = 120
envshake.ampl = 4
ID = 11030
getpower=0,0

[State 11030, Drop]
type = TargetDrop
trigger1 = NumTarget(11030) > 1
keepone = 1
ignorehitpause = 1

[State 1030, Landing]
type = TargetBind
trigger1 = NumTarget
pos = 40, -20
ignorehitpause = 1

[State 11030, Change]
type = TargetState
trigger1 = NumTarget(11030)
value = 11032
ignorehitpause = 1


[State 2102, Sparks]
type = ChangeAnim
trigger1 = NumTarget(11030)
value = 11031
ignorehitpause = 1

[State 11030, Change]
type = ChangeState
trigger1 = NumTarget(11030)
value = 11031
ignorehitpause = 1

[State 1030, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Sleeper Hold - Success
[Statedef 11031]
type    = A
movetype= A
physics = N
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= 0
velset = 0,0
facep2 = 1

[State 1010, Jump]
type = ChangeAnim
trigger1 = !NumTarget && AnimElemNo(0) < 23
value = 11032
elem = 23


[State 1030, Landing]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElemNo(0) = [2,20]
trigger1 = (AnimElemTime(AnimElemNo(0)) = 0) && (AnimElemNo(0) % 2 > 0)
value = 11032
ignorehitpause = 1

[State 2102, Sparks]
type = PlaySnd
trigger1 = AnimElemNo(0) = [2,20]
trigger1 = (AnimElemTime(AnimElemNo(0)) = 0) && (AnimElemNo(0) % 2 > 0)
value = S7040, (Random % 4)

[State 1030, Landing]
type = TargetBind
trigger1 = NumTarget
pos = 20, -14
ignorehitpause = 1

[State 1030, Landing]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = AnimElemNo(0) = [2,20]
trigger1 = AnimElemTime(AnimElemNo(0)) = 0
value = -3
kill = 0
ignorehitpause = 1

[State 1030, Landing]
type = TargetLifeAdd
trigger1 = NumTarget
trigger1 = AnimElem = 22
value = -40
kill = 1
ignorehitpause = 1

[State 200, Explod]
type = EnvShake
trigger1 = AnimElem = 22
ampl = 12
time = 8
freq = 120

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 22
anim = 11033
ID = 11030
pos = 18, -14
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = 1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 20
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 1030, Landing]
type = PlaySnd
trigger1 = NumTarget
trigger1 = AnimElem = 22
value = S7100,1
ignorehitpause = 1

[State 1030, Landing]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 22
value = 11033
ignorehitpause = 1


[State 1030, Landing]
type = TargetState
trigger1 = NumTarget
trigger1 = AnimElem = 23
value = 803
ignorehitpause = 1

[State 1030, Landing]
type = TargetDrop
trigger1 = AnimElem = 23
ignorehitpause = 1

[State 801, Throw Enemy]
type = VelSet
trigger1 = AnimElem = 23
X = -3
Y = -4

[State 801, Throw Enemy]
type = VelAdd
trigger1 = AnimElemNo(0) = 23
Y = 0.5

[State 801, End]
type = ChangeState
trigger1 = AnimElemNo(0) = 23
trigger1 = Vel Y > 0 && Vel Y > - Pos Y
trigger2 = !NumTarget && AnimElemNo(0) < 6
value = 621
ctrl = 1

; Sleeper Hold - Get Hit
[Statedef 11032]
type    = A
movetype= H
physics = N
juggle  = 8
ctrl = 0
sprpriority = -1
poweradd= 0
facep2 = 1

[State 2102, Sparks]
type = PalFX
trigger1 = !Time
time = 3
add = 220, 220, 220

[State 1032, Anim]
type = ChangeAnim2
trigger1 = !Time
value= 11032

[State 803, Safety]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5100
ctrl = 0


; Sleeper Hold - Get Hit Strong
[Statedef 11033]
type    = A
movetype= H
physics = N
juggle  = 8
ctrl = 0
sprpriority = -1
poweradd= 0
facep2 = 1

[State 2102, Sparks]
type = PalFX
trigger1 = !Time
time = 12
add = 220, 220, 220

[State 1032, Anim]
type = ChangeAnim2
trigger1 = !Time
value= 11032

[State 803, Safety]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5100
ctrl = 0

; Sparking
[Statedef 11040]
type    = U
movetype= A
physics = N
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= 0
velset = 0,0
facep2 = 1

[State 200, Explod]
type = VarSet
trigger1 = !Time
v = 24
value = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 6
trigger1 = !NumExplod(11040)
anim = 11041
ID = 11040
pos = -17, -15
postype = p1  ;p2,front,back,left,right
facing = 1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 6
trigger1 = !NumExplod(11041)
anim = 11041
ID = 11041
pos = 17, -15
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 10
scale = 1,1
sprpriority = 2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 200, Explod]
type = Explod
trigger1 = AnimElem = 6
trigger1 = !NumExplod(11042)
anim = 11042
ID = 11042
pos = 0,0
postype = p1  ;p2,front,back,left,right
facing = -1
vfacing = 1
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = 15
scale = 2,2.5
sprpriority = -2
ontop = 0
shadow = 0,0,0
ownpal = 1
removeongethit = 1
ignorehitpause = 1


[State 1010, Anim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 11041
value = 11040


[State 220, Push]
type = NotHitBy
trigger1 = 1
value = SCA, AA, AT, AP
time = 1
ignorehitpause = 1

[State 1010, HitDef]
type = HitDef
trigger1 = !Time
attr = S, SA
damage =  Floor(fvar(39)* 90),3
animtype = Back
air.type = Low
guardflag = M
hitflag = MAF
priority = 4, Hit
pausetime = 12,12
sparkno = S7006
;guard.sparkno = S8105
sparkxy = -10,-17
hitsound = S2,1
guardsound = 5,0
ground.type = Low
ground.velocity = -6, -5;-4
guard.velocity = -2
ground.hittime = 16
ground.slidetime = 16
air.velocity = -6,-5
airguard.velocity = -2, -3
air.hittime = 16
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
airguard.cornerpush.veloff = 0
yaccel = 0.4
fall = 1
fall.recover = 1
fall.recovertime = 120
fall.animtype = Medium
getpower = 62, 0
givepower = 36, 36
envshake.time = 8
envshake.freq = 120
envshake.ampl = 2
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1020, End]
type = ChangeState
trigger1 = !AnimTime
value = IfElse(StateType = A, 50, 0)
ctrl = 1


