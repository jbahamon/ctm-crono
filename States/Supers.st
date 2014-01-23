;===========================================================================
; Super Moves
;===========================================================================

;---------------------------------------------------------------------------
; Luminaire
[Statedef 2000]
type    = S
movetype= A
physics = S
ctrl = 0
anim = 2000
poweradd = -1000
sprpriority = 2
juggle = 14


[State 2000, up!]
type = StateTypeSet
trigger1 = AnimElemNo(0) > 3
statetype = A
physics = N
persistent = 0

[State 2000, up!]
type = Velset
trigger1 = AnimElemNo(0) > 3
y = -0.3
persistent=0

[State 3110, Stop]
type = VelSet
trigger1 = time > 80
y = -0.3*sin((pi/60)*(35-time))

[State 2000, NHB]
type = NotHitBy
trigger1 = Time < 45
time = 1
value = SCA

[State 2000, Super Pause FX]
type = helper
trigger1 = time = 5
helpertype = normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 1022, Rays]
type = Helper
trigger1 = NumHelper(2003) < 4
trigger1 = NumHelper(7000)
trigger1 = AnimElemNo(0) > 1
ID = 2003
stateno = 2003
supermovetime = 9999999
pos = 0, 0
postype = p1 ;p2,front,back,left,right
facing = 1
scale = 1 , 1
sprpriority = 4
ownpal = 1
ignorehitpause = 1

[State 2000, Super Pause]
type = superpause
trigger1 = time = 1
time = 50
movetime = 50
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2000, Geyser]
type = Helper
trigger1 = Time > 50 && !NumHelper(7000)
name = "Luminaire"
ID = 2000
stateno = 2001
pos = 0, Floor(-Pos Y)
postype = p1    ;p2,front,back,left,right
facing = 1
keyctrl = 0
ownpal = 1
persistent = 0
supermovetime = 9999


[State 2010, End]
type = ChangeState
trigger1 = Time > 5 && !NumHelper(7000) && !NumHelper(2000)
value = 50
ctrl = 0

;Luminaire Aura
[Statedef 2001]
type    = A
movetype= A
physics = N
poweradd= 0
ctrl = 0
anim = 7200
sprpriority = 3
velset = 0,0


[State 3101, hitdef]
type = HitDef
trigger1 = !Time
attr = A,HP
numhits=1
damage=floor(139* parent, fvar(39)),0
animtype=Hard
hitflag = MAF
hitsound = S7010,3
guardflag=MA
pausetime=0,60
sparkno=-1
ground.type=Low
ground.slidetime=2
ground.hittime=1
ground.velocity=-1,-4;
air.velocity=-1,-4;
fall=1
fall.recover=0
air.fall=1
p1sprpriority = 4
p2facing=1
palfx.invertall=1
palfx.color=0
palfx.add = 120, 120, 30
palfx.time=60
getpower=0

[State 2003, BGPal]
type = BGPalFX
trigger1 = AnimElemTime(1) = [30, 62]
time = 1
add = (AnimElemTime(1) - 30) * 8, (AnimElemTime(1) - 30) * 8, (AnimElemTime(1) - 30) * 8
ignorehitpause = 1

[State 2003, BGPal]
type = BGPalFX
trigger1 = AnimElemTime(1) > 62
trigger1 = AnimTime <= -32
time = 1
add = 256, 256, 256
ignorehitpause = 1

[State 2003, BGPal]
type = BGPalFX
trigger1 = AnimTime > -32
time = 1
add = - AnimTime * 8, - AnimTime * 8, - AnimTime * 8
ignorehitpause = 1


[State 2003, RealTime]
trigger1 = 1
type = AssertSpecial
flag = noshadow
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = Trans
trans = addalpha
alpha = 256, 256
ignorehitpause = 1

[State 2003, End]
type = DestroySelf
trigger1 = !AnimTime
ignorehitpause = 1

;Luminaire Ray
[Statedef 2003]
type    = A
movetype= I
physics = N
poweradd= 0
ctrl = 0
anim = 7201
sprpriority = 3

