; A
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


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 15002, ComboVar]
type = VarSet
trigger1 = !Time
var(25) = 0
ignorehitpause = 1

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
hitsound = S7020,0                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 0             ;Time that the opponent slides back
ground.hittime  = 20             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 20
ground.velocity = 0             ;Velocity at which opponent is pushed
airguard.velocity = 0,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = 0,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
getpower = 72,36
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 15002, ComboVar]
type = VarSet
trigger1 = AnimElemTime(3) = 0
var(25) = 1
ignorehitpause = 1

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

; AA
[Statedef 10201]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10201                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

[State 15002, ComboVar]
type = VarSet
trigger1 = !Time
var(25) = 0
ignorehitpause = 1

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
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 18, 18                 ;Time attacker pauses, time opponent shakes
sparkno = S7005                      ;Spark anim no (Def: set above)
sparkxy = -7, -12               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7020,1                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
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
getpower = 72,36
givepower = 36, 36
envshake.time = 6
envshake.freq = 120
envshake.ampl = 3
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 15002, ComboVar]
type = VarSet
trigger1 = AnimElemTime(3) = 4
var(25) = 1
ignorehitpause = 1

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

; AAA
[Statedef 10202]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10202                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 15002, ComboVar]
type = VelSet
trigger1 = AnimElem = 2
X = 4
ignorehitpause = 1

[State 15002, ComboVar]
type = VelMul
trigger1 = AnimElemNo(0) >= 2
X = 0.9
ignorehitpause = 0


[State 15002, ComboVar]
type = VarSet
trigger1 = !Time
var(25) = 0
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
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
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 22, 22                 ;Time attacker pauses, time opponent shakes
sparkno = S7006                      ;Spark anim no (Def: set above)
sparkxy = -5, -12               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7020,2                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 23             ;Time that the opponent slides back
ground.hittime  = 23             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 23
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -2,0     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = Low                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -4,0           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
envshake.time = 10
envshake.freq = 80
envshake.ampl = 4
getpower = 72,36
givepower = 36, 36
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 15002, ComboVar]
type = VarSet
trigger1 = AnimElemTime(4) > 3
var(25) = 1
persistent = 0
ignorehitpause = 1

[State 200, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; AAAA
[Statedef 10203]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = N                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 4,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10203                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 15002, ComboVar]
type = VarSet
trigger1 = !Time
var(25) = 0
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = AttackMulSet
Trigger1 = 1
value = fvar(39)
ignorehitpause = 1

[State -3, Dampener]
Type = VelSet
Trigger1 = MoveHit
X = 0
ignorehitpause = 1

[State 200, 1]
type = HitDef
trigger1 = !Time
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 42, 0                   ;Damage that move inflicts, guard damage
animtype = Hard                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12 ;Time attacker pauses, time opponent shakes
sparkno = S7006                      ;Spark anim no (Def: set above)
sparkxy = -8, -10               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7020,3                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 13             ;Time that the opponent slides back
ground.hittime  = 23             ;Time opponent is in hit state
guard.hittime = 12
air.hittime = 23
ground.velocity = -1           ;Velocity at which opponent is pushed
airguard.velocity = 0,-.4     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1,-1           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
getpower = 72,36
givepower = 36, 36
envshake.time = 12
envshake.freq = 120
envshake.ampl = 4
ground.cornerpush.veloff = 0
air.cornerpush.veloff = 0

[State 15002, ComboVar]
type = VelMul
trigger1 = AnimElemNo(0) >= 3
X = 0.9
ignorehitpause = 1

[State 15002, ComboVar]
type = VarSet
trigger1 = Anim = 10204 && AnimElemTime(4) = 4
var(25) = 1
ignorehitpause = 1

[State 200, 2]
type = PlaySnd
trigger1 = Anim = 10204 && AnimElem = 2
value = S3, 2
channel = 0

[State 200, 3]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; AAAAA
[Statedef 10204]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 0                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 10204                       ;Change animation (Def: no change)
poweradd = 0                     ;Power to add (Def: 0)
sprpriority = 1                  ;Set p1's sprite layering priority to 2 (in front)


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State -3, Dampener]
Type = VelSet
Trigger1 = AnimElem = 2
X = 4
ignorehitpause = 1

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State -3, Dampener]
Type = VelSet
Trigger1 = MoveHit
X = 0
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
animtype = Hard                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                    ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 12, 12                 ;Time attacker pauses, time opponent shakes
sparkno = S7006                      ;Spark anim no (Def: set above)
sparkxy = -8, -10               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S7020,4                  ;Sound to play on hit
guardsound = 6, 0                ;Sound to play on guard
ground.type = Low               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 20
ground.hittime  = 22
ground.velocity = -8,-7
guard.velocity = -7
air.velocity = -8,-7
airguard.velocity = -5, -4
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6
getpower = 72,36
givepower = 36, 36
ground.cornerpush.veloff = -3
air.cornerpush.veloff = -3
fall = 1
p2stateno = 10205    ;Make p2 go to state 1025 on hit
p2facing = 1        ;Force to face p1

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

