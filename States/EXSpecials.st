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
pos = 15, -15
postype = p1  ;p2,front,back,left,right
bindtime = -1
vel = 0,0
accel = 0,0
random = 0,0
removetime = -2
scale = 1.5,1.5
sprpriority = 2
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
x = Fvar(0)/fvar(2) * 7
y = FVar(1)/fvar(2) * 7
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
hitsound = S0,0                  ;Sound to play on hit
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
type = Explod
trigger1 = AnimElemNo(0) = 10
trigger1 = AnimElemTime(7) % 6 = 0
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
hitsound = S0,0                  ;Sound to play on hit
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
trigger1 = AnimElem = 6
value = S3, 0
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

; Sparking
[Statedef 11040]
type    = S
movetype= A
physics = S
juggle  = 8
ctrl = 0
sprpriority = 1
poweradd= 72
facep2 = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 6
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
anim = 11041
ID = 11040
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

[State 1010, Anim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 11041
value = 11040

[State 220, Push]
type = HitOverride
trigger1 = Anim = 11040
trigger1 = AnimElemNo(0) < 5
stateno = 11041
attr = SCA, AA, AP
time = 1
ignorehitpause = 1

[State 220, Push]
type = NotHitBy
trigger1 = AnimElemNo(0) < 5
value = , AT
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
ground.velocity = -3, -5;-4
guard.velocity = -2
ground.hittime = 16
ground.slidetime = 16
guard.velocity = -10
air.velocity = -3,-5
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
value = 0
ctrl = 1


;Super Armor State
[Statedef 11041]
velset = 0,0
Movetype = H

[State 999, PosFreeze]
type = PosFreeze
trigger1 = 1
value = 1
ignorehitpause = 1

[State 999, 0]
type = AssertSpecial
ignorehitpause=1
trigger1 = 1
flag = NoStandGuard
flag2 = NoCrouchGuard
flag3 = NoAirGuard

[State 899, NotHitBy]
type = NotHitBy 
trigger1 = !time
value = SCA, AA, AP
time = 100
ignorehitpause=1

[State 999, HitOver]
type = NotHitBy
trigger1= 1
time = 1
value= , AT
ignorehitpause=1

[State 999, HitOver]
type = HitOverride
trigger1= 1
time = 1
attr = SCA, AA, AP
stateno = 11041
ignorehitpause = 1

[State 999, LifeAdd]
type = LifeAdd
trigger1 = Time = 0
value = - floor(gethitvar(damage))
ignorehitpause = 1

[State 999, ChangeAnim]
type = ChangeAnim
trigger1 = Time < floor(gethitvar(hittime) * 0.35)
value = Anim
elem = AnimElemNo(0)
ignorehitpause = 1

[State 999, End]
type = ChangeState
trigger1 = Time >= floor(gethitvar(hittime) * 0.35)
value = 11040
ignorehitpause = 1