[State 2003, Initial Angle]
type = VarSet
trigger1 = !Time
fvar(0) = Random/1000.0 * 360.0
ignorehitpause = 1

[State 2003, Rotating Speed]
type = VarSet
trigger1 = !Time
fvar(1) = ((Random/1000.0 * 0.4) + 0.1)* IfElse(Random % 2, -1, 1)
ignorehitpause = 1

[State 2003, Rotating Speed]
type = VarSet
trigger1 = !Time
fvar(2) = Random/1000.0 * 0.2
ignorehitpause = 1

[State 2003, Rotating Speed]
type = VarSet
trigger1 = Time
trigger2 = GameTime % 3 = 0
fvar(0) = Floor((fvar(0) + 3*fvar(1))) % 360
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = 1
type = AngleDraw
scale = 0.7 + fvar(2) * Sin(GameTime / 10 + fvar(0)), 0.1
value = fvar(0)
ignorehitpause = 1


[State 2003, RealTime]
trigger1 = Time = [0, 16]
type = Trans
trans = addalpha
alpha = IfElse(GameTime % 4 > 1, 0, (Time) * 16), 256
ignorehitpause = 1


[State 2003, RealTime]
trigger1 = Time = [16, 50]
type = Trans
trans = addalpha
alpha = IfElse(GameTime % 4 > 1, 0, 256), 256
ignorehitpause = 1

[State 2003, RealTime]
trigger1 = Time = [50, 66]
type = Trans
trans = addalpha
alpha = IfElse(GameTime % 4 > 1, 0, 256 - (Time - 50) * 16), 256
ignorehitpause = 1

[State 2013, Override]
type = AssertSpecial
trigger1 = 1
flag = NoShadow
ignorehitpause = 1

;End
[State 2013, End]
type = DestroySelf
trigger1 = Time >= 66
ignorehitpause = 1

;---------------------------------------------------------------------------
; Confuse
[Statedef 2010]
type    = S
movetype= A
physics = S
juggle  = 0
poweradd= -1000
ctrl = 0
anim = 2010
sprpriority = 1
facep2 = 1

[State 2010, NHB]
type = NotHitBy
trigger1 = 1
time = 1
value = SCA


[State 2010, PalFx]
type = PalFX
trigger1 = (Time % 8 = 0)
time = 2
add = 200, 200, 200
mul = 256, 256, 256

[State 2010, Offset]
type = OffSet
trigger1 = Time % 2 = 0
X = (random % 8) - 4
Y = (random % 8) - 4

[State 2010, Super Pause FX]
type = Helper
trigger1 = Time = 1
helpertype = Normal
stateno = 7000
ID = 7000
name = "Super Charge"
postype = p1
pos = 0,0
ownpal = 1
persistent = 0
supermovetime = 9999

[State 2010, Super Pause]
type = SuperPause
trigger1 = time = 1
time = 45
movetime = 45
anim = -1
sound = S7010,2
p2defmul = 1
darken = 0

[State 2010, End]
type = ChangeState
trigger1 = Time > 1 && !NumHelper(7000)
value = 2011
ctrl = 0

;Confuse - Jump
[Statedef 2011]
type    = A
movetype= A
physics = N
juggle  = 3
poweradd= 0
ctrl = 0
anim = 2011
sprpriority = 1
velset = 3.3,-4

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = 1
time = 3
ignorehitpause = 1

[State 1020, Afterimage]
type = AfterImage
trigger1 = !Time
length = 8
palbright = 0, 0, 0
palcolor = 256
paladd = 1,1,1
palcontrast = 256, 256, 256
palmul = 1, 1, 1
timegap  = 3
framegap = 3
trans = none
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State 2021, Jump]
type = VelAdd
trigger1 = 1
Y = 0.3

[State 2021, Jump]
type = PlayerPush
trigger1 = 1
value = 0

