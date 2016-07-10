; Slide Kick
[Statedef 11010]
type    = C
movetype= A
physics = C
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 11010
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 610, 2]
type = PlaySnd
trigger1 = Time = 2
value = S7000, 0

[State 610, Vel]
type = VelSet
trigger1 = AnimElemNo(0) = 2
X = 1

[State 610, VelAdd]
type = VelSet
trigger1 = AnimElemTime(3) = 0
x = 9

[State 610, 3]
type = HitDef
trigger1 = Time = 0
attr = C, SA
damage = 80, 8
hitflag = MAF
guardflag = LA
priority = 4
pausetime = 12,12
sparkno = S7006
sparkxy = -13,0
hitsound   = S7020,2
guardsound = 6,0
animtype = Med
ground.type = High
ground.slidetime = 12
ground.hittime  = 12
ground.velocity = -1
air.velocity = -1,-4
getpower = Ifelse(p2movetype = H, 72, 144), 36
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Repulsive Blast
[Statedef 11020]
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
anim = 11021
ID = 11020
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
anim = 11021
ID = 11020
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
trigger1 = !Time && PrevStateNo != 7960
value = 11020

[State 220, Push]
type = HitOverride
trigger1 = Anim = 11020
trigger1 = AnimElemNo(0) < 5
stateno = 11021
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
[Statedef 11021]
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
stateno = 11021
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
value = 11020
ignorehitpause = 1


;---------------------------------------------------------------------------
; Grounded Ki Blast
[Statedef 11030]
type    = S
movetype= A
physics = S
juggle  = 3
ctrl = 0
anim = 11030
sprpriority = 1
poweradd = 72
facep2 = 1

[State 1100, JumpSnd]
type = PlaySnd
trigger1 = !Time
value = S7040,1
ignorehitpause = 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimElem = 2
name = "Wind Slash"
ID = 11030
stateno = 11031
pos = 20, 0
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

; Ki Blast
[Statedef 11031]
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
X = 3.4
ignorehitpause = 1

[State 1021, HitOverride]
type = HitOverride
trigger1 = 1
time = -1
attr = SCA, AA, AP
stateno = 11033
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
getpower = 20

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
ID = 11032
stateno = 11032
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
value = 11033
ignorehitpause = 1

; Blast Trail
[Statedef 11032]
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
ID = 11032
stateno = 11032
pos = 0, 0
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0

[State 1001, burst]
type = ChangeState
trigger1 = Parent, StateNo = 11033
value = 11033


; Ki Blast End
[Statedef 11033]
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