;------------------
; Hit by AAAAA/BB - shaking from the hit
; Blatantly taken from KFM
[Statedef 10205]
type    = A
movetype= H
physics = N
velset = 0,0

[State 1025, Anim] ;Custom animation
type = ChangeAnim2
trigger1 = 1
value = 10205

[State 1025, State]
type = ChangeState
trigger1 = HitShakeOver = 1
value = 10206

;------------------
; Hit by AAAAA/BB - flying through the air
; (a custom gethit state)
[Statedef 10206]
type    = A
movetype= H
physics = N

[State 1026, Velocity]
type = VelSet
trigger1 = Time = 0
x = -8
y = 0

[State 1026, No scroll]
type = ScreenBound
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,1

[State 1026, Hit wall]
type = ChangeState
trigger1 = BackEdgeBodyDist <= 10
trigger2 = FrontEdgeBodyDist <= 10
value = 10207

[State 1026, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

;------------------
; Hit by AAAAA/BB - hit wall
; (a custom gethit state)
[Statedef 10207]
type    = A
movetype= H
physics = N

[State 1027, Turn]
type = Turn
trigger1 = (Time = 0) && (FrontEdgeBodyDist <= 30)

[State 1027, Pos]
type = PosAdd
trigger1 = Time = 0
x = - BackEdgeBodyDist

[State 1027, Stop moving]
type = PosFreeze
trigger1 = 1
x = 1
y = 1

[State 1027, No scroll]
type = ScreenBound
trigger1 = 1
value = 1
movecamera = 0,1

[State 1027, Spark]
type = Explod
trigger1 = Time = 0
anim = F72
pos = 0, floor (screenpos y) + Const(size.mid.pos.y)
postype = back
sprpriority = 3

[State 1027, Anim]
type = ChangeAnim2
trigger1 = Time = 0
value = 10206

[State 1027, Sound]
type = PlaySnd
trigger1 = Time = 0
value = F7,0

[State 1027, State]
type = ChangeState
trigger1 = AnimTime = 0
value = 10208

;------------------
; Hit by AAAAA/BB - bounce off wall
; (a custom gethit state)
[Statedef 10208]
type    = A
movetype= H
physics = N

[State 1028, 1]
type = NotHitBy
trigger1 = 0
value = , NA, NP

[State 1028, Vel Y]
type = VelSet
trigger1 = Time = 0
y = -4

[State 1028, Vel X]
type = VelSet
trigger1 = Time = 0
x = 1.6

[State 1028, Turn]
type = Turn
trigger1 = (Time = 0) && (BackEdgeDist < 30)

[State 1028, Gravity]
type = VelAdd
trigger1 = 1
y = .2

[State 1028, Anim 5050] ;Self falling animation
type = ChangeAnim
trigger1 = Time = 0
trigger1 = !SelfAnimExist(5052)
value = 5050

[State 1028, Anim 5052] ;Self falling animation (diagup type)
type = ChangeAnim
trigger1 = Time = 0
trigger1 = SelfAnimExist(5052)
value = 5052

[State 1028, Anim 5060] ;Coming down - normal
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5050
trigger1 = SelfAnimExist(5060)
persistent = 0
value = 5060

[State 1028, Anim 5062] ;Coming down - diagup type
type = ChangeAnim
trigger1 = Vel Y > -2
trigger1 = Anim = 5052
trigger1 = SelfAnimExist(5062)
persistent = 0
value = 5062

[State 1028, Hit ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100

; B
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

[State 200, Dampen]
Type=VelSet
Trigger1 = AnimElem = 2
X = 3
persistent = 0
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 15002, ComboVar]
type = VelSet
trigger1 = AnimElem = 2
X = 3
ignorehitpause = 1

[State 15002, ComboVar]
type = VarSet
trigger1 = !Time
var(25) = 0
ignorehitpause = 1

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
fvar(39) = fvar(39)*0.8
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
hitsound   = S7040,1
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

[State 15002, ComboVar]
type = VarSet
trigger1 = AnimElemTime(3) = 11
var(25) = 1
ignorehitpause = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; BB
[Statedef 10211]
type    = S
movetype= A
physics = S
juggle  = 6
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 10211
sprpriority = 1
facep2 = 1

[State 15002, ComboVar]
type = VelSet
trigger1 = AnimElemTime(2) = 1
X = 4
ignorehitpause = 1

[State 210, 1]
type = Varset
trigger1 = !Time
var(0) = 0

[State 210, 1]
type = ChangeAnim
trigger1 = !(Command = "holdb")
trigger1 = AnimElemTime(1) = [12, 41]
trigger1 = AnimElemNo(0) = 1
value = 10211
elem = 2
persistent = 0

[State 210, 1]
type = VarSet
trigger1 = AnimElemTime(1) = 41
trigger1 = AnimElemNo(0) = 1
var(0) = 1
persistent = 0


[State 210, 1]
type = ChangeAnim
trigger1 = (Command = "holdb")
trigger1 = AnimElemTime(1) = 41
trigger1 = AnimElemNo(0) = 1
value = 10211
elem = 1


[State 210, 1]
type = PalFX
trigger1 = AnimElemNo(0) = 1
trigger1 = Var(0)
trigger1 = Command = "holdb"
trigger1 = GameTime % 4 = [0,1]
add = 200, 200, 2000
color = 256
mul = 256, 256, 256
time = 2


[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7011
ID = 210
pos = 0, -28
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

[State 220, 1]
type = PlaySnd
trigger1 = AnimElem = 3
value = S7000, 1

[State 620, 3]
type = HitDef
trigger1 = !Var(0)
attr = S, NA
damage = 62
guardflag = MA
hitflag = MAF
priority = 4
pausetime = 12, 12
sparkno = S7001
sparkxy = -5, -10
hitsound   = S7040,2
guardsound = 6,0
animtype = DiagUp
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -4, -6
air.velocity = -4, -6
air.juggle  = 6
yaccel = 0.4
getpower = 36, 18
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
ground.cornerpush.veloff = -10;
air.cornerpush.veloff = -10;
fall = 1
fall.recover = 0
persistent = 0

[State 620, 3]
type = HitDef
trigger1 = Var(0)
attr = S, NA
damage = 62
guardflag = 
hitflag = MAF
priority = 4
pausetime = 12, 12
sparkno = S7001
sparkxy = -5, -10
hitsound   = S7040,1
guardsound = 6,0
animtype = DiagUp
ground.type = High
ground.slidetime = 12
ground.hittime  = 14
ground.velocity = -6, -2
air.velocity = -6, -2
air.juggle  = 6
yaccel = 0.4
getpower = 36, 18
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
ground.cornerpush.veloff = -10;
air.cornerpush.veloff = -10;
fall = 1
fall.recover = 0
envshake.time = 12
envshake.freq = 120
envshake.ampl = 6
p2stateno = 10205    ;Make p2 go to state 1025 on hit
p2facing = 1        ;Force to face p1
persistent = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; AAB/AB
[Statedef 10212]
type    = S
movetype= A
physics = S
juggle  = 6
poweradd= IfElse(Var(21) > 0, 0, 18)
ctrl = 0
velset = 0,0
anim = 10212
sprpriority = 1
facep2 = 1

[State 210, 1]
type = VarSet
trigger1 = !Time
var(0) = 0

[State 210, 1]
type = VarSet
trigger1 = AnimElem = 3
var(0) = 1
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 210, Explod]
type = Explod
trigger1 = AnimElem = 2
anim = 7011
ID = 210
pos = 0, -28
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

[State 620, 3]
type = HitDef
trigger1 = !Time
attr = S, NA
damage = 62
guardflag = MA
hitflag = MAF
priority = 4
pausetime = 12, 12
sparkno = S7001
sparkxy = -5, -10
hitsound   = S7040,1
guardsound = 6,0
animtype = DiagUp
ground.type = High
ground.slidetime = 12
ground.hittime  = 22
ground.velocity = -1.5, -3
air.velocity = -1.5, -3
air.juggle  = 6
yaccel = 0.3
getpower = 36, 18
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 8
envshake.freq = 120
envshake.ampl = 4
ground.cornerpush.veloff = -10;
air.cornerpush.veloff = -10;
fall = 0

[State 200, Dampen]
Type=Varset
Trigger1 = MoveHit
fvar(39) = fvar(39)*0.78
persistent = 0
ignorehitpause = 1

[State 220, 3]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1


; AAAAB
[Statedef 10213]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= 18
ctrl = 0
velset = 0,0
anim = 10213
sprpriority = 2


[State 15002, ComboVar]
type = VarSet
trigger1 = !Time
var(25) = 0
ignorehitpause = 1

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
fvar(39) = fvar(39)*0.78
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
sparkno = S7006                      ;Spark anim no (Def: set above)
sparkxy = -8, -10               ;X-offset for the "hit spark" rel. to p2,Y
hitsound   = S7020,5
guardsound = 6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 17
guard.hittime = 16
ground.velocity = -2, -9
air.velocity = -2,-9
fall = 1
fall.recover = 1
fall.recovertime = 40
yaccel = 0.3
ground.cornerpush.veloff = -10;
air.cornerpush.veloff = -10;
getpower = ifelse(p2movetype = H, 44, 101), 32
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 16
envshake.time = 18
envshake.freq = 120
envshake.ampl = 6

[State 15002, ComboVar]
type = VarSet
trigger1 = AnimElemTime(3) = 6
var(25) = 1
ignorehitpause = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1

; C
[Statedef 10220]
type    = S
movetype= A
physics = S
juggle  = 0
ctrl = 0
velset = 0,0
anim = 10220
sprpriority = 2


[State 200, Dampen]
type = Varset
trigger1 = ProjHit = 1
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 220, 2]
type = Projectile
trigger1 = Animelem = 2
attr = S, NP
offset = 16, -15
projID = 10220
projanim = 10225
projhitanim = 10226
projremanim = -1
projremovetime = 28
velocity = 8,0
animtype  = Medium
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