[State 2021, Hit]
type = HitDef
trigger1 = !Time
attr = A, HT 
hitflag = MA-
priority = 4, Miss
sparkno = -1
p1stateno = 2012
p2stateno = 2013
guard.dist = 0
damage = 20, 3 
animtype = Hard
p1facing = 1
pausetime = 5, 0
ground.velocity = 0,0
ground.cornerpush.veloff = 0
fall = 1
fall.recovertime = 120
air.type = Low
getpower = 0,0
givepower = 36, 36
palfx.add = 200, 200, 200
palfx.mul = 256, 256, 256
palfx.time = 8
envshake.time = 4
envshake.freq = 120
envshake.ampl = 3
air.fall = 0
fall.recover = 0
p1sprpriority = 1
p2sprpriority = 1
kill = 0

[State 620, Landing]
type = ChangeState
trigger1 = Vel Y > 0
trigger1 = pos y > -vel y
value = 621

; Confuse - Success
[Statedef 2012]
type = A
physics = N
movetype = A
poweradd = 0
velset = 0,0


[State 2012, Pos]
type = Turn
trigger1 = !Time
trigger1 = NumTarget
trigger1 = Facing = Target, Facing
ignorehitpause = 1

[State 2012, Pos]
type = PosSet
trigger1 = !Time
trigger1 = NumTarget
X = Target, Pos X - 20*Facing
ignorehitpause = 1

[State 2022, !Push]
type = PlayerPush
trigger1 = 1
value = 0
ignorehitpause = 1

[State 2022, Helper]
type = Helper
trigger1 = !Time
helpertype = normal ;player
name = "Marker"
ID = 2010
stateno = 2015
pos = Floor(Target, Pos X - Pos X ) * Facing , Floor(-Pos Y)
postype = p1
facing = 1
keyctrl = 0
ownpal = 1
ignorehitpause =  1
persistent = 0

[State 2022, Var]
type = VarSet
trigger1 = !Time
var(0) = IfElse(Pos X > Target, Pos X, -1,1)
ignorehitpause =  1

[State 2022, Var]
type = VarSet
trigger1 = !Time
var(2) = 0
ignorehitpause =  1
 
[State 2022, Screenbound]
type = ScreenBound
trigger1 = 1
value = 0
ignorehitpause =  1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(0) = Pos Y
persistent = 0
ignorehitpause = 1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(1) = Target, Pos Y
persistent = 0
ignorehitpause = 1

[State 2022, Var]
type = VarSet
trigger1 = !Time
fvar(2) = 0
ignorehitpause = 1

[State 2022, Var]
type = VarAdd
trigger1 = 1
fvar(2) = facing * pi * (1/20.0 + (Time / 400000.0))
ignorehitpause = 1


[State 2022, Move]
type = PosSet
trigger1 = !Var(2)
trigger1 = NumHelper(2010)
X = (Helper(2010), Pos X) - Cos(fvar(2)) * 25 * Var(0) 
Y = FVar(0) + 4 * Sin(Time/20.0)
ignorehitpause =  1

[State 2022, Move]
type = SprPriority
trigger1 = 1
value = IfElse(Sin(fvar(2))*Facing > 0, 2, 0)

[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) > 0 
trigger1 = Sin(fvar(2) + pi/4.0) > 0
var(1) = 0


[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) > 0 
trigger1 = Sin(fvar(2) + pi/4.0) < 0
var(1) = 1

[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) < 0 
trigger1 = Sin(fvar(2) + pi/4.0) < 0
var(1) = 2


[State 2022, VarSet]
type = VarSet
trigger1 = Cos(fvar(2) + pi/4.0) < 0 
trigger1 = Sin(fvar(2) + pi/4.0) > 0
var(1) = 3

[State 2012, Anim]
type = ChangeAnim
trigger1 = !Var(2)
trigger1 = Anim != (2013 + var(1))
value = 2013 + var(1)

[State 2022, Move]
type = TargetBind
trigger1 = Target, StateNo = 2013
trigger1 = !NumHelper(2010)
ignorehitpause = 1

