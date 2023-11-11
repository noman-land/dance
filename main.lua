neutral=21
speed=6

function butn(t,n)
	return band(t,n)==n
end

function pressed(...)
	local check=0
	for b in all({...}) do check|=b end
	return (btn() & check) == check
end

function _init()
	frame=0
	flipped=false
	dude={
		x=63,
		y=63,
		dir=0
	}
	sprs={
		[0]=neutral,
		-- ⬅️
		[1]=18,
		-- ➡️
		[2]=18,
		-- ⬆️
		[4]=5,
		-- ⬇️
		[8]=37,
		-- ⬅️⬆️
		[5]=2,
		-- ➡️⬆️
		[6]=2,
		-- ⬅️⬇️
		[9]=35,
		-- ⬅️⬇️
		[10]=35,
		-- ⬇️⬅️➡️
		[11]=37,
		-- ⬆️⬅️➡️
		[7]=5,
		-- ⬅️⬆️⬇️
		[13]=18,
		-- ➡️⬆️⬇️
		[14]=18,
	}
end

function walk()
	local id=16
	if (dude.dir==0) then
		id=neutral
	elseif (flr(frame/(speed/2))%2==0) then
		id=32
	end
	spr(id,dude.x,dude.y,1,1,flipped)
end

function _update()
	frame=(frame+1)%speed
	dude.dir=btn()
	flipped=butn(dude.dir,2)
	
	if(butn(dude.dir,1)) dude.x-=1
  if(butn(dude.dir,2)) dude.x+=1
	if(butn(dude.dir,4)) dude.y-=1
	if(butn(dude.dir,8)) dude.y+=1
end

function _draw()
	cls(1)
	spr(
		sprs[dude.dir] or neutral,
		63,
		100,
		1,
		1,
		flipped
	)
	print(dude.dir)
	walk()
	print(dude.x)
end