; AC/AAC
[Statedef 10221]
type    = S
movetype= A
physics = S
juggle  = 0
ctrl = 0
velset = 0,0
anim = 10221
sprpriority = 2

[State 200, Dampen]
Type=Varset
Trigger1 = ProjHit = 1
fvar(39) = fvar(39)*0.8
persistent = 0
ignorehitpause = 1


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimelemTime(2) = 0
trigger2 = AnimelemTime(2) = 17
trigger3 = AnimelemTime(2) = 34
name = "Ki Blast"
ID = 10220
stateno = 10225
pos = 12, -7
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1



; BC
[Statedef 10222]
type    = S
movetype= A
physics = S
juggle  = 0
ctrl = 0
velset = 0,0
anim = 10222
sprpriority = 2

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1

[State 1000, Pawnch]
type = Helper
trigger1 = AnimelemTime(2) = 0
name = "Ki Blast"
ID = 10220
stateno = 10227
pos = 18, -17
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1


; Diagonal Ki Blast
[Statedef 10225]
type = A
physics = N
movetype = A
anim = 10225
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 1001, Dampen]
Type = ParentVarset
Trigger1 = MoveHit
trigger1 = !(target, time) && target, movetype = H
fvar(39) = parent, Fvar(39)*0.85
persistent = 0
ignorehitpause = 1