[State 2022, Move]
type = TargetBind
trigger1 = Target, StateNo = 2013
trigger1 = NumHelper(2010)
pos = ((Helper(2010), Pos X) - Pos X) * Facing , FVar(3) - Pos Y
ignorehitpause = 1

[State 2022, Move]
type = SprPriority
trigger1 = 1
value = IfElse(Sin(pi * time/20.0)*Facing > 0, 2, 0)

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
framegap = 5
trans = none
time = 2; only 2 ticks!!!
ignorehitpause = 1

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = !Var(2)
time = 3
ignorehitpause = 1

[State 2022, End]
type = VarSet
trigger1 = Time > 200
trigger1 = Abs(Cos(fvar(2)) - 1) < 0.3
trigger1 = Abs(Sin(fvar(2))) < 0.3
var(2) = 1


[State 2023, Shake]
type = EnvShake
trigger1 = (Time % 20 = 0 )
trigger1 = !Var(2)
trigger2 = Anim = 2017 && AnimElem = 2
time = 18
freq = 120
ampl = 6

[State -3: AfterImageTime]
type = AfterImageTime
trigger1 = Var(2)
time = 0
ignorehitpause = 1
persistent = 0

[State 2022, End]
type = ChangeAnim
trigger1 = Var(2)
value = 2017
persistent = 0

[State 2022, End]
type = TargetState
trigger1 = Var(2)
trigger1 = NumTarget
trigger1 = AnimElemTime(2) = 3
value = 2014

[State 2022, End]
type = VelSet
trigger1 = Var(2)
trigger1 = !AnimTime
X = -3 
Y = -5


[State 2022, End]
type = ChangeState
trigger1 = Var(2)
trigger1 = !AnimTime
value = 50
ctrl = 0

;Confuse - Hit
[Statedef 2013]
type = A
movetype = H
physics = N
sprpriority = 1

[State 2023, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 2012

[State 2023, Shake]
type = PalFx
trigger1 = (Time % 20 = 0 )
add = 200, 200, 200
mul = 256, 256, 256
time = 4

[State 2023, Shake]
type = LifeAdd
trigger1 = (Time % 20 = 0 )
value = -12
kill = 0

[State 2023, End]
type = SelfState
trigger1 = Time > 10 && !GetHitVar(IsBound)
value = 5050

;Confuse - Into the air
[Statedef 2014]
type = A
movetype = H
physics = N
sprpriority = 1
velset = -3, - 7

[State 2023, Shake]
type = PalFx
trigger1 = !Time
add = 200, 200, 200
mul = 256, 256, 256
time = 12

[State 2024, PosAdd]
type = PosAdd
trigger1 = !Time
Y = Const(size.mid.pos.y)

[State 2024, Gravity]
type = VelAdd
trigger1 = 1
Y = .5

[State 2024, Anim]
type = ChangeAnim2
trigger1 = !Time
value = 803

[State 2024, Vel]
type = ChangeAnim2
trigger1 = Vel Y > 0
value = 804

[State 2024, Life]
type = LifeAdd
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = -15

[State 2024, Pal]
type = PalFX
trigger1 = (Vel y > 0) && (Pos y >= 0)
add = 200, 200, 200
mul = 256, 256, 256
time = 8

[State 2024, Life]
type = EnvShake
trigger1 = (Vel y > 0) && (Pos y >= 0)
time = 14
freq = 120
ampl = 8

[State 2024, Life]
type = PosSet
trigger1 = (Vel y > 0) && (Pos y >= 0)
y = 0

[State 2024, Hit Ground]
type = SelfState
trigger1 = (Vel y > 0) && (Pos y >= 0)
value = 5100
ctrl = 0

;Marker
[Statedef 2015]
type = S
movetype = I
physics = N
anim = 7300
sprpriority = -1

[State 2021, Invisible]
type = Width
trigger1 = 1
value = 0,0

[State 2021, Invisible]	
type = PlayerPush
trigger1 = 1
value = 0

[State 2021, End]
type = DestroySelf
trigger1 = Parent, Stateno != 2012
