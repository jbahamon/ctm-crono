; Standing Light
[Statedef 10200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10200                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 42, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = -5, -15               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S0,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 0             ;Time that the opponent slides back
ground.hittime  = 13             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 13
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
getpower = 72,36
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; Standing Heavy
[Statedef 10210]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 18
ctrl = 0
velset = 0,0
anim = 10210
sprpriority = 2

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7010
ID = 200
pos = 20, 0
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

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 210, Hit1]
type = HitDef
trigger1 = !Time
attr = S, NA
animtype  = Medium
damage    = 70
guardflag = MA
hitflag = MAF
pausetime = 16,16
sparkno = S7000                      ;Spark anim no (Def: set above)
sparkxy = -5, 0              ;X-offset for the "hit spark" rel. to p2,
			;Y-offset for the spark rel. to p1
hitsound   = S0,1
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 17
guard.hittime = 16
ground.velocity = -3, 0
air.velocity = -3,0
ground.cornerpush.veloff = 0;
air.cornerpush.veloff = 0;
getpower = ifelse(p2movetype = H, 44, 101), 32
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Standing Projectile
[Statedef 10220]
type    = S
movetype= A
physics = S
juggle  = 0
ctrl = 0
velset = 0,0
anim = 10220
poweradd = -200
sprpriority = 2


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 0
channel = 0

[State 220, 2]
type = Projectile
trigger1 = Animelem = 2
attr = S, NP
offset = 16, -15
projID = 10220
projanim = 10221
projhitanim = 10222
projremanim = -1
projremovetime = 28
velocity = 8,0
animtype  = Hard
damage    = Floor(fvar(39) * 40),0
guardflag = MA
pausetime = 0,0
sparkno = -1
hitsound   = S7020,4
guardsound = 6,0
ground.type = High
ground.slidetime = 14
ground.hittime  = 15
ground.velocity = -2
air.velocity = -2,0
air.juggle  = 6
getpower = 0,0
givepower = 36, 36
palfx.add = 100, 100, 128
palfx.mul = 256,256,256
palfx.time = 8
ground.cornerpush.veloff = -2;
air.cornerpush.veloff = -2;

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; Crouching Light
[Statedef 10400]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10400                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = C, NA                     ;Attribute: Standing, Normal Attack
damage = 45, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = LA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = -5, -12               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S0,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 13             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 13
ground.velocity = -1.4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
getpower = 72, 36
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

; Crouching Heavy
[Statedef 10410]
type    = C                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = C                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10410                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1

[State 420, 2]
type = HitDef
trigger1 = !Time
attr = C, NA
damage    = 56
animtype  = Hard
hitflag = MAF
guardflag = L
pausetime = 20,20
sparkno = S7002
sparkxy = -10, -35
hitsound   = S7040,3
guardsound = 6,0
animtype = DiagUp
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -4, -6
air.velocity = -4, -6
air.juggle  = 6
yaccel = 0.4
fall = 1
getpower = IfElse(Var(21) > 0, 0, ifelse(p2movetype = H, 36, 72)), IfElse(Var(21) > 0, 0, 18)
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 12
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0
air.juggle  = 6

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching Projectile
[Statedef 10420]
type    = C
movetype= A
physics = C
juggle  = 0
poweradd= 18
velset = 0,0
ctrl = 0
anim = 10420
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1

[State 420, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S2,0
channel = 0

[State 420, 3]
type = ChangeState
trigger1 = !AnimTime
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Jump Light
[Statedef 10600]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
anim = 10600
sprpriority = 1

[State 600, 2]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0

[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 40
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 7,8
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = -5, -15               ;X-offset for the "hit spark" rel. to p2,
hitsound   =  S0,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 30
guard.hittime  = 29
ground.velocity = -2
air.velocity = 0, -0.5
air.hittime = 14
yaccel = 0.2
getpower = 72, 36
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 52
ctrl = 0


;---------------------------------------------------------------------------
;Jump Heavy
[Statedef 10610]
type    = A
movetype= A
physics = N
juggle  = 0
poweradd= 0
ctrl = 0
anim = 10610
juggle = 15
sprpriority = 1

[State 200, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7010
ID = 200
pos = 8, -30
postype = p1  ;p2,front,back,left,right
facing = 1
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


[State 600, 2]
type = VelMul
trigger1 = !Time
X = 0.5

[State 600, 2]
type = VelAdd
trigger1 = AnimElemNo(0) > 1
Y = 0.6


[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.75
persistent = 0
ignorehitpause = 1

[State 600, 2]
type = PlaySnd
trigger1 = Time = 2
value = S3, 2
channel = 0


[State 600, 2]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage    = 80
guardflag = HA
hitflag = MAF
priority = 3
pausetime = 7,8
sparkno = S7006
sparkxy = -10,-20
hitsound   =  S0,0
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 53
guard.hittime  = 51
ground.velocity = -2, -7
air.velocity = -2, -7
fall = 0
air.hittime = 14
getpower = 72, 36
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
air.juggle = 15
yaccel = 0.4

[State 1006, Land]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = Pos Y > - Vel Y
value = 52
ctrl = 0


;---------------------------------------------------------------------------
;Jump Heavy - Down Kick
[Statedef 10611]
type    = A
movetype= A
physics = N
juggle  = 4
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
anim = 10611
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

[State 610, Set]
type = Varset
trigger1 = !Time
var(0) = Vel X >= 0

[State 610, Vel]
type = VelSet
trigger1 = !Time && Var(0)
X = 0
Y = 0

[State 610, VelAdd]
type = VelAdd
trigger1 = !Var(0)
Y = 0.49

[State 610, VelAdd]
type = VelSet
trigger1 = AnimElemTime(2) = 0 && Var(0)
x = 5
y = 5

[State 610, 3]
type = HitDef
trigger1 = Time = 0
attr = A, NA
damage = 40
hitflag = MAF
guardflag = HA
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

[State 610, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 10612

;Jump Mid Landing
[Statedef 10612]
type    = S
movetype= I
physics = S
ctrl = 0
anim = 131
sprpriority = 1
velset = 0,0

[State 611, Pos]
type = PosSet
trigger1 = !Time
Y = 0

[State 611, End]
type = ChangeState
trigger1 = Time > 10
value = 0
ctrl = 1