[State 1005, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = Floor(256 - 32*Abs(Sin(GameTime/5.0))), Floor(128*Abs(Sin(GameTime/5.0)))
ignorehitpause = 1

[State 1005, Trans]
type = AngleDraw
trigger1 = 1
value = -45
ignorehitpause = 1

[State 1005, HitOverride]
type = hitoverride
trigger1 = 1
time = -1
attr = SCA, AA, AP, AT
stateno = 10226
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = 1
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1

[State 1005, timevar]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1055, Vel]
type = velset
trigger1 = 1
x = 4
y = 4

[State 1055, Hit]
type = hitdef
trigger1 = Root, StateNo = 10620
priority = 4, Hit
attr = S, SP
damage = ceil(47 * root, fvar(39)), 7
animtype = Medium
hitflag = MAF
guardflag = MA
pausetime = 0, 18
sparkno = 10226
sparkxy = -10, 0
hitsound = S7020,5
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, 0
guard.velocity = -3
air.velocity = -6, -1
ground.cornerpush.veloff = 0
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 16
getpower = 0,0
givepower = 36, 36
p1sprpriority = 4
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 3
airguard.ctrltime = 16
airguard.velocity = -.5,.5
forcestand = 1


[State 1055, Hit]
type = hitdef
trigger1 = Root, StateNo = 10221
priority = 4, Hit
attr = S, SP
damage = ceil(23 * root, fvar(39)), 7
animtype = Medium
hitflag = MAFD
guardflag = MA
pausetime = 0, 18
sparkno = 10226
sparkxy = -10, 0
hitsound = S7020,5
guardsound = s2, 0
ground.type = Low
ground.slidetime = 16
ground.hittime = 16
ground.velocity = -6, 0
guard.velocity = -3
air.velocity = -6, -1
ground.cornerpush.veloff = 0
down.hittime = 20
down.velocity = 0, 0
air.fall = 1
fall.recover = 1
fall.recovertime = 16
getpower = 0,0
givepower = 36, 36
p1sprpriority = 4
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 6
envshake.freq = 120
envshake.ampl = 3
airguard.ctrltime = 16
airguard.velocity = -.5,.5
forcestand = 1


