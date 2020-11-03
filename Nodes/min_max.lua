function init()
 setName("Min/Max")
 setDesc("Sets black and white values")
 setSize(100, 24+64+8+8+7+4+18+18+18)
 addOutput(24+32)
 addInput("Texture", 24+64+8+8)
 addParameter("Auto","Auto-get white and black values", 24+64+8+8+18, 0, 0, 1 )
 addInputParameter("Max", "White Value", 24+64+8+8+18+18, 100, 0, 100, true)
 addInputParameter("Min", "Black Value", 24+64+8+8+18+18+18, 0, 0, 100, true)
end

function apply()
 tileSize = getTileSize()
 whitemax=0
 blackmin=1
 if getValue(1,0,0,1)==1 then
  autominmax=true
  for i=0,tileSize*tileSize-1 do
   x = i%tileSize
   y = math.floor(i/tileSize)
   cr, cg, cb = getValue(0, x, y, 1.0)
   whitemax = math.max(whitemax,cr)
   whitemax = math.max(whitemax,cg)
   whitemax = math.max(whitemax,cb)
   blackmin = math.min(blackmin,cr)
   blackmin = math.min(blackmin,cg)
   blackmin = math.min(blackmin,cb)
  end
 else
  autominmax=false
 end
 
 for i=0, tileSize*tileSize-1 do
  x = i%tileSize
  y = math.floor(i/tileSize)
  cr, cg, cb = getValue(0, x, y, 1.0)
  if not autominmax then
   whitemax = getValue(2, x, y, 100.0)
   blackmin = getValue(3, x, y, 100.0)
  end
  if whitemax==0 then whitemax=0.000001 end
  if blackmin>=whitemax then blackmin=whitemax-0.0000001 end
  if cr<blackmin then cr=blackmin end
  if cg<blackmin then cg=blackmin end
  if cb<blackmin then cb=blackmin end
  if cr>whitemax then cr=whitemax end
  if cg>whitemax then cg=whitemax end
  if cb>whitemax then cb=whitemax end
  cr=(cr-blackmin)/(whitemax-blackmin)
  cg=(cg-blackmin)/(whitemax-blackmin)
  cb=(cb-blackmin)/(whitemax-blackmin)
  if cr>1 then cr=1 end
  if cg>1 then cg=1 end
  if cb>1 then cb=1 end
  if cr<0 then cr=0 end
  if cg<0 then cg=0 end
  if cb<0 then cb=0 end
  setPixel(0, x, y, cr, cg, cb)
 end
end