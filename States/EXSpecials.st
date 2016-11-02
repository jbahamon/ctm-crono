
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