[State 1005, End]
type = PosSet
trigger1 = Pos Y >= -Vel Y && Vel Y > 0
trigger1 = !MoveContact
Y = 0
ignorehitpause = 1

[State 1005, End]
type = VarSet
trigger1 = !Time
var(0) = 0
ignorehitpause = 1

[State 1005, End]
type = VarSet
trigger1 = MoveContact
var(0) = 1
ignorehitpause = 1

[State 1005, End]
type = changestate
trigger1 = Pos Y >= -Vel Y && Vel Y > 0
trigger2 = movecontact
value = 10226
ignorehitpause = 1

ignorehitpause = 1
[State 1006, End]
type = destroyself
trigger1 = pos x != [ -240, 240]
ignorehitpause = 1

; Diagonal Ki Blast GetHit/End
[Statedef 10226]
type = A
physics = N
movetype = I
anim = 10226
velset = 0, 0
ctrl = 0
sprpriority = 4
movehitpersist = 1

[State 1005, Trans]
type = PosSet
trigger1 = Pos Y >= 0
Y = 2
ignorehitpause = 1


[State 1005, Trans]
type = Trans
trigger1 = 1
trans = addalpha
alpha = Floor(256 - 32*Abs(Sin(GameTime/5.0))), Floor(128*Abs(Sin(GameTime/5.0)))
ignorehitpause = 1

[State 1005, Trans]
type = AngleDraw
trigger1 = 1
value =-90

[State 1005, timevar]
type = assertspecial
trigger1 = 1
flag = noshadow
ignorehitpause = 1

[State 1006, End]
type = destroyself
trigger1 = !animtime



; Ki Burst
[Statedef 10227]
type = A
physics = N
movetype = A
ctrl = 0
velset = 0, 0
sprpriority = 4

[State 10227, Anim]
type = ChangeAnim
trigger1 = !Time && PrevStateNo != 10227
value = 10227

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
stateno = 10227
ignorehitpause = 1

[State 1005, HB]
type = hitby
trigger1 = PrevStateNo != 10227
time = -1
value = SCA, NP, SP, HP
ignorehitpause = 1


[State 1005, HB]
type = nothitby
trigger1 = PrevStateNo = 10227
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
trigger1 = !(PrevStateNo = 10227)
priority = 4, Hit
attr = S, SP
damage = ceil(47 * root, fvar(39)), 7
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
envshake.freq = 80
envshake.ampl = 4
airguard.ctrltime = 16
airguard.velocity = -2,-.5
forcestand = 1
persistent = 0

[State 1006, End]
type = destroyself
trigger1 = !AnimTime
trigger2 = Root, StateNo != 10222
ignorehitpause = 1

; Crouching A
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

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 0

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
hitsound = S7020,0                  ;Sound to play on hit
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

; Crouching B
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


[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1


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

;Crouching C
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
Trigger1 = ProjHit = 1
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1
channel = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimelemTime(2) = 0
name = "Ki Blast"
ID = 10220
stateno = 10225
pos = 12, -7
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 0
ctrl = 1




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
;Jump A
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
value = S7000, 0
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
hitsound = S7020,0
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
;Jump B
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
pos = 14, -30
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
value = S7000, 1
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
hitsound = S7020,4
guardsound = 6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 53
guard.hittime  = 51
ground.velocity = -2, -1
air.velocity = -2, -1
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

;Jump C
[Statedef 10620]
type    = A
movetype= A
physics = A
juggle  = 0
poweradd= 18
ctrl = 0
anim = 10620
sprpriority = 1

[State 200, Dampen]
Type=Varset
Trigger1 = ProjHit = 1
fvar(39) = fvar(39)*0.9
persistent = 0
ignorehitpause = 1

[State 210, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = S7000, 1
channel = 0

[State 1000, Pawnch]
type = Helper
trigger1 = AnimelemTime(2) = 0
name = "Ki Blast"
ID = 10220
stateno = 10225
pos = 12, -7
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1

[State 210, 5]
type = ChangeState
trigger1 = !AnimTime
value = 50
ctrl = 1


