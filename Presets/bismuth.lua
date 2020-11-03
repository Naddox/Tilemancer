function init()
    setName("Bismuth")
    setDesc("Sets up Bismuth")
end

function apply()	
	addNode("bricks.lua", -150, 0)		--0
	addNode("regulate.lua", -30, 50)	--1
	addNode("lump.lua", 90, 50)		--2
	addNode("blend.lua", 210, -75)		--3
	setParameter(0, 0, 0)
	setParameter(0, 1, 1)
	setParameter(0, 2, 1)
	setParameter(0, 3, 1)
	setParameter(0, 4, 100)
	setParameter(0, 5, 100)
	setParameter(1, 0, 17)
	setParameter(1, 1, 100)
	setParameter(2, 1, 100)
	setParameter(2, 2, 5)
	setParameter(2, 3, 9)
	setParameter(2, 4, 1)
	setParameter(3, 0, 2)
	addConnection(0, 0, 1, 0)
	addConnection(0, 0, 3, 0)
	addConnection(1, 0, 2, 0)
	addConnection(2, 0, 3, 1)
end