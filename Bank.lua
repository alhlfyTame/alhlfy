function Runbank(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
msg_reply_id = msg.reply_to_message_id
msg_user_send_id = msg.sender_id.user_id
Bot_Name = (Redis:get(Thealhlfy.."alhlfy:Name:Bot") or "لويس")
if text and text:match('^'..Bot_Name..' ') then
text = text:gsub('^'..Bot_Name..' ','')
end
if text then
local NewCmmd = Redis:get(Thealhlfy.."All:Get:Reides:Commands:Group"..text) or Redis:get(Thealhlfy.."alhlfy:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if text == 'تثبيت النتائج' or text == 'تثبيت نتائج' then
if msg.ControllerBot then
time = os.date("*t")
month = time.month
day = time.day
local_time = month.."/"..day
local bank_users = Redis:smembers(Thealhlfy.."booob")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇",
"🥈",
"🥉"
}
for k,v in pairs(mony_list) do
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(Thealhlfy.."medal"..v[2],convert_mony)
Redis:set(Thealhlfy.."medal2"..v[2],emo)
Redis:set(Thealhlfy.."medal3"..v[2],local_time)
Redis:sadd(Thealhlfy.."medalid",v[2])
Redis:set(Thealhlfy.."medal"..v[2],convert_mony)
Redis:set(Thealhlfy.."medal2"..v[2],emo)
Redis:set(Thealhlfy.."medal3"..v[2],local_time)
Redis:sadd(Thealhlfy.."medalid",v[2])
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(Thealhlfy.."medal"..v[2],convert_mony)
Redis:set(Thealhlfy.."medal2"..v[2],emo)
Redis:set(Thealhlfy.."medal3"..v[2],local_time)
Redis:sadd(Thealhlfy.."medalid",v[2])
if num == 4 then
return end
end
send(msg.chat_id,msg.id, "⇜ تم تثبيت النتائج","md",true)
end
end

if text == 'حذف لعبة البنك' or text == 'حذف لعبه البنك' then
if msg.ControllerBot then
Redis:del(Thealhlfy.."rrfffid")
Redis:del(Thealhlfy.."booob")
Redis:del(Thealhlfy.."taza")
Redis:del(Thealhlfy.."ownerfram")
Redis:del(Thealhlfy.."farmarname")
Redis:setex(Thealhlfy.."deletbank" .. 111,1123200, true)
send(msg.chat_id,msg.id, "⇜ حذفت لعبه البنك 🏦","md",true)
end
end
if text == 'مسح لعبه المزرعه' then
if msg.ControllerBot then
for k,v in pairs(Redis:smembers(Thealhlfy.."booob")) do 
Redis:del(Thealhlfy.."toplvfarm"..v)
Redis:del(Thealhlfy.."btatatime"..v)
Redis:del(Thealhlfy.."btatanum"..v)
Redis:del(Thealhlfy.."btataname"..v)
Redis:del(Thealhlfy.."lemontime"..v)
Redis:del(Thealhlfy.."lemonnum"..v)
Redis:del(Thealhlfy.."lemonname"..v)
Redis:del(Thealhlfy.."khesstime"..v)
Redis:del(Thealhlfy.."khessnum"..v)
Redis:del(Thealhlfy.."khessname"..v)
Redis:del(Thealhlfy.."kheartime"..v)
Redis:del(Thealhlfy.."khearnum"..v)
Redis:del(Thealhlfy.."khearname"..v)
Redis:del(Thealhlfy.."jzartime"..v)
Redis:del(Thealhlfy.."jzarnum"..v)
Redis:del(Thealhlfy.."jzarname"..v)
Redis:del(Thealhlfy.."fleflatime"..v)
Redis:del(Thealhlfy.."fleflanum"..v)
Redis:del(Thealhlfy.."fleflaname"..v)
Redis:del(Thealhlfy.."freaztime"..v)
Redis:del(Thealhlfy.."freaznum"..v)
Redis:del(Thealhlfy.."freazname"..v)
Redis:del(Thealhlfy.."doratime"..v)
Redis:del(Thealhlfy.."doranum"..v)
Redis:del(Thealhlfy.."doraname"..v)
Redis:del(Thealhlfy.."tomtime"..v)
Redis:del(Thealhlfy.."tomnum"..v)
Redis:del(Thealhlfy.."tomname"..v)
Redis:del(Thealhlfy.."ftrtime"..v)
Redis:del(Thealhlfy.."ftrnum"..v)
Redis:del(Thealhlfy.."ftrname"..v)
Redis:del(Thealhlfy.."tfahtime"..v)
Redis:del(Thealhlfy.."tfahnum"..v)
Redis:del(Thealhlfy.."tfahname"..v)
Redis:del(Thealhlfy.."enabtime"..v)
Redis:del(Thealhlfy.."enabnum"..v)
Redis:del(Thealhlfy.."enabname"..v)
Redis:del(Thealhlfy.."zetontime"..v)
Redis:del(Thealhlfy.."zetonnum"..v)
Redis:del(Thealhlfy.."zetonname"..v)
Redis:del(Thealhlfy.."mozztime"..v)
Redis:del(Thealhlfy.."mozznum"..v)
Redis:del(Thealhlfy.."mozzname"..v)
Redis:del(Thealhlfy.."mangatime"..v)
Redis:del(Thealhlfy.."manganum"..v)
Redis:del(Thealhlfy.."manganame"..v)
Redis:del(Thealhlfy.."sizefram"..v)
Redis:del(Thealhlfy.."namefram"..v)
Redis:del(Thealhlfy.."mzroatsize"..v)
end
Redis:del(Thealhlfy.."ownerfram")
Redis:del(Thealhlfy.."farmarname")
send(msg.chat_id,msg.id, "⇜ مسحت لعبه المزرعه 🏦","md",true)
end
end
if text == 'مسح لعبه الكره' or text == 'مسح لعبه النوادي' then
if msg.ControllerBot then
for k,v in pairs(Redis:smembers(Thealhlfy.."booob")) do 
Redis:del(Thealhlfy.."namenade"..v)
Redis:del(Thealhlfy.."nokatnade"..v)
Redis:del(Thealhlfy.."energynade"..v)
Redis:del(Thealhlfy.."traningnade"..v)
Redis:del(Thealhlfy.."lkbnade"..v)
Redis:del(Thealhlfy.."nameplayer".."1"..v)
Redis:del(Thealhlfy.."nameplayer".."2"..v)
Redis:del(Thealhlfy.."nameplayer".."3"..v)
Redis:del(Thealhlfy.."nameplayer".."4"..v)
Redis:del(Thealhlfy.."nameplayer".."5"..v)
Redis:del(Thealhlfy.."energyplayer".."1"..v)
Redis:del(Thealhlfy.."energyplayer".."2"..v)
Redis:del(Thealhlfy.."energyplayer".."3"..v)
Redis:del(Thealhlfy.."energyplayer".."4"..v)
Redis:del(Thealhlfy.."energyplayer".."5"..v)
Redis:del(Thealhlfy.."mrkzplayer".."1"..v)
Redis:del(Thealhlfy.."mrkzplayer".."2"..v)
Redis:del(Thealhlfy.."mrkzplayer".."3"..v)
Redis:del(Thealhlfy.."mrkzplayer".."4"..v)
Redis:del(Thealhlfy.."mrkzplayer".."5"..v)
Redis:del(Thealhlfy.."cityplayer".."1"..v)
Redis:del(Thealhlfy.."cityplayer".."2"..v)
Redis:del(Thealhlfy.."cityplayer".."3"..v)
Redis:del(Thealhlfy.."cityplayer".."4"..v)
Redis:del(Thealhlfy.."cityplayer".."5"..v)
Redis:del(Thealhlfy.."priceplayer".."1"..v)
Redis:del(Thealhlfy.."priceplayer".."2"..v)
Redis:del(Thealhlfy.."priceplayer".."3"..v)
Redis:del(Thealhlfy.."priceplayer".."4"..v)
Redis:del(Thealhlfy.."priceplayer".."5"..v)
end
Redis:del(Thealhlfy.."lkbnadesadd")
Redis:del(Thealhlfy.."ownernade")
send(msg.chat_id,msg.id, "⇜ مسحت لعبه النوادي ⚽️","md",true)
end
end

if text == 'مسح لعبة البنك' or text == 'مسح لعبه البنك' then
if msg.ControllerBot then
local bank_users = Redis:smembers(Thealhlfy.."booob")
for k,v in pairs(bank_users) do
Redis:del(Thealhlfy.."boob"..v)
Redis:del(Thealhlfy.."kreednum"..v)
Redis:del(Thealhlfy.."kreed"..v)
Redis:del(Thealhlfy.."rrfff"..v)
Redis:del(Thealhlfy.."numattack"..v)
Redis:del(Thealhlfy.."tabbroat"..v)
Redis:del(Thealhlfy.."shkse"..v)
Redis:del(Thealhlfy.."doltebank"..v)
Redis:del(Thealhlfy.."ratbinc"..v)
Redis:del(Thealhlfy.."ratbtrans"..v)
Redis:del(Thealhlfy.."mgrmasname"..v)
Redis:del(Thealhlfy.."mgrmasnum"..v)
Redis:del(Thealhlfy.."mgrkldname"..v)
Redis:del(Thealhlfy.."mgrkldnum"..v)
Redis:del(Thealhlfy.."mgrswrname"..v)
Redis:del(Thealhlfy.."mgrswrnum"..v)
Redis:del(Thealhlfy.."mgrktmname"..v)
Redis:del(Thealhlfy.."mgrktmnum"..v)
Redis:del(Thealhlfy.."akrksrname"..v)
Redis:del(Thealhlfy.."akrksrnum"..v)
Redis:del(Thealhlfy.."akrfelname"..v)
Redis:del(Thealhlfy.."akrfelnum"..v)
Redis:del(Thealhlfy.."akrmnzname"..v)
Redis:del(Thealhlfy.."akrmnznum"..v)
Redis:del(Thealhlfy.."airshbhname"..v)
Redis:del(Thealhlfy.."airshbhnum"..v)
Redis:del(Thealhlfy.."airsfarname"..v)
Redis:del(Thealhlfy.."airsfarnum"..v)
Redis:del(Thealhlfy.."airkhasname"..v)
Redis:del(Thealhlfy.."airkhasnum"..v)
Redis:del(Thealhlfy.."carrangname"..v)
Redis:del(Thealhlfy.."carrangnum"..v)
Redis:del(Thealhlfy.."caraccename"..v)
Redis:del(Thealhlfy.."caraccenum"..v)
Redis:del(Thealhlfy.."carcamrname"..v)
Redis:del(Thealhlfy.."carcamrnum"..v)
Redis:del(Thealhlfy.."caralntrname"..v)
Redis:del(Thealhlfy.."caralntrnum"..v)
Redis:del(Thealhlfy.."carhilxname"..v)
Redis:del(Thealhlfy.."carhilxnum"..v)
Redis:del(Thealhlfy.."carsonaname"..v)
Redis:del(Thealhlfy.."carsonanum"..v)
Redis:del(Thealhlfy.."carcoroname"..v)
Redis:del(Thealhlfy.."carcoronum"..v)
Redis:del(Thealhlfy.."rotpa"..v)
Redis:del(Thealhlfy.."rddd"..v)
Redis:del(Thealhlfy.."rotpagrid"..v)
Redis:del(Thealhlfy.."rotpaid"..v)
Redis:del(Thealhlfy.."rdddgr"..v)
Redis:del(Thealhlfy.."rdddid"..v)
Redis:del(Thealhlfy.."rdddtex"..v)
end
for k,v in pairs(Redis:smembers(Thealhlfy.."company_owners:")) do 
local Cname = Redis:get(Thealhlfy.."companys_name:"..v)
Redis:del(Thealhlfy.."companys_owner:"..Cname)
Redis:del(Thealhlfy.."companys_id:"..Cname)
Redis:del(Thealhlfy.."company:mem:"..Cname)
Redis:del(Thealhlfy.."companys_name:"..v)
end
Redis:del(Thealhlfy.."company_owners:")
Redis:del(Thealhlfy.."companys:")
Redis:del(Thealhlfy.."in_company:")
local bank_usersr = Redis:smembers(Thealhlfy.."rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(Thealhlfy.."boob"..v)
Redis:del(Thealhlfy.."rrfff"..v)
end
for k,v in pairs(Redis:smembers(Thealhlfy.."ownerfram")) do 
Redis:del(Thealhlfy.."toplvfarm"..v)
Redis:del(Thealhlfy.."btatatime"..v)
Redis:del(Thealhlfy.."btatanum"..v)
Redis:del(Thealhlfy.."btataname"..v)
Redis:del(Thealhlfy.."lemontime"..v)
Redis:del(Thealhlfy.."lemonnum"..v)
Redis:del(Thealhlfy.."lemonname"..v)
Redis:del(Thealhlfy.."khesstime"..v)
Redis:del(Thealhlfy.."khessnum"..v)
Redis:del(Thealhlfy.."khessname"..v)
Redis:del(Thealhlfy.."kheartime"..v)
Redis:del(Thealhlfy.."khearnum"..v)
Redis:del(Thealhlfy.."khearname"..v)
Redis:del(Thealhlfy.."jzartime"..v)
Redis:del(Thealhlfy.."jzarnum"..v)
Redis:del(Thealhlfy.."jzarname"..v)
Redis:del(Thealhlfy.."fleflatime"..v)
Redis:del(Thealhlfy.."fleflanum"..v)
Redis:del(Thealhlfy.."fleflaname"..v)
Redis:del(Thealhlfy.."freaztime"..v)
Redis:del(Thealhlfy.."freaznum"..v)
Redis:del(Thealhlfy.."freazname"..v)
Redis:del(Thealhlfy.."doratime"..v)
Redis:del(Thealhlfy.."doranum"..v)
Redis:del(Thealhlfy.."doraname"..v)
Redis:del(Thealhlfy.."tomtime"..v)
Redis:del(Thealhlfy.."tomnum"..v)
Redis:del(Thealhlfy.."tomname"..v)
Redis:del(Thealhlfy.."ftrtime"..v)
Redis:del(Thealhlfy.."ftrnum"..v)
Redis:del(Thealhlfy.."ftrname"..v)
Redis:del(Thealhlfy.."tfahtime"..v)
Redis:del(Thealhlfy.."tfahnum"..v)
Redis:del(Thealhlfy.."tfahname"..v)
Redis:del(Thealhlfy.."enabtime"..v)
Redis:del(Thealhlfy.."enabnum"..v)
Redis:del(Thealhlfy.."enabname"..v)
Redis:del(Thealhlfy.."zetontime"..v)
Redis:del(Thealhlfy.."zetonnum"..v)
Redis:del(Thealhlfy.."zetonname"..v)
Redis:del(Thealhlfy.."mozztime"..v)
Redis:del(Thealhlfy.."mozznum"..v)
Redis:del(Thealhlfy.."mozzname"..v)
Redis:del(Thealhlfy.."mangatime"..v)
Redis:del(Thealhlfy.."manganum"..v)
Redis:del(Thealhlfy.."manganame"..v)
Redis:del(Thealhlfy.."sizefram"..v)
Redis:del(Thealhlfy.."namefram"..v)
Redis:del(Thealhlfy.."mzroatsize"..v)
end
send(msg.chat_id,msg.id, "⇜ مسحت لعبه البنك 🏦","md",true)
end
end
if text == 'مسح لعبه الزواج' then
if msg.ControllerBot then
local zwag_users = Redis:smembers(Thealhlfy.."roogg1")
for k,v in pairs(zwag_users) do
Redis:del(Thealhlfy.."roog1"..v)
Redis:del(Thealhlfy.."rooga1"..v)
Redis:del(Thealhlfy.."rahr1"..v)
Redis:del(Thealhlfy.."rahrr1"..v)
Redis:del(Thealhlfy.."roogte1"..v)
end
local zwaga_users = Redis:smembers(Thealhlfy.."roogga1")
for k,v in pairs(zwaga_users) do
Redis:del(Thealhlfy.."roog1"..v)
Redis:del(Thealhlfy.."rooga1"..v)
Redis:del(Thealhlfy.."rahr1"..v)
Redis:del(Thealhlfy.."rahrr1"..v)
Redis:del(Thealhlfy.."roogte1"..v)
end
Redis:del(Thealhlfy.."roogga1")
Redis:del(Thealhlfy.."roogg1")
send(msg.chat_id,msg.id, "⇜ مسحت لعبه الزواج","md",true)
end
end
if text == 'ميدالياتي' or text == 'ميداليات' then

if Redis:sismember(Thealhlfy.."medalid",msg.sender_id.user_id) then
local medaa2 = Redis:get(Thealhlfy.."medal2"..msg.sender_id.user_id)
if medaa2 == "🥇" then
local medaa = Redis:get(Thealhlfy.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(Thealhlfy.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(Thealhlfy.."medal3"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "ميدالياتك ↤\n\nالتاريخ ↤ "..medaa3.." \nالفلوس ↤ "..medaa.." 💵\nالمركز ↤ "..medaa2.." كونكر "..medaa2.."\n✧","md",true)
elseif medaa2 == "🥈" then
local medaa = Redis:get(Thealhlfy.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(Thealhlfy.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(Thealhlfy.."medal3"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "ميدالياتك :\n\nالتاريخ ↤ "..medaa3.." \nالفلوس ↤ "..medaa.." 💵\nالمركز ↤ "..medaa2.." ايس "..medaa2.."\n✧","md",true)
else
local medaa = Redis:get(Thealhlfy.."medal"..msg.sender_id.user_id)
local medaa2 = Redis:get(Thealhlfy.."medal2"..msg.sender_id.user_id)
local medaa3 = Redis:get(Thealhlfy.."medal3"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "ميدالياتك ↤\n\nالتاريخ ↤ "..medaa3.." \nالفلوس ↤ "..medaa.." 💵\nالمركز ↤ "..medaa2.." كراون "..medaa2.."\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك ميداليات","md",true)
end
end
if text == Redis:get(Thealhlfy..'klmahzr'..msg.chat_id) and msg.sender_id.user_id == Redis:get(Thealhlfy..'playerhzr'..msg.chat_id) then
if not Redis:get(Thealhlfy.."playerhzrktm"..msg.chat_id..msg.sender_id.user_id) then
playerhzr = Redis:get(Thealhlfy..'playerhzr'..msg.chat_id)
Redis:srem(Thealhlfy.."alhlfy:SilentGroup:Group"..msg.chat_id,playerhzr) 
Redis:del(Thealhlfy.."playerhzrktm"..msg.chat_id..playerhzr)
end
end
if text and Redis:get(Thealhlfy.."Start_egabahzr"..msg.chat_id) then
playerhzr = Redis:get(Thealhlfy..'playerhzr'..msg.chat_id)
klmahzr = Redis:get(Thealhlfy..'klmahzr'..msg.chat_id)
local ban = bot.getUser(playerhzr)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..playerhzr..")"
else
news = '@['..ban.username..']'
end
if tonumber(playerhzr) == msg.sender_id.user_id then
if text == klmahzr then
Redis:del(Thealhlfy.."Start_egabahzr"..msg.chat_id)
Redis:del(Thealhlfy.."playerhzrktm"..msg.chat_id..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."alhlfy:SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
send(msg.chat_id,msg.id,"「 "..news.." 」\n⇜ كفو عليك حزرت الاجابة ( "..klmahzr.." )\n⇜ تم فك الكتم عنك \n✧ ","md",true)
end
end
end

if not Redis:get(Thealhlfy.."lock_getpankiuserall") or not Redis:get(Thealhlfy.."lock_getpankiuser"..msg.chat_id) then
if text == 'بنك' or text == 'البنك' then

send(msg.chat_id,msg.id,[[
☆ اوامر البنك

⌯ انشاء حساب بنكي  ↢ تسوي حساب وتقدر تحول فلوس مع مزايا ثانيه

⌯ مسح حساب بنكي  ↢ تلغي حسابك البنكي

⌯ تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس

⌯ حسابي  ↢ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك

⌯ فلوسي ↢ يعلمك كم فلوسك

⌯ راتب ↢ يعطيك راتب كل ١٠ دقائق

⌯ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق

⌯ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق

⌯ استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

⌯ حظ ↢ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك

⌯ مضاربه ↢ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ الى -٩٠٪؜ انت وحظك

⌯ هجوم ↢ تهجم عالخصم مع زيادة نسبة كل هجوم

⌯ كنز ↢ يعطيك كنز بسعر مختلف انتا وحظك

⌯ مراهنه ↢ تحط مبلغ وتراهن عليه

⌯ توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس بكل القروبات

⌯ توب الحراميه ↢ يطلع لك اكثر ناس زرفوا

⌯ زواج  ↢ تكتبه بالرد على رسالة شخص مع المهر ويزوجك

⌯ زواجي  ↢ يطلع وثيقة زواجك اذا متزوج

⌯ طلاق ↢ يطلقك اذا متزوج

⌯ خلع  ↢ يخلع زوجك ويرجع له المهر

⌯ زواجات ↢ يطلع اغلى ٣٠ زواجات

⌯ ترتيبي ↢ يطلع ترتيبك باللعبة

⌯ المعرض ↢ يمديك تشتري سيارات وعقارات وكثير اشياء

⌯ ممتلكاتي ↢ يطلع لك مشترياتك من المعرض

⌯ تبرع ↢ تتبرع الى افقر اللاعبين

⌯ انشاء شركه ↢ تنشئ شركتك وتضيف اصدقائك

⌯ بناء مزرعه ↢ تبني مزرعتك وتزرع وتحصد خضار

-
]],"md",true)  
return false
end
if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' or text == "انشاء حساب" or text == "فتح حساب بنكي" then

cobnum = tonumber(Redis:get(Thealhlfy.."bandid"..msg.sender_id.user_id))
if cobnum == msg.sender_id.user_id then
return send(msg.chat_id,msg.id, "⇜ حسابك محظور من لعبة البنك","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ لديك حساب بنكي مسبقاً\n\n⇜ لعرض معلومات حسابك اكتب\n⇠ `حسابي`","md",true)
end
ttshakse = '⇜ عشان تسوي حساب اختار نوع بطاقتك'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ماستر', data = msg.sender_id.user_id..'/master'},{text = 'فيزا', data = msg.sender_id.user_id..'/visaa'},{text = 'اكسبرس', data = msg.sender_id.user_id..'/express'},
},
{text = 'Louis',url="t.me/Y88F8"}, 
}
}
return send(msg.chat_id,msg.id,ttshakse,"md",false, false, false, false, reply_markup)
end
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" or text == "مسح حسابي" then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ مسحت حسابك البنكي 🏦","md",true)
Redis:srem(Thealhlfy.."booob", msg.sender_id.user_id)
Redis:srem(Thealhlfy.."taza", msg.sender_id.user_id)
Redis:del(Thealhlfy.."boob"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."boobb"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rrfff"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."rrfffid", msg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogg1", msg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogga1", msg.sender_id.user_id)
Redis:del(Thealhlfy.."roog1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rooga1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rahr1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rahrr1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tabbroat"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."shkse"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doltebank"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrmasname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrkldname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrswrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrktmname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrksrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrksrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrfelname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrfelnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrmnzname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrmnznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airshbhname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airshbhnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airsfarname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airsfarnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airkhasname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airkhasnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carrangname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carrangnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caraccename"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caraccenum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcamrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcamrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caralntrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caralntrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carhilxname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carhilxnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carsonaname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carsonanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcoroname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcoronum"..msg.sender_id.user_id)
namfra = Redis:get(Thealhlfy.."namefram"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."toplvfarm"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btatatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btatanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btataname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemontime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khesstime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khessnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khessname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."kheartime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khearnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khearname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzartime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflaname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freaztime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freaznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freazname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doratime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doranum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doraname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetontime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozztime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozzname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mangatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."manganum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."manganame"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."sizefram"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."namefram"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mzroatsize"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."farmarname", namfra)
Redis:srem(Thealhlfy.."ownerfram",msg.sender_id.user_id)
namenad = Redis:get(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."namenade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nokatnade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energynade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."traningnade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."5"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."lkbnadesadd", namenad)
Redis:srem(Thealhlfy.."ownernade",msg.sender_id.user_id)
Redis:del(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return send(msg.chat_id,msg.id, "⇜ ماعندك فلوس \n✧","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id, "⇜ فلوسك `"..convert_mony.."`  ريال 💵","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match("^فلوس @(%S+)$") or text and text:match("^فلوسه @(%S+)$") then
local UserName = text:match("^فلوس @(%S+)$") or text:match("^فلوسه @(%S+)$")
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg.chat_id,msg.id,"\n⇜ مافيه حساب كذا ","md",true)
end
local UserInfo = bot.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n⇜ هذا بوت  ","md",true)  
end
if Redis:sismember(Thealhlfy.."booob",UserId_Info.id) then
ballanceed = Redis:get(Thealhlfy.."boob"..UserId_Info.id) or 0
local convert_mony = string.format("%.0f",ballanceed)
send(msg.chat_id,msg.id, "⇜ فلوسه `"..convert_mony.."` ريال 💵","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then

local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك ","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
send(msg.chat_id,msg.id, "⇜ فلوسه `"..convert_mony.."` ريال 💵","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then

local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد اسم"
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
cccc = Redis:get(Thealhlfy.."boobb"..msg.sender_id.user_id)
uuuu = Redis:get(Thealhlfy.."bbobb"..msg.sender_id.user_id)
pppp = Redis:get(Thealhlfy.."rrfff"..msg.sender_id.user_id) or 0
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
doltebank = Redis:get(Thealhlfy.."doltebank"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballancee)
if shkse == "طيبة" then
shkseemg = "طيبة 😇"
else
shkseemg = "شريرة 😈"
end
send(msg.chat_id,msg.id, "⇜ الاسم ↤ "..news.."\n⇜ الحساب ↤ `"..cccc.."`\n⇜ بنك ↤ ❲ لويس ❳\n⇜ نوع ↤ ❲ "..uuuu.." ❳\n⇜ الرصيد ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ الزرف ❲ "..math.floor(pppp).." ريال 💵 ❳\n⇜ شخصيتك ↤ ❲ "..shkseemg.." ❳\n⇜ دولتك ↤ ❲ "..doltebank.." ❳","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
if msg.ControllerBot then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك ","md",true)  
return false
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد اسم"
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local Cname = Redis:get(Thealhlfy.."in_company:name:"..msg.sender_id.user_id) or 0
Redis:srem(Thealhlfy.."company:mem:"..Cname, msg.sender_id.user_id)
Redis:srem(Thealhlfy.."in_company:", msg.sender_id.user_id)
Redis:del(Thealhlfy.."in_company:name:"..msg.sender_id.user_id, Cname)
ccccc = Redis:get(Thealhlfy.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(Thealhlfy.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(Thealhlfy.."rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem(Thealhlfy.."booob", Remsg.sender_id.user_id)
Redis:srem(Thealhlfy.."taza", Remsg.sender_id.user_id)
namfra = Redis:get(Thealhlfy.."namefram"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."boob"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."boobb"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rrfff"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."numattack"..Remsg.sender_id.user_id)
Redis:srem(Thealhlfy.."rrfffid", Remsg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogg1", Remsg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogga1", Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."roog1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rooga1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rahr1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rahrr1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tabbroat"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."shkse"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."doltebank"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."ratbinc"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."ratbtrans"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrmasname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrmasnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrkldname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrkldnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrswrname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrswrnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrktmname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrktmnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."akrksrname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."akrksrnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."akrfelname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."akrfelnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."akrmnzname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."akrmnznum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."airshbhname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."airshbhnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."airsfarname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."airsfarnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."airkhasname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."airkhasnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carrangname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carrangnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."caraccename"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."caraccenum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carcamrname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carcamrnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."caralntrname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."caralntrnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carhilxname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carhilxnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carsonaname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carsonanum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carcoroname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."carcoronum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rotpa"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rddd"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rotpagrid"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rotpaid"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rdddgr"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rdddid"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."rdddtex"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."toplvfarm"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."btatatime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."btatanum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."btataname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."lemontime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."khesstime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."khessnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."khessname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."kheartime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."khearnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."khearname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."jzartime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflatime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflanum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflaname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."freaztime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."freaznum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."freazname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."doratime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."doranum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."doraname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tomtime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tomnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tomname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrtime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahtime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."enabtime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."enabnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."enabname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."zetontime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonnum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mozztime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mozznum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mozzname"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mangatime"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."manganum"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."manganame"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."sizefram"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."namefram"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mzroatsize"..Remsg.sender_id.user_id)
Redis:srem(Thealhlfy.."farmarname", namfra)
Redis:srem(Thealhlfy.."ownerfram",Remsg.sender_id.user_id)
namenad = Redis:get(Thealhlfy.."lkbnade"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."namenade"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."nokatnade"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."energynade"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."traningnade"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."2"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."3"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."4"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."5"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."2"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."3"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."4"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."5"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."2"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."3"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."4"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."5"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."1"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."2"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."3"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."4"..Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."5"..Remsg.sender_id.user_id)
Redis:srem(Thealhlfy.."lkbnadesadd", namenad)
Redis:srem(Thealhlfy.."ownernade",Remsg.sender_id.user_id)
Redis:del(Thealhlfy.."lkbnade"..Remsg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ الاسم ↤ "..news.."\n⇜ الحساب ↤ `"..ccccc.."`\n⇜ بنك ↤ ❲ لويس ❳\n⇜ نوع ❲ "..uuuuu.." ❳\n⇜ الرصيد ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ الزرف ↤ ❲ "..math.floor(ppppp).." ريال 💵 ❳\n⇜ مسكين مسحت حسابه","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي اصلاً ","md",true)
end
end
end
if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then

local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك ","md",true)  
return false
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد اسم"
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
ccccc = Redis:get(Thealhlfy.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(Thealhlfy.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(Thealhlfy.."rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
shkse = Redis:get(Thealhlfy.."shkse"..Remsg.sender_id.user_id)
doltebank = Redis:get(Thealhlfy.."doltebank"..Remsg.sender_id.user_id)
local convert_mony = string.format("%.0f",ballanceed)
if shkse == "طيبة" then
shkseemg = "طيبة 😇"
else
shkseemg = "شريرة 😈"
end
send(msg.chat_id,msg.id, "⇜ الاسم ↤ "..news.."\n⇜ الحساب ↤ `"..ccccc.."`\n⇜ بنك ↤ ❲ لويس ❳\n⇜ نوع ↤ ❲ "..uuuuu.." ❳\n⇜ الرصيد ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ الزرف ↤ ❲ "..math.floor(ppppp).." ريال 💵 ❳\n⇜ شخصيتك ↤ ❲ "..shkseemg.." ❳\n⇜ دولتك ↤ ❲ "..doltebank.." ❳ ","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
if text and text:match('^نسبه الحظ (.*)$') or text and text:match('^نسبة الحظ (.*)$') then
if msg.ControllerBot then
local UserName = text:match('^نسبه الحظ (.*)$') or text:match('^نسبة الحظ (.*)$')
local coniss = coin(UserName)
if coniss == 0 then
Redis:del(Thealhlfy.."nsbhad"..1)
Redis:set(Thealhlfy.."nsbhad"..1,0)
send(msg.chat_id,msg.id, "⇜ تم تعيين نسبة الحظ 0%","md",true)
elseif coniss == 50 then
Redis:del(Thealhlfy.."nsbhad"..1)
Redis:set(Thealhlfy.."nsbhad"..1,50)
send(msg.chat_id,msg.id, "⇜ تم تعيين نسبة الحظ 50%","md",true)
elseif coniss == 75 then
Redis:del(Thealhlfy.."nsbhad"..1)
Redis:set(Thealhlfy.."nsbhad"..1,75)
send(msg.chat_id,msg.id, "⇜ تم تعيين نسبة الحظ 75%","md",true)
elseif coniss == 100 then
Redis:del(Thealhlfy.."nsbhad"..1)
Redis:set(Thealhlfy.."nsbhad"..1,100)
send(msg.chat_id,msg.id, "⇜ تم تعيين نسبة الحظ 100%","md",true)
else
send(msg.chat_id,msg.id, "⇜ نسبة الحظ خطأ\n⇜ يرجى اختيار النسبة كالتالي :\n⇜ نسبه الحظ 0 او 50 او 75 او 100","md",true)
end
end
end
if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') then
if msg.ControllerBot then
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
local coniss = coin(UserName)
local ban = bot.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم "
end
if Redis:sismember(Thealhlfy.."booob",coniss) then
local Cname = Redis:get(Thealhlfy.."in_company:name:"..coniss) or 0
Redis:srem(Thealhlfy.."company:mem:"..Cname, coniss)
Redis:srem(Thealhlfy.."in_company:", coniss)
Redis:del(Thealhlfy.."in_company:name:"..coniss, Cname)
ccccc = Redis:get(Thealhlfy.."boobb"..coniss)
uuuuu = Redis:get(Thealhlfy.."bbobb"..coniss)
ppppp = Redis:get(Thealhlfy.."rrfff"..coniss) or 0
ballanceed = Redis:get(Thealhlfy.."boob"..coniss) or 0
local convert_mony = string.format("%.0f",ballanceed)
namfra = Redis:get(Thealhlfy.."namefram"..coniss)
Redis:srem(Thealhlfy.."booob", coniss)
Redis:srem(Thealhlfy.."taza", coniss)
Redis:del(Thealhlfy.."boob"..coniss)
Redis:del(Thealhlfy.."boobb"..coniss)
Redis:del(Thealhlfy.."rrfff"..coniss)
Redis:srem(Thealhlfy.."roogg1", coniss)
Redis:srem(Thealhlfy.."roogga1", coniss)
Redis:del(Thealhlfy.."roog1"..coniss)
Redis:del(Thealhlfy.."rooga1"..coniss)
Redis:del(Thealhlfy.."rahr1"..coniss)
Redis:del(Thealhlfy.."rahrr1"..coniss)
Redis:del(Thealhlfy.."tabbroat"..coniss)
Redis:del(Thealhlfy.."shkse"..coniss)
Redis:del(Thealhlfy.."doltebank"..coniss)
Redis:del(Thealhlfy.."ratbinc"..coniss)
Redis:del(Thealhlfy.."ratbtrans"..coniss)
Redis:del(Thealhlfy.."numattack"..coniss)
Redis:del(Thealhlfy.."mgrmasname"..coniss)
Redis:del(Thealhlfy.."mgrmasnum"..coniss)
Redis:del(Thealhlfy.."mgrkldname"..coniss)
Redis:del(Thealhlfy.."mgrkldnum"..coniss)
Redis:del(Thealhlfy.."mgrswrname"..coniss)
Redis:del(Thealhlfy.."mgrswrnum"..coniss)
Redis:del(Thealhlfy.."mgrktmname"..coniss)
Redis:del(Thealhlfy.."mgrktmnum"..coniss)
Redis:del(Thealhlfy.."akrksrname"..coniss)
Redis:del(Thealhlfy.."akrksrnum"..coniss)
Redis:del(Thealhlfy.."akrfelname"..coniss)
Redis:del(Thealhlfy.."akrfelnum"..coniss)
Redis:del(Thealhlfy.."akrmnzname"..coniss)
Redis:del(Thealhlfy.."akrmnznum"..coniss)
Redis:del(Thealhlfy.."airshbhname"..coniss)
Redis:del(Thealhlfy.."airshbhnum"..coniss)
Redis:del(Thealhlfy.."airsfarname"..coniss)
Redis:del(Thealhlfy.."airsfarnum"..coniss)
Redis:del(Thealhlfy.."airkhasname"..coniss)
Redis:del(Thealhlfy.."airkhasnum"..coniss)
Redis:del(Thealhlfy.."carrangname"..coniss)
Redis:del(Thealhlfy.."carrangnum"..coniss)
Redis:del(Thealhlfy.."caraccename"..coniss)
Redis:del(Thealhlfy.."caraccenum"..coniss)
Redis:del(Thealhlfy.."carcamrname"..coniss)
Redis:del(Thealhlfy.."carcamrnum"..coniss)
Redis:del(Thealhlfy.."caralntrname"..coniss)
Redis:del(Thealhlfy.."caralntrnum"..coniss)
Redis:del(Thealhlfy.."carhilxname"..coniss)
Redis:del(Thealhlfy.."carhilxnum"..coniss)
Redis:del(Thealhlfy.."carsonaname"..coniss)
Redis:del(Thealhlfy.."carsonanum"..coniss)
Redis:del(Thealhlfy.."carcoroname"..coniss)
Redis:del(Thealhlfy.."carcoronum"..coniss)
Redis:srem(Thealhlfy.."rrfffid", coniss)
Redis:del(Thealhlfy.."rotpa"..coniss)
Redis:del(Thealhlfy.."rddd"..coniss)
Redis:del(Thealhlfy.."rotpagrid"..coniss)
Redis:del(Thealhlfy.."rotpaid"..coniss)
Redis:del(Thealhlfy.."rdddgr"..coniss)
Redis:del(Thealhlfy.."rdddid"..coniss)
Redis:del(Thealhlfy.."rdddtex"..coniss)
Redis:del(Thealhlfy.."toplvfarm"..coniss)
Redis:del(Thealhlfy.."btatatime"..coniss)
Redis:del(Thealhlfy.."btatanum"..coniss)
Redis:del(Thealhlfy.."btataname"..coniss)
Redis:del(Thealhlfy.."lemontime"..coniss)
Redis:del(Thealhlfy.."lemonnum"..coniss)
Redis:del(Thealhlfy.."lemonname"..coniss)
Redis:del(Thealhlfy.."khesstime"..coniss)
Redis:del(Thealhlfy.."khessnum"..coniss)
Redis:del(Thealhlfy.."khessname"..coniss)
Redis:del(Thealhlfy.."kheartime"..coniss)
Redis:del(Thealhlfy.."khearnum"..coniss)
Redis:del(Thealhlfy.."khearname"..coniss)
Redis:del(Thealhlfy.."jzartime"..coniss)
Redis:del(Thealhlfy.."jzarnum"..coniss)
Redis:del(Thealhlfy.."jzarname"..coniss)
Redis:del(Thealhlfy.."fleflatime"..coniss)
Redis:del(Thealhlfy.."fleflanum"..coniss)
Redis:del(Thealhlfy.."fleflaname"..coniss)
Redis:del(Thealhlfy.."freaztime"..coniss)
Redis:del(Thealhlfy.."freaznum"..coniss)
Redis:del(Thealhlfy.."freazname"..coniss)
Redis:del(Thealhlfy.."doratime"..coniss)
Redis:del(Thealhlfy.."doranum"..coniss)
Redis:del(Thealhlfy.."doraname"..coniss)
Redis:del(Thealhlfy.."tomtime"..coniss)
Redis:del(Thealhlfy.."tomnum"..coniss)
Redis:del(Thealhlfy.."tomname"..coniss)
Redis:del(Thealhlfy.."ftrtime"..coniss)
Redis:del(Thealhlfy.."ftrnum"..coniss)
Redis:del(Thealhlfy.."ftrname"..coniss)
Redis:del(Thealhlfy.."tfahtime"..coniss)
Redis:del(Thealhlfy.."tfahnum"..coniss)
Redis:del(Thealhlfy.."tfahname"..coniss)
Redis:del(Thealhlfy.."enabtime"..coniss)
Redis:del(Thealhlfy.."enabnum"..coniss)
Redis:del(Thealhlfy.."enabname"..coniss)
Redis:del(Thealhlfy.."zetontime"..coniss)
Redis:del(Thealhlfy.."zetonnum"..coniss)
Redis:del(Thealhlfy.."zetonname"..coniss)
Redis:del(Thealhlfy.."mozztime"..coniss)
Redis:del(Thealhlfy.."mozznum"..coniss)
Redis:del(Thealhlfy.."mozzname"..coniss)
Redis:del(Thealhlfy.."mangatime"..coniss)
Redis:del(Thealhlfy.."manganum"..coniss)
Redis:del(Thealhlfy.."manganame"..coniss)
Redis:del(Thealhlfy.."sizefram"..coniss)
Redis:del(Thealhlfy.."namefram"..coniss)
Redis:del(Thealhlfy.."mzroatsize"..coniss)
Redis:srem(Thealhlfy.."farmarname", namfra)
Redis:srem(Thealhlfy.."ownerfram",coniss)
namenad = Redis:get(Thealhlfy.."lkbnade"..coniss)
Redis:del(Thealhlfy.."namenade"..coniss)
Redis:del(Thealhlfy.."nokatnade"..coniss)
Redis:del(Thealhlfy.."energynade"..coniss)
Redis:del(Thealhlfy.."traningnade"..coniss)
Redis:del(Thealhlfy.."nameplayer".."1"..coniss)
Redis:del(Thealhlfy.."nameplayer".."2"..coniss)
Redis:del(Thealhlfy.."nameplayer".."3"..coniss)
Redis:del(Thealhlfy.."nameplayer".."4"..coniss)
Redis:del(Thealhlfy.."nameplayer".."5"..coniss)
Redis:del(Thealhlfy.."energyplayer".."1"..coniss)
Redis:del(Thealhlfy.."energyplayer".."2"..coniss)
Redis:del(Thealhlfy.."energyplayer".."3"..coniss)
Redis:del(Thealhlfy.."energyplayer".."4"..coniss)
Redis:del(Thealhlfy.."energyplayer".."5"..coniss)
Redis:del(Thealhlfy.."mrkzplayer".."1"..coniss)
Redis:del(Thealhlfy.."mrkzplayer".."2"..coniss)
Redis:del(Thealhlfy.."mrkzplayer".."3"..coniss)
Redis:del(Thealhlfy.."mrkzplayer".."4"..coniss)
Redis:del(Thealhlfy.."mrkzplayer".."5"..coniss)
Redis:del(Thealhlfy.."cityplayer".."1"..coniss)
Redis:del(Thealhlfy.."cityplayer".."2"..coniss)
Redis:del(Thealhlfy.."cityplayer".."3"..coniss)
Redis:del(Thealhlfy.."cityplayer".."4"..coniss)
Redis:del(Thealhlfy.."cityplayer".."5"..coniss)
Redis:del(Thealhlfy.."priceplayer".."1"..coniss)
Redis:del(Thealhlfy.."priceplayer".."2"..coniss)
Redis:del(Thealhlfy.."priceplayer".."3"..coniss)
Redis:del(Thealhlfy.."priceplayer".."4"..coniss)
Redis:del(Thealhlfy.."priceplayer".."5"..coniss)
Redis:srem(Thealhlfy.."lkbnadesadd", namenad)
Redis:srem(Thealhlfy.."ownernade",coniss)
Redis:del(Thealhlfy.."lkbnade"..coniss)
send(msg.chat_id,msg.id, "⇜ الاسم ↤ "..news.."\n⇜ الحساب ↤ `"..ccccc.."`\n⇜ بنك ↤ ❲ لويس ❳\n⇜ نوع ↤ ❲ "..uuuuu.." ❳\n⇜ الرصيد ↤ ❲ "..convert_mony.." ❳ ريال 💵 )\n⇜ الزرف ↤ ❲ "..math.floor(ppppp).." ريال 💵 ❳\n⇜ مسكين مسحت حسابه","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي اصلاً ","md",true)
end
end
end
if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') then

local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
local coniss = coin(UserName)
if Redis:get(Thealhlfy.."boballcc"..coniss) then
local yty = Redis:get(Thealhlfy.."boballname"..coniss)
local bobpkh = Redis:get(Thealhlfy.."boballid"..coniss)
ballancee = Redis:get(Thealhlfy.."boob"..bobpkh) or 0
local convert_mony = string.format("%.0f",ballancee)
local dfhb = Redis:get(Thealhlfy.."boballbalc"..coniss)
local fsvhh = Redis:get(Thealhlfy.."boballban"..coniss)
shkse = Redis:get(Thealhlfy.."shkse"..coniss)
doltebank = Redis:get(Thealhlfy.."doltebank"..coniss)
if shkse == "طيبة" then
shkseemg = "طيبة 😇"
else
shkseemg = "شريرة 😈"
end
send(msg.chat_id,msg.id, "⇜ الاسم ↤ "..yty.."\n⇜ الحساب ↤ `"..coniss.."`\n⇜ بنك ↤ ❲ لويس ❳\n⇜ نوع ↤ ❲ "..fsvhh.." ❳\n⇜ الرصيد ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ شخصيتك ↤ ❲ "..shkseemg.." ❳\n⇜ دولتك ↤ ❲ "..doltebank.." ❳","md",true)
else
send(msg.chat_id,msg.id, "⇜ مافيه حساب بنكي كذا","md",true)
end
end
if text and text:match('اكشط (.*)') then

local TextAksht = text:match('اكشط (.*)')
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي ↤ "..msg.sender_id.user_id.."\n⇜ القروب ↤ "..msg.chat_id.."\n⇜ الرسالة ↤ "..text.."\n✧","md",true)
end
if not Redis:sismember(Thealhlfy.."Akshtd:Games:",TextAksht) then
return send(msg.chat_id,msg.id,"⇜ الرمز مستخدم قبل !")
end
local list ={"100000","200000","300000","400000","500000","600000"}
local Number = tonumber(list[math.random(#list)])
Redis:srem(Thealhlfy.."Akshtd:Games:",TextAksht)
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
cobonplus = tonumber(ballancee) + Number
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , cobonplus)
local UserInfoo = bot.getUser(msg.sender_id.user_id)
local GetName = '- ['..UserInfoo.first_name..'](tg://user?id='..msg.sender_id.user_id..')'
return send(msg.chat_id,msg.id,GetName.."\n\n⇜ مبروك كشطتها واخذت ↤ "..Number.. " ريال 💵\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ","md",true)
end
end
if text == "قائمه اكشطها" then
if not msg.ControllerBot then
return send(msg.chat_id,msg.id,'\n⇜ هذا الامر يخص المطور الاساسي ',"md",true)  
end
local Text = Redis:smembers(Thealhlfy.."Akshtd:Games:") 
if #Text == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد رموز اكشطها","md",true)  
end
local Texter = "\n⇜ قائمة اكشطها : \n\n"
for k, v in pairs(Text) do
Texter = Texter..""..k.."- `"..v.."`\n"
end
return send(msg.chat_id,msg.id,Texter,"md")
end
if text == "صنع اكشطها" then
if not msg.ControllerBot then
return send(msg.chat_id,msg.id,'\n⇜ هذا الامر يخص المطور الاساسي ',"md",true)  
end
Redis:del(Thealhlfy.."Akshtd:Games:")
local list ={"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"}
local En = list[math.random(#list)]
local En1 = list[math.random(#list)]
local En2 = list[math.random(#list)]
local En3 = list[math.random(#list)]
local En4 = list[math.random(#list)]
local En5 = list[math.random(#list)]
local En6 = list[math.random(#list)]
local En7 = list[math.random(#list)]
local En8 = list[math.random(#list)]
local En9 = list[math.random(#list)]
local Num = En..En1..En2..En3..En4..En5..En6..En7..En8..En9
local Num1 = En..En1..En9..En8..En6..En7..En5..En4..En3..En2
local Num2 = En1..En2..En3..En4..En5..En6..En7..En8..En9..En
local Num3 = En9..En2..En..En4..En6..En5..En8..En3..En1..En7
local Num4 = En6..En7..En8..En9..En..En1..En2..En3..En4..En5
local Num5 = En5..En4..En3..En2..En1..En..En9..En8..En7..En6
local Num6 = En6..En7..En3..En2..En1..En5..En4..En..En9..En8
local Num7 = En1..En..En2..En7..En4..En3..En6..En5..En9..En8
local Num8 = En2..En4..En5..En6..En4..En8..En3..En7..En..En9
local Num9 = En1..En..En3..En5..En7..En9..En2..En4..En6..En8
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num1)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num2)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num3)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num4)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num5)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num6)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num7)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num8)
Redis:sadd(Thealhlfy.."Akshtd:Games:",Num9)
return send(msg.chat_id,msg.id,[[
⇜ تم صنع قائمة اكشط جديدة :

1 ↦ `]]..Num..[[`

2 ↦ `]]..Num1..[[`

3 ↦ `]]..Num2..[[`

4 ↦ `]]..Num3..[[`

5 ↦ `]]..Num4..[[`

6 ↦ `]]..Num5..[[`

7 ↦ `]]..Num6..[[`

8 ↦ `]]..Num7..[[`

9 ↦ `]]..Num8..[[`

10 ↦ `]]..Num9..[[`
]],"md")
end
if text == 'مضاربه' then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:ttl(Thealhlfy.."iiooooo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iiooooo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد "..time.." ","md",true)
end
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `مضاربه` المبلغ","md",true)
end
if text and text:match('^مضاربه (.*)$') or text and text:match('^مضاربة (.*)$') then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local UserName = text:match('^مضاربه (.*)$') or text:match('^مضاربة (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي ↤ "..msg.sender_id.user_id.."\n⇜ القروب ↤ "..msg.chat_id.."\n⇜ الرسالة ↤ "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iiooooo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iiooooo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تضارب الحين\n⇜ تعال بعد "..time.." ","md",true)
end
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 ريال 💵\n✧","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
local modarba = {"1", "2", "3", "4"}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee - ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(Thealhlfy.."iiooooo" .. msg.sender_id.user_id,900, true)
send(msg.chat_id,msg.id, "⇜ مضاربة فاشلة 📉\n⇜ نسبة الخسارة ↤ "..modarbaa.."%\n⇜ المبلغ الذي خسرته ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ فلوسك صارت ↤ ❲ "..convert_mony1.." ريال 💵 ❳\n✧","md",true)
else
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ballanceekkku))
Redis:setex(Thealhlfy.."iiooooo" .. msg.sender_id.user_id,900, true)
send(msg.chat_id,msg.id, "⇜ مضاربة ناجحة 📈\n⇜ نسبة الربح ↤ "..modarbaa.."%\n⇜ المبلغ الذي ربحته ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ فلوسك صارت ↤ ❲ "..convert_mony1.." ريال 💵 ❳\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'استثمار' then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:ttl(Thealhlfy.."iioooo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iioooo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد "..time.." ","md",true)
end
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `استثمار` المبلغ","md",true)
end
if text and text:match('^استثمار (.*)$') then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local UserName = text:match('^استثمار (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iioooo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iioooo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تستثمر الحين\n⇜ تعال بعد "..time.." ","md",true)
end
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 ريال 💵\n✧","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
local hadddd = math.random(1,9);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ballanceekkk))
Redis:setex(Thealhlfy.."iioooo" .. msg.sender_id.user_id,1200, true)
send(msg.chat_id,msg.id, "⇜ استثمار ناجح 💰\n⇜ نسبة الربح ↤ "..hadddd.."%\n⇜ مبلغ الربح ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ فلوسك صارت ↤ ❲ "..convert_mony1.." ريال 💵 ❳\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'سحب' then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:ttl(Thealhlfy.."iioood" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iioood" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تلعب سحب الحين\n⇜ تعال بعد "..time.." ","md",true)
end
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `سحب` المبلغ","md",true)
end
if text == 'حظ' then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:ttl(Thealhlfy.."iiooo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iiooo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تلعب حظ الحين\n⇜ تعال بعد "..time.." ","md",true)
end
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `حظ` المبلغ","md",true)
end
if text and text:match('^حظ (.*)$') then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local UserName = text:match('^حظ (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iiooo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iiooo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تلعب حظ الحين\n⇜ تعال بعد "..time.." ","md",true)
end
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 99 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 100 ريال 💵\n✧","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
nsbhad = Redis:get(Thealhlfy.."nsbhad"..1) or 50
if tonumber(nsbhad) == 0 then
daddd = {"2"}
elseif tonumber(nsbhad) == 50 then
daddd = {"1", "2"}
elseif tonumber(nsbhad) == 75 then
daddd = {"1", "2", "1"}
else
daddd = {"1", "1"}
end
haddd = daddd[math.random(#daddd)]
if haddd == "1" then
local ballanceek = ballancee + coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceek)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ballanceek))
Redis:setex(Thealhlfy.."iiooo" .. msg.sender_id.user_id,900, true)
send(msg.chat_id,msg.id, "⇜ مبروك فزت بالحظ 🎉\n⇜ فلوسك قبل ↤ ❲ "..convert_mony.." ريال 💵 ❳\n⇜ رصيدك الان ↤ ❲ `"..convert_mony1.."` ريال 💵 ❳\n✧","md",true)
else
local ballanceekk = ballancee - coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceekk)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ballanceekk))
Redis:setex(Thealhlfy.."iiooo" .. msg.sender_id.user_id,900, true)
send(msg.chat_id,msg.id, "⇜ للاسف خسرت بالحظ 😬\n⇜ فلوسك قبل ↤ ❲ "..convert_mony.." درهم 💵 ❳\n⇜ رصيدك الان ↤ ❲ `"..convert_mony1.."` درهم 💵 ❳\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تحويل' then
if Redis:ttl(Thealhlfy.."tanstime" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."tanstime" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تحول فلوس الحين\n⇜ تعال بعد "..time.." ","md",true)
end
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `تحويل` المبلغ","md",true)
end
if text and text:match('^تحويل (.*)$') then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local UserName = text:match('^تحويل (.*)$')
local coniss = coin(UserName)
if not Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ","md",true)
end
if Redis:ttl(Thealhlfy.."tanstime" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."tanstime" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تحول فلوس الحين\n⇜ تعال بعد "..time.." ","md",true)
end
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) < 100 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح به هو 100 درهم \n✧","md",true)
end
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي\n✧","md",true)
end
Redis:set(Thealhlfy.."transn"..msg.sender_id.user_id,coniss)
Redis:setex(Thealhlfy.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
send(msg.chat_id,msg.id,[[
⇜ ارسل الحين رقم الحساب البنكي الي تبي تحول له

– معاك دقيقة وحدة والغي طلب التحويل .
✧
]],"md",true)  
return false
end
if Redis:get(Thealhlfy.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
cccc = Redis:get(Thealhlfy.."boobb"..msg.sender_id.user_id)
uuuu = Redis:get(Thealhlfy.."bbobb"..msg.sender_id.user_id)
if text ~= text:match('^(%d+)$') then
Redis:del(Thealhlfy.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(Thealhlfy.."transn" .. msg.sender_id.user_id)
return send(msg.chat_id,msg.id,"⇜ ارسل رقم حساب بنكي ","md",true)
end
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي ↤ "..msg.sender_id.user_id.."\n⇜ القروب ↤ "..msg.chat_id.."\n⇜ الرسالة ↤ "..text.."\n✧","md",true)
end
if text == cccc then
Redis:del(Thealhlfy.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(Thealhlfy.."transn" .. msg.sender_id.user_id)
return send(msg.chat_id,msg.id,"⇜ مايمديك تحول لنفسك ","md",true)
end
if Redis:get(Thealhlfy.."boballcc"..text) then
local UserNamey = Redis:get(Thealhlfy.."transn"..msg.sender_id.user_id)
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
local fsvhhh = Redis:get(Thealhlfy.."boballid"..text)
local bann = bot.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد اسم"
end
local fsvhh = Redis:get(Thealhlfy.."boballban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey - UserNameyr
local convert_mony = string.format("%.0f",UserNameyy)
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
deccde = ballancee - UserNamey
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(deccde))
decdecb = Redis:get(Thealhlfy.."boob"..fsvhhh) or 0
deccde2 = decdecb + UserNameyy
Redis:set(Thealhlfy.."boob"..fsvhhh , math.floor(deccde2))
Redis:setex(Thealhlfy.."tanstime" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⇜ حوالة صادرة من بنك لويس\n\n⇜ المرسل ↤ "..news.."\n⇜ الحساب رقم ↤ `"..cccc.."`\n⇜ نوع البطاقة ↤ "..uuuu.."\n⇜ المستلم ↤ "..newss.."\n⇜ الحساب رقم ↤ `"..text.."`\n⇜ نوع البطاقة ↤ "..fsvhh.."\n⇜ خصمت 10% رسوم تحويل\n⇜ المبلغ ↤ "..convert_mony.." ريال 💵","md",true)
send(fsvhhh,0, "⌯ حوالة واردة من بنك لويس\n\n⇜ المرسل ↤ "..news.."\n⇜ الحساب رقم ↤ `"..cccc.."`\n⇜ نوع البطاقة ↤ "..uuuu.."\n⇜ المبلغ ↤ "..convert_mony.." ريال 💵","md",true)
Redis:del(Thealhlfy.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(Thealhlfy.."transn" .. msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ مافيه حساب بنكي كذا","md",true)
Redis:del(Thealhlfy.."trans" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
Redis:del(Thealhlfy.."transn" .. msg.sender_id.user_id)
end
end
if text == "ترتيبي" then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
local bank_users = Redis:smembers(Thealhlfy.."booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(msg.sender_id.user_id) then
local mony = v[1]
return send(msg.chat_id,msg.id,"⇜ ترتيبك ( "..k.." )","md",true)
end
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "ترتيبه" and tonumber(msg.reply_to_message_id) ~= 0 then

local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك ","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local bank_users = Redis:smembers(Thealhlfy.."booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(Remsg.sender_id.user_id) then
local mony = v[1]
return send(msg.chat_id,msg.id,"⇜ ترتيبه ( "..k.." )","md",true)
end
end
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي","md",true)
end
end
if text == "توب" or text == "التوب" then
if Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 1036800 then
day = "13 يوم"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 950400 then
day = "12 يوم"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 864000 then
day = "11 يوم"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 777600 then
day = "10 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 691200 then
day = "9 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 604800 then
day = "8 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 518400 then
day = "7 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 432000 then
day = "6 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 345600 then
day = "5 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 259200 then
day = "4 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 172800 then
day = "3 ايام"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) >= 86400 then
day = "يومان"
elseif Redis:ttl(Thealhlfy.."deletbank" .. 111) <= 86400 then
day = "يوم واحد"
else
day = " لم يحدد الوقت "
end
local toptop = "⇜ أهلين يا روح لويس هذي أوامري :\n⇜ اختر نوع التوب من الازرار\n\n⇜ تتصفر اللعبة بعد ↤ "..day.."\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'توب الفلوس', data = msg.sender_id.user_id..'/topmon'}, {text = 'توب الحراميه', data = msg.sender_id.user_id..'/topzrf'},
},
{
{text = 'توب المتزوجين', data = msg.sender_id.user_id..'/zoztee'}, {text = 'توب المتبرعين', data = msg.sender_id.user_id..'/motbra'},
},
{
{text = 'توب النوادي', data = msg.sender_id.user_id..'/topnade'},{text = 'توب المزارع', data = msg.sender_id.user_id..'/mazratee'},
},
{
{text = 'اخفاء', data = msg.sender_id.user_id..'/delAmr'}, 
},
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,toptop,"md",false, false, false, false, reply_markup)
end
if text == "توب الفلوس" or text == "توب فلوس" then

local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
news = news:gsub("🇾🇪️",'')
news = news:gsub("🇹🇳",'')
news = news:gsub("🇸🇾",'')
news = news:gsub("🇸🇩",'')
news = news:gsub("🇸🇦",'')
news = news:gsub("🇶🇦",'')
news = news:gsub("🇵🇸",'')
news = news:gsub("🇴🇲",'')
news = news:gsub("🇲🇦",'')
news = news:gsub("🇱🇾",'')
news = news:gsub("🇱🇧",'')
news = news:gsub("🇰🇼️",'')
news = news:gsub("🇯🇴",'')
news = news:gsub("🇮🇶",'')
news = news:gsub("🇪🇬",'')
news = news:gsub("🇧🇭",'')
news = news:gsub("🇩🇿️",'')
news = news:gsub("🇦🇪",'')
else
news = " لا يوجد اسم"
end
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local bank_users = Redis:smembers(Thealhlfy.."booob")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "⇜ توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Thealhlfy.."doltebank"..v[2]) or " " or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.."\n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\nyou ) "..gflous.." 💵 l "..news.." \n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_mony..gg,"md",false, false, false, false, reply_markup)
end
if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب الزرف" or text == "توب زرف" then

local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
news = news:gsub("🇾🇪️",'')
news = news:gsub("🇹🇳",'')
news = news:gsub("🇸🇾",'')
news = news:gsub("🇸🇩",'')
news = news:gsub("🇸🇦",'')
news = news:gsub("🇶🇦",'')
news = news:gsub("🇵🇸",'')
news = news:gsub("🇴🇲",'')
news = news:gsub("🇲🇦",'')
news = news:gsub("🇱🇾",'')
news = news:gsub("🇱🇧",'')
news = news:gsub("🇰🇼️",'')
news = news:gsub("🇯🇴",'')
news = news:gsub("🇮🇶",'')
news = news:gsub("🇪🇬",'')
news = news:gsub("🇧🇭",'')
news = news:gsub("🇩🇿️",'')
news = news:gsub("🇦🇪",'')
else
news = " لا يوجد اسم"
end
zrfee = Redis:get(Thealhlfy.."rrfff"..msg.sender_id.user_id) or 0
local ty_users = Redis:smembers(Thealhlfy.."rrfffid")
if #ty_users == 0 then
return send(chat_id,msg_id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "⇜ توب 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(Thealhlfy.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Thealhlfy.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
ty_anubis = ty_anubis..emoo.." "..gflos.." 💵 l "..tt.." "..doltebank.." \n"
gflous = string.format("%.0f", zrfee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,ty_anubis..gg,"md",false, false, false, false, reply_markup)
end
if text == 'رشوة' or text == 'رشوه' or text == 'رشوى' or text == 'رشوا' then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iioo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iioo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ من شوي اخذت رشوة استنى "..time.." ","md",true)
end
if Redis:ttl(Thealhlfy.."polrsho" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."polrsho" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤\n⇜ استنى "..time.." \n✧","md",true)
end
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
if shkse == "طيبة" then
return send(msg.chat_id,msg.id, "⇜ شخصيتك طيبة مايمديك تاخذ رشوة","md",true)
end
local daddd = {"1", "2", "3", "4",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" or haddd == "2" or haddd == "3" then
local jjjo = math.random(200,4000);
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
bakigcj = ballanceed + jjjo
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , bakigcj)
send(msg.chat_id,msg.id,"⇜ هذه رشوة بطل زرف "..jjjo.." درهم 💵","md",true)
Redis:setex(Thealhlfy.."iioo" .. msg.sender_id.user_id,600, true)
else
Redis:setex(Thealhlfy.."polrsho" .. msg.sender_id.user_id,300, true)
send(msg.chat_id,msg.id, "⇜ مسكتك الشرطة وانتا ترتشي 🚔\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'بخشيش' or text == 'بقشيش' then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iioo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iioo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ من شوي اخذت بخشيش استنى "..time.." ","md",true)
end
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
if shkse == "شريرة" then
return send(msg.chat_id,msg.id, "⇜ شخصيتك شريرة مايمديك تاخذ بخشيش","md",true)
end
local jjjo = math.random(200,4000);
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
bakigcj = ballanceed + jjjo
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , bakigcj)
send(msg.chat_id,msg.id,"⇜ تكرم وهي بخشيش "..jjjo.." درهم 💵","md",true)
Redis:setex(Thealhlfy.."iioo" .. msg.sender_id.user_id,600, true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زرف' or text == 'زرفو' or text == 'زرفه' and tonumber(msg.reply_to_message_id) ~= 0 then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
if shkse == "طيبة" then
return send(msg.chat_id,msg.id, "⇜ شخصيتك طيبة مايمديك تزرف العالم","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك 🤣","md",true)
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ بدك تزرف نفسك 🤡","md",true)  
return false
end
if Redis:ttl(Thealhlfy.."polic" .. msg.sender_id.user_id) >=60 then
local hours = Redis:ttl(Thealhlfy.."polic" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id,"⇜ انتا بالسجن 🏤 استنى "..math.floor(hours).." دقائق\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."hrame" .. Remsg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."hrame" .. Remsg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ ذا المسكين مزروف قبل شوي\n⇜ يمديك تزرفه بعد "..time.." ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballanceed) < 199 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تزرفه فلوسه اقل من 200 درهم 💵","md",true)
end
shkseto = Redis:get(Thealhlfy.."shkse"..Remsg.sender_id.user_id)
if shkseto == "طيبة" then
local hrame = math.floor(math.random() * 200) + 1;
local ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(zrfnee))
Redis:set(Thealhlfy.."boob"..Remsg.sender_id.user_id , math.floor(zrfne))
Redis:setex(Thealhlfy.."hrame" .. Remsg.sender_id.user_id,600, true)
local zoropeo = Redis:get(Thealhlfy.."rrfff"..msg.sender_id.user_id) or 0
zoroprod = zoropeo + hrame
Redis:set(Thealhlfy.."rrfff"..msg.sender_id.user_id,zoroprod)
Redis:sadd(Thealhlfy.."rrfffid",msg.sender_id.user_id)
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
Redis:set(Thealhlfy.."msrokid"..msg.chat_id..Remsg.sender_id.user_id,Remsg.sender_id.user_id)
Redis:set(Thealhlfy.."hrameid"..msg.chat_id..Remsg.sender_id.user_id,msg.sender_id.user_id)
Redis:set(Thealhlfy.."balcmsrok"..msg.chat_id..Remsg.sender_id.user_id,hrame)
Redis:setex(Thealhlfy.."timehrame"..msg.chat_id..msg.sender_id.user_id,30, true)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
send(msg.chat_id,0, "⇜ "..news.." في حرامي زرفك "..hrame.." درهم 💵\n⇜ رد عليه بكلمة ( شرطه )\n⇜ معك 30 ثانية\n✧","md",true)
else
local hrame = math.floor(math.random() * 200) + 1;
local ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(zrfnee))
Redis:set(Thealhlfy.."boob"..Remsg.sender_id.user_id , math.floor(zrfne))
Redis:setex(Thealhlfy.."hrame" .. Remsg.sender_id.user_id,600, true)
local zoropeo = Redis:get(Thealhlfy.."rrfff"..msg.sender_id.user_id) or 0
zoroprod = zoropeo + hrame
Redis:set(Thealhlfy.."rrfff"..msg.sender_id.user_id,zoroprod)
Redis:sadd(Thealhlfy.."rrfffid",msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ خذ يالحرامي زرفته "..hrame.." درهم 💵\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'شرطه' or text == 'الشرطه' or text == 'شرطة' and tonumber(msg.reply_to_message_id) ~= 0 then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك 🤣","md",true)
return false
end
local hrameid = Redis:get(Thealhlfy.."hrameid"..msg.chat_id..msg.sender_id.user_id)
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
if shkse == "شريرة" then
return send(msg.chat_id,msg.id, "⇜ شخصيتك شريرة مايمديك تطلب الشرطة","md",true)
end
if Redis:get(Thealhlfy.."timehrame"..msg.chat_id.. hrameid) then
local hours = Redis:ttl(Thealhlfy.."timehrame" .. hrameid)
local msrokid = Redis:get(Thealhlfy.."msrokid"..msg.chat_id..msg.sender_id.user_id)
local hrameid = Redis:get(Thealhlfy.."hrameid"..msg.chat_id..msg.sender_id.user_id)
local balcmsrok = Redis:get(Thealhlfy.."balcmsrok"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(hrameid) == Remsg.sender_id.user_id and tonumber(msrokid) == msg.sender_id.user_id then
local ballancehrame = Redis:get(Thealhlfy.."boob"..hrameid) or 0
local ballancmsrok = Redis:get(Thealhlfy.."boob"..msrokid) or 0
ballancehramenow = tonumber(ballancehrame) - tonumber(balcmsrok)
ballancmsroknow = tonumber(ballancmsrok) + tonumber(balcmsrok)
Redis:set(Thealhlfy.."boob"..hrameid , ballancehramenow)
Redis:set(Thealhlfy.."boob"..msrokid , ballancmsroknow)
local ban = bot.getUser(hrameid)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
Redis:setex(Thealhlfy.."polic" .. hrameid,600, true)
Redis:del(Thealhlfy.."msrokid" ..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Thealhlfy.."hrameid" ..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Thealhlfy.."balcmsrok" ..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Thealhlfy.."timehrame" ..msg.chat_id..msg.sender_id.user_id)
send(msg.chat_id,msg.id,"⇜ كفو مسكته الشرطة 👨‍✈️\n⇜ الحرامي : "..news.."\n⇜ تم اعادة فلوسك : "..tonumber(balcmsrok).." درهم 💵\n⇜ سيتم سجن الحرامي\n✧","md",true)
else
send(msg.chat_id,msg.id,"⇜ تم التحقيق معه وتبين مو هو الحرامي\n⇜ باقي معك "..math.floor(hours).." ثانية\n✧","md",true)
end
else
send(msg.chat_id,msg.id,"⇜ انتهى الوقت والحرامي هرب\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match("^شرطه @(%S+)$") or text and text:match("^شرطة @(%S+)$") then

local UserName = text:match("^شرطه @(%S+)$") or text:match("^شرطة @(%S+)$")
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg.chat_id,msg.id,"\n⇜ مافيه حساب كذا ","md",true)
end
local UserInfo = bot.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n⇜ هذا بوت 🤡 ","md",true)  
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local hrameid = Redis:get(Thealhlfy.."hrameid"..msg.chat_id..msg.sender_id.user_id)
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
if shkse == "شريرة" then
return send(msg.chat_id,msg.id, "⇜ شخصيتك شريرة مايمديك تطلب الشرطة","md",true)
end
if Redis:get(Thealhlfy.."timehrame"..msg.chat_id.. hrameid) then
local hours = Redis:ttl(Thealhlfy.."timehrame" .. hrameid)
local msrokid = Redis:get(Thealhlfy.."msrokid"..msg.chat_id..msg.sender_id.user_id)
local hrameid = Redis:get(Thealhlfy.."hrameid"..msg.chat_id..msg.sender_id.user_id)
local balcmsrok = Redis:get(Thealhlfy.."balcmsrok"..msg.chat_id..msg.sender_id.user_id) or 0
if tonumber(hrameid) == UserId_Info.id and tonumber(msrokid) == msg.sender_id.user_id then
local ballancehrame = Redis:get(Thealhlfy.."boob"..hrameid) or 0
local ballancmsrok = Redis:get(Thealhlfy.."boob"..msrokid) or 0
ballancehramenow = tonumber(ballancehrame) - tonumber(balcmsrok)
ballancmsroknow = tonumber(ballancmsrok) + tonumber(balcmsrok)
Redis:set(Thealhlfy.."boob"..hrameid , ballancehramenow)
Redis:set(Thealhlfy.."boob"..msrokid , ballancmsroknow)
local ban = bot.getUser(hrameid)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
Redis:setex(Thealhlfy.."polic" .. hrameid,600, true)
Redis:del(Thealhlfy.."msrokid" ..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Thealhlfy.."hrameid" ..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Thealhlfy.."balcmsrok" ..msg.chat_id..msg.sender_id.user_id)
Redis:del(Thealhlfy.."timehrame" ..msg.chat_id..msg.sender_id.user_id)
send(msg.chat_id,msg.id,"⇜ كفو مسكته الشرطة 👨‍✈️\n⇜ الحرامي : "..news.."\n⇜ تم اعادة فلوسك : "..tonumber(balcmsrok).." درهم 💵\n⇜ سيتم سجن الحرامي\n✧","md",true)
else
send(msg.chat_id,msg.id,"⇜ تم التحقيق معه وتبين مو هو الحرامي\n⇜ باقي معك "..math.floor(hours).." ثانية\n✧","md",true)
end
else
send(msg.chat_id,msg.id,"⇜ انتهى الوقت والحرامي هرب\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'راتب' or text == 'راتبي' then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iiioo" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iiioo" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ راتبك بينزل بعد "..time.." ","md",true)
end
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد اسم"
end
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id) or 1
ratbtrans = Redis:get(Thealhlfy.."ratbtrans"..msg.sender_id.user_id) or 1
if shkse == "طيبة" then
if tonumber(ratbinc) >= 270 and tonumber(ratbtrans) == 10 then
local ratpep = ballancee + 500000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 300 or tonumber(ratbinc) == 301 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500000 درهم 💵\n⇜ وظيفتك : ملك 👑\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : `"..convert_mony.."` درهم 💵\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,300)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500000 درهم 💵\n⇜ وظيفتك : ملك 👑\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : `"..convert_mony.."` درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 240 and tonumber(ratbtrans) == 9 then
local ratpep = ballancee + 200000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id) or 0
if tonumber(ratbinc) == 270 or tonumber(ratbinc) == 271 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 200000 درهم 💵\n⇜ وظيفتك : امير 🤵‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,270)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 200000 درهم 💵\n⇜ وظيفتك : امير 🤵‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 210 and tonumber(ratbtrans) == 8 then
local ratpep = ballancee + 100000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 240 or tonumber(ratbinc) == 241 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 100000 درهم 💵\n⇜ وظيفتك : وزير 🤵‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,240)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 100000 درهم 💵\n⇜ وظيفتك : وزير 🤵‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 180 and tonumber(ratbtrans) == 7 then
local ratpep = ballancee + 70000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 210 or tonumber(ratbinc) == 211 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 70000 درهم 💵\n⇜ وظيفتك : بزنس مان كبير 💸\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,210)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 70000 درهم 💵\n⇜ وظيفتك : بزنس مان كبير 💸\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 150 and tonumber(ratbtrans) == 6 then
local ratpep = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 180 or tonumber(ratbinc) == 181 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 40000 درهم 💵\n⇜ وظيفتك : تاجر صغير 💰\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,180)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 40000 درهم 💵\n⇜ وظيفتك : تاجر صغير 💰\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 120 and tonumber(ratbtrans) == 5 then
local ratpep = ballancee + 25000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 150 or tonumber(ratbinc) == 151 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 25000 درهم 💵\n⇜ وظيفتك : طيار 👨‍✈️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,150)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 25000 درهم 💵\n⇜ وظيفتك : طيار 👨‍✈️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 90 and tonumber(ratbtrans) == 4 then
local ratpep = ballancee + 18000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 120 or tonumber(ratbinc) == 121 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 18000 درهم 💵\n⇜ وظيفتك : دكتور 👨‍⚕️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,120)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 18000 درهم 💵\n⇜ وظيفتك : دكتور 👨‍⚕️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 60 and tonumber(ratbtrans) == 3 then
local ratpep = ballancee + 9000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 90 or tonumber(ratbinc) == 91 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 9000 درهم 💵\n⇜ وظيفتك : صيدلي 👨‍🔬\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,90)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 9000 درهم 💵\n⇜ وظيفتك : صيدلي 👨‍🔬\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 30 and tonumber(ratbtrans) == 2 then
local ratpep = ballancee + 2500
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 60 or tonumber(ratbinc) == 61 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 2500 درهم 💵\n⇜ وظيفتك : نجار 👨‍🔧\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,60)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 2500 درهم 💵\n⇜ وظيفتك : نجار 👨‍🔧\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 1 and tonumber(ratbtrans) == 1 then
local ratpep = ballancee + 500
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 30 or tonumber(ratbinc) == 31 then
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,30)
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500 درهم 💵\n⇜ وظيفتك : قروي 👨‍🌾\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500 درهم 💵\n⇜ وظيفتك : قروي 👨‍🌾\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
end
else
if tonumber(ratbinc) >= 270 and tonumber(ratbtrans) == 10 then
local ratpep = ballancee + 500000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 300 or tonumber(ratbinc) == 301 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500000 درهم 💵\n⇜ وظيفتك : ال تشابو 🧛‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,300)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500000 درهم 💵\n⇜ وظيفتك : ال تشابو 🧛‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 240 and tonumber(ratbtrans) == 9 then
local ratpep = ballancee + 200000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 270 or tonumber(ratbinc) == 271 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 200000 درهم 💵\n⇜ وظيفتك : بائع ممنوعات دولي 🎩\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,270)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 200000 درهم 💵\n⇜ وظيفتك : بائع ممنوعات دولي 🎩\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 210 and tonumber(ratbtrans) == 8 then
local ratpep = ballancee + 100000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 240 or tonumber(ratbinc) == 241 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 100000 درهم 💵\n⇜ وظيفتك : تاجر ممنوعات 🧔‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,240)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 100000 درهم 💵\n⇜ وظيفتك : تاجر ممنوعات 🧔‍♂️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 180 and tonumber(ratbtrans) == 7 then
local ratpep = ballancee + 70000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 210 or tonumber(ratbinc) == 211 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 70000 درهم 💵\n⇜ وظيفتك : بق بوس العصابة 🗣\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,210)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 70000 درهم 💵\n⇜ وظيفتك : بق بوس العصابة 🗣\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 150 and tonumber(ratbtrans) == 6 then
local ratpep = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 180 or tonumber(ratbinc) == 181 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 40000 درهم 💵\n⇜ وظيفتك : مساعد رئيس العصابة 🦹‍♀️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,180)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 40000 درهم 💵\n⇜ وظيفتك : مساعد رئيس العصابة 🦹‍♀️\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 120 and tonumber(ratbtrans) == 5 then
local ratpep = ballancee + 25000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 150 or tonumber(ratbinc) == 151 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 25000 درهم 💵\n⇜ وظيفتك : عضو عصابة 🙍\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,150)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 25000 درهم 💵\n⇜ وظيفتك : عضو عصابة 🙍\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 90 and tonumber(ratbtrans) == 4 then
local ratpep = ballancee + 18000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 120 or tonumber(ratbinc) == 121 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 18000 درهم 💵\n⇜ وظيفتك : قاتل مأجور 🔫\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,120)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 18000 درهم 💵\n⇜ وظيفتك : قاتل مأجور 🔫\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 60 and tonumber(ratbtrans) == 3 then
local ratpep = ballancee + 9000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 90 or tonumber(ratbinc) == 91 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 9000 درهم 💵\n⇜ وظيفتك : قاتل 🕴\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,90)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 9000 درهم 💵\n⇜ وظيفتك : قاتل 🕴\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 30 and tonumber(ratbtrans) == 2 then
local ratpep = ballancee + 2500
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 60 or tonumber(ratbinc) == 61 then
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 2500 درهم 💵\n⇜ وظيفتك : سارق 🥷\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,60)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 2500 درهم 💵\n⇜ وظيفتك : سارق 🥷\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
elseif tonumber(ratbinc) >= 0 and tonumber(ratbtrans) == 1 then
local ratpep = ballancee + 500
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ratpep))
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Thealhlfy.."iiioo" .. msg.sender_id.user_id,600, true)
Redis:incrby(Thealhlfy.."ratbinc"..msg.sender_id.user_id,1)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id)
if tonumber(ratbinc) == 30 or tonumber(ratbinc) == 31 then
Redis:set(Thealhlfy.."ratbinc"..msg.sender_id.user_id,30)
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500 درهم 💵\n⇜ وظيفتك : مشرد 👣\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✧","md",true)
else
send(msg.chat_id,msg.id,"⌯ اشعار ايداع "..neews.."\n\n⇜ المبلغ : 500 درهم 💵\n⇜ وظيفتك : مشرد 👣\n⇜ نوع العملية : اضافة راتب\n⇜ تطوير الراتب : "..tonumber(ratbinc).."\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
end
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تطوير راتب' or text == 'تطوير الراتب' or text == 'تطوير راتبي' then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
ratbinc = Redis:get(Thealhlfy.."ratbinc"..msg.sender_id.user_id) or 0
ratbtrans = Redis:get(Thealhlfy.."ratbtrans"..msg.sender_id.user_id) or 1
if shkse == "طيبة" then
if tonumber(ratbinc) == 270 then
if tonumber(ballanceed) < 1000000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 1000000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,10)
nowbalc = tonumber(ballancee) - 1000000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 1000000000 درهم 💵\n⇜ اصبحت وظيفتك : ملك 👑\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 240 then
if tonumber(ballanceed) < 200000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 200000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,9)
nowbalc = tonumber(ballancee) - 200000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 200000000 درهم 💵\n⇜ اصبحت وظيفتك : امير 🤵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 210 then
if tonumber(ballanceed) < 30000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 30000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,8)
nowbalc = tonumber(ballancee) - 30000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 30000000 درهم 💵\n⇜ اصبحت وظيفتك : وزير 🤵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 180 then
if tonumber(ballanceed) < 1000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 1000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,7)
nowbalc = tonumber(ballancee) - 1000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 1000000 درهم 💵\n⇜ اصبحت وظيفتك : بزنس مان كبير 💸\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 150 then
if tonumber(ballanceed) < 300000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 300000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,6)
nowbalc = tonumber(ballancee) - 300000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 300000 درهم 💵\n⇜ اصبحت وظيفتك : تاجر صغير 💰\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 120 then
if tonumber(ballanceed) < 120000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 120000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,5)
nowbalc = tonumber(ballancee) - 120000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 120000 درهم 💵\n⇜ اصبحت وظيفتك : طيار 👨\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 90 then
if tonumber(ballanceed) < 80000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 80000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,4)
nowbalc = tonumber(ballancee) - 80000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 80000 درهم 💵\n⇜ اصبحت وظيفتك : دكتور 👨\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 60 then
if tonumber(ballanceed) < 30000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 30000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,3)
nowbalc = tonumber(ballancee) - 30000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 30000 درهم 💵\n⇜ اصبحت وظيفتك : صيدلي ‍👨\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 30 then
if tonumber(ballanceed) < 3000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 3000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,2)
nowbalc = tonumber(ballancee) - 3000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 3000 درهم 💵\n⇜ اصبحت وظيفتك : نجار 👨\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
else
return send(msg.chat_id,msg.id,"⇜ لا تستطيع تطوير راتبك حالياً\n✧","md",true)
end
else
if tonumber(ratbinc) == 270 then
if tonumber(ballanceed) < 1000000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 1000000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,10)
nowbalc = tonumber(ballancee) - 1000000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 1000000000 درهم 💵\n⇜ اصبحت وظيفتك : ال تشابو 🧛\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 240 then
if tonumber(ballanceed) < 200000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 200000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,9)
nowbalc = tonumber(ballancee) - 200000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 200000000 درهم 💵\n⇜ اصبحت وظيفتك : بائع ممنوعات دولي 🎩\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 210 then
if tonumber(ballanceed) < 30000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 30000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,8)
nowbalc = tonumber(ballancee) - 30000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 30000000 درهم 💵\n⇜ اصبحت وظيفتك : تاجر ممنوعات 🧔‍♂️\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 180 then
if tonumber(ballanceed) < 1000000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 1000000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,7)
nowbalc = tonumber(ballancee) - 1000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 1000000 درهم 💵\n⇜ اصبحت وظيفتك : بق بوس العصابة 🗣\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 150 then
if tonumber(ballanceed) < 300000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 300000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,6)
nowbalc = tonumber(ballancee) - 300000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 300000 درهم 💵\n⇜ اصبحت وظيفتك : مساعد رئيس العصابة 🦹\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 120 then
if tonumber(ballanceed) < 120000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 120000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,5)
nowbalc = tonumber(ballancee) - 120000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 120000 درهم 💵\n⇜ اصبحت وظيفتك : عضو عصابة 🙍\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 90 then
if tonumber(ballanceed) < 80000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 80000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,4)
nowbalc = tonumber(ballancee) - 80000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 80000 درهم 💵\n⇜ اصبحت وظيفتك : قاتل مأجور 🔫\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 60 then
if tonumber(ballanceed) < 30000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 30000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,3)
nowbalc = tonumber(ballancee) - 30000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 30000 درهم 💵\n⇜ اصبحت وظيفتك : قاتل 🕴\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
elseif tonumber(ratbinc) == 30 then
if tonumber(ballanceed) < 3000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تطور راتبك تحتاج مبلغ 3000 درهم 💵","md",true)
end
Redis:del(Thealhlfy.."ratbtrans"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."ratbtrans"..msg.sender_id.user_id,2)
nowbalc = tonumber(ballancee) - 3000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"⌯ اشعار تطوير راتب\n\n⇜ المبلغ : 3000 درهم 💵\n⇜ اصبحت وظيفتك : سارق 🥷\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
else
return send(msg.chat_id,msg.id,"⇜ لا تستطيع تطوير راتبك حالياً\n✧","md",true)
end
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'هجوم' then

send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match("^هجوم (%d+)$") and msg.reply_to_message_id == 0 then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `هجوم` المبلغ ( بالرد )","md",true)
end
if text and text:match('^هجوم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^هجوم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك 🤣","md",true)  
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهاجم نفسك 🤡","md",true)  
return false
end
if Redis:ttl(Thealhlfy.."attack" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."attack" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ خسرت بأخر معركة استنى "..time.." ","md",true)
end
if Redis:ttl(Thealhlfy.."defen" .. Remsg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."defen" .. Remsg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ الخصم خسر بأخر معركة\n⇜ يمديك تهاجمه بعد "..time.." ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
ballancope = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
if tonumber(ballancope) < 100000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تهجم فلوسك اقل من 100000 درهم 💵","md",true)
end
if tonumber(ballanceed) < 100000 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تهجم عليه فلوسه اقل من 100000 درهم 💵","md",true)
end
if tonumber(coniss) < 9999 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 10000 درهم 💵\n✧","md",true)
end
if tonumber(ballancope) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسه ماتكفي","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد اسم "
end
local bann = bot.getUser(Remsg.sender_id.user_id)
if bann.first_name then
neewss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
neewss = " لا يوجد اسم"
end
if Descriptioont == "1" or Descriptioont == "3" then
local ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
zrfne = ballancope - coniss
drebattack = tonumber(coniss) / 100 * 25
drebattackk = tonumber(coniss) - math.floor(drebattack)
zrfnee = ballanceed + math.floor(drebattackk)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(Thealhlfy.."boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(Thealhlfy.."attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",drebattackk)
local convert_monyy = string.format("%.0f",drebattack)
send(msg.chat_id,msg.id, "⇜ لقد خسرت في المعركة "..neews.." 🛡\n⇜ الفائز : "..neewss.."\n⇜ الخاسر : "..neews.."\n⇜ الجائزة : "..convert_mony.." درهم 💵\n⇜ الضريبة : "..convert_monyy.." درهم 💵\n✧","md",true)
elseif Descriptioont == "2" or Descriptioont == "4" or Descriptioont == "5" or  Descriptioont == "6" or Descriptioont == "8" then
local ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
begaatt = Redis:get(Thealhlfy.."numattack"..msg.sender_id.user_id) or 200
numattackk = tonumber(begaatt) - 1
if numattackk == 0 then
numattackk = 1
end
attack = coniss / numattackk
zrfne = ballancope + math.floor(attack)
zrfnee = ballanceed - math.floor(attack)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(Thealhlfy.."boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(Thealhlfy.."defen" .. Remsg.sender_id.user_id,1800, true)
Redis:set(Thealhlfy.."numattack"..msg.sender_id.user_id , math.floor(numattackk))
local convert_mony = string.format("%.0f",math.floor(attack))
send(msg.chat_id,msg.id, "⇜ لقد فزت في المعركة\n⇜ ودمرت قلعة "..neewss.." 🏰\n⇜ الفائز : "..neews.."\n⇜ الخاسر : "..neewss.."\n⇜ الجائزة : "..convert_mony.." درهم 💵\n⇜ نسبة قوة المهاجم اصبحت "..numattackk.." 🩸\n✧","md",true)
elseif Descriptioont == "7" then
local ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local ballancope = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
halfzrf = coniss / 2
zrfne = ballancope - halfzrf
zrfnee = ballanceed + halfzrf
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(zrfne))
Redis:set(Thealhlfy.."boob"..Remsg.sender_id.user_id , math.floor(zrfnee))
Redis:setex(Thealhlfy.."attack" .. msg.sender_id.user_id,600, true)
local convert_mony = string.format("%.0f",math.floor(halfzrf))
send(msg.chat_id,msg.id, "⇜ لقد خسرت في المعركة "..neews.." 🛡\n⇜ ولكن استطعت اعادة نصف الموارد\n⇜ الفائز : "..neewss.."\n⇜ الخاسر : "..neews.."\n⇜ الجائزة : "..convert_mony.." درهم 💵\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "المعرض" or text == "معرض" then

Redis:setex(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
send(msg.chat_id,msg.id,[[
– اهلين فيك بمعرض لويس
- يتوفر لدينا حالياً :

⇠ `سيارات`  🚗
⇠ `طيارات`  ✈️
⇠ `عقارات`  🏘
⇠ `مجوهرات`  💎

- اضغط للنسخ

✧
]],"md",true)  
return false
end
if text == "سيارات" and Redis:get(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
Redis:del(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
send(msg.chat_id,msg.id,[[
– السيارات المتوفرة لدينا حالياً :

⇠ `فيلار` - السعر : 10000000 💵
⇠ `اكسنت` - السعر : 9000000 💵
⇠ `كامري` - السعر : 8000000 💵
⇠ `النترا` - السعر : 7000000 💵
⇠ `هايلكس` - السعر : 6000000 💵
⇠ `سوناتا` - السعر : 5000000 💵
⇠ `كورولا` - السعر : 4000000 💵

- ارسل اسم السيارة والعدد
مثال : شراء سياره فيلار 2

✧
]],"md",true)  
return false
end
if text == "طيارات" and Redis:get(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
Redis:del(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
send(msg.chat_id,msg.id,[[
– الطيارات المتوفرة لدينا حالياً :

⇠ `شبح` - السعر : 1000000000 💵
⇠ `سفر` - السعر : 500000000 💵
⇠ `خاصه` - السعر : 200000000 💵

- ارسل اسم الطائرة والعدد
مثال : شراء طياره سفر 2

✧
]],"md",true)  
return false
end
if text == "عقارات" and Redis:get(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
Redis:del(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
send(msg.chat_id,msg.id,[[
– العقارات المتوفرة لدينا حالياً :

⇠ `قصر` - السعر : 1000000 💵
⇠ `فيلا` - السعر : 500000 💵
⇠ `منزل` - السعر : 100000 💵

- ارسل اسم العقار والعدد
مثال : شراء قصر 2

✧
]],"md",true)  
return false
end
if text == "مجوهرات" and Redis:get(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
Redis:del(Thealhlfy.."marad" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
send(msg.chat_id,msg.id,[[
– المجوهرات المتوفرة لدينا حالياً :

⇠ `ماسه` - السعر : 1000000 💵
⇠ `قلاده` - السعر : 500000 💵
⇠ `سوار` - السعر : 200000 💵
⇠ `خاتم` - السعر : 50000 💵

- ارسل الاسم والعدد
مثال : شراء سوار 2

✧
]],"md",true)  
return false
end
if text and text:match('^شراء ماسه (.*)$') or text and text:match('^شراء ماسة (.*)$') then

local UserName = text:match('^شراء ماسه (.*)$') or text:match('^شراء ماسة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار ماسه بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
masmgr = tonumber(coniss) * 1000000
if tonumber(ballance) < tonumber(masmgr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local mgrmasname = Redis:get(Thealhlfy.."mgrmasname"..msg.sender_id.user_id)
local mgrmasprice = Redis:get(Thealhlfy.."mgrmasprice"..msg.sender_id.user_id) or 0
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
local mgrmasnow = tonumber(mgrmasnum) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id , mgrmasnow)
masnamed = "ماسه"
Redis:set(Thealhlfy.."mgrmasname"..msg.sender_id.user_id , masnamed)
Redis:set(Thealhlfy.."mgrmasprice"..msg.sender_id.user_id , 1000000)
totalypalice = tonumber(ballance) - tonumber(masmgr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(masmgr))
send(msg.chat_id,msg.id, "⌯ وصل شراء مجوهرات\n⇜ النوع : ماسه \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد ماساتك : `"..mgrmasnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء قلاده (.*)$') or text and text:match('^شراء قلادة (.*)$') then

local UserName = text:match('^شراء قلاده (.*)$') or text:match('^شراء قلادة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار قلاده بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
kldmgr = tonumber(coniss) * 500000
if tonumber(ballance) < tonumber(kldmgr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local mgrkldname = Redis:get(Thealhlfy.."mgrkldname"..msg.sender_id.user_id)
local mgrkldprice = Redis:get(Thealhlfy.."mgrkldprice"..msg.sender_id.user_id) or 0
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
local mgrkldnow = tonumber(mgrkldnum) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id , mgrkldnow)
kldnamed = "قلاده"
Redis:set(Thealhlfy.."mgrkldname"..msg.sender_id.user_id , kldnamed)
Redis:set(Thealhlfy.."mgrkldprice"..msg.sender_id.user_id , 500000)
totalypalice = tonumber(ballance) - tonumber(kldmgr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(kldmgr))
send(msg.chat_id,msg.id, "⌯ وصل شراء مجوهرات\n⇜ النوع : قلاده \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد قلاداتك : `"..mgrkldnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سوار (.*)$') then

local UserName = text:match('^شراء سوار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سوار بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
swrmgr = tonumber(coniss) * 200000
if tonumber(ballance) < tonumber(swrmgr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local mgrswrname = Redis:get(Thealhlfy.."mgrswrname"..msg.sender_id.user_id)
local mgrswrprice = Redis:get(Thealhlfy.."mgrswrprice"..msg.sender_id.user_id) or 0
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
local mgrswrnow = tonumber(mgrswrnum) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id , mgrswrnow)
swrnamed = "سوار"
Redis:set(Thealhlfy.."mgrswrname"..msg.sender_id.user_id , swrnamed)
Redis:set(Thealhlfy.."mgrswrprice"..msg.sender_id.user_id , 200000)
totalypalice = tonumber(ballance) - tonumber(swrmgr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(swrmgr))
send(msg.chat_id,msg.id, "⌯ وصل شراء مجوهرات\n⇜ النوع : سوار \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد اساورك : `"..mgrswrnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء خاتم (.*)$') then
local UserName = text:match('^شراء خاتم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار خاتم بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
ktmmgr = tonumber(coniss) * 50000
if tonumber(ballance) < tonumber(ktmmgr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local mgrktmname = Redis:get(Thealhlfy.."mgrktmname"..msg.sender_id.user_id)
local mgrktmprice = Redis:get(Thealhlfy.."mgrktmprice"..msg.sender_id.user_id) or 0
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
local mgrktmnow = tonumber(mgrktmnum) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id , mgrktmnow)
ktmnamed = "خاتم"
Redis:set(Thealhlfy.."mgrktmname"..msg.sender_id.user_id , ktmnamed)
Redis:set(Thealhlfy.."mgrktmprice"..msg.sender_id.user_id , 50000)
totalypalice = tonumber(ballance) - tonumber(ktmmgr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(ktmmgr))
send(msg.chat_id,msg.id, "⌯ وصل شراء مجوهرات\n⇜ النوع : خاتم \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد خواتمك : `"..mgrktmnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع ماسه (.*)$') then

local UserName = text:match('^بيع ماسه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
if tonumber(mgrmasnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك ماسات ","md",true)
end
if tonumber(mgrmasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." ماسه","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local mgrmasname = Redis:get(Thealhlfy.."mgrmasname"..msg.sender_id.user_id)
local mgrmasprice = Redis:get(Thealhlfy.."mgrmasprice"..msg.sender_id.user_id) or 0
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
local mgrmasnow = tonumber(mgrmasnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id , mgrmasnow)
local Textinggt = {"900000", "1000000", "1100000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellmgr = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellmgr
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
if tonumber(mgrmasnum) == 0 then
Redis:del(Thealhlfy.."mgrmasname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع مجوهرات\n⇜ النوع : ماسه \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellmgr).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع قلاده (.*)$') or text and text:match('^شراء قلادة (.*)$') then

local UserName = text:match('^بيع قلاده (.*)$') or text:match('^شراء قلادة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
if tonumber(mgrkldnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك قلادات ","md",true)
end
if tonumber(mgrkldnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." قلاده ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local mgrkldname = Redis:get(Thealhlfy.."mgrkldname"..msg.sender_id.user_id)
local mgrkldprice = Redis:get(Thealhlfy.."mgrkldprice"..msg.sender_id.user_id) or 0
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
local mgrkldnow = tonumber(mgrkldnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id , mgrkldnow)
local Textinggt = {"400000", "500000", "600000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellkld = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellkld
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
if tonumber(mgrkldnum) == 0 then
Redis:del(Thealhlfy.."mgrkldname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع مجوهرات\n⇜ النوع : قلاده \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellkld).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سوار (.*)$') then

local UserName = text:match('^بيع سوار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
if tonumber(mgrswrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك اساور ","md",true)
end
if tonumber(mgrswrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سوار ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local mgrswrname = Redis:get(Thealhlfy.."mgrswrname"..msg.sender_id.user_id)
local mgrswrprice = Redis:get(Thealhlfy.."mgrswrprice"..msg.sender_id.user_id) or 0
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
local mgrswrnow = tonumber(mgrswrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id , mgrswrnow)
local Textinggt = {"150000", "200000", "300000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellswr = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellswr
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
if tonumber(mgrswrnum) == 0 then
Redis:del(Thealhlfy.."mgrswrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع مجوهرات\n⇜ النوع : سوار \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellswr).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع خاتم (.*)$') then

local UserName = text:match('^بيع خاتم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
if tonumber(mgrktmnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك خواتم ","md",true)
end
if tonumber(mgrktmnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." خاتم ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local mgrktmname = Redis:get(Thealhlfy.."mgrktmname"..msg.sender_id.user_id)
local mgrktmprice = Redis:get(Thealhlfy.."mgrktmprice"..msg.sender_id.user_id) or 0
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
local mgrktmnow = tonumber(mgrktmnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id , mgrktmnow)
local Textinggt = {"40000", "50000", "60000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellktm = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellktm
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
if tonumber(mgrktmnum) == 0 then
Redis:del(Thealhlfy.."mgrktmname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع مجوهرات\n⇜ النوع : خاتم \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellktm).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء ماسه (.*)$') or text and text:match('^اهداء ماسة (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء ماسه (.*)$') or text:match('^اهداء ماسة (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
if tonumber(mgrmasnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك ماسات ","md",true)
end
if tonumber(mgrmasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." ماسه ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
local mgrmasnow = tonumber(mgrmasnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id , mgrmasnow)
local mgrmasnumm = Redis:get(Thealhlfy.."mgrmasnum"..Remsg.sender_id.user_id) or 0
local mgrmasnoww = tonumber(mgrmasnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrmasnum"..Remsg.sender_id.user_id , mgrmasnoww)
masnamed = "ماسه"
Redis:set(Thealhlfy.."mgrmasname"..Remsg.sender_id.user_id,masnamed)
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
if tonumber(mgrmasnum) == 0 then
Redis:del(Thealhlfy.."mgrmasname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id)
end
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) ماسه\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء قلاده (.*)$') or text and text:match('^اهداء قلادة (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء قلاده (.*)$') or text:match('^اهداء قلادة (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
if tonumber(mgrkldnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك قلادات ","md",true)
end
if tonumber(mgrkldnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." قلاده ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
local mgrkldnow = tonumber(mgrkldnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id , mgrkldnow)
local mgrkldnumm = Redis:get(Thealhlfy.."mgrkldnum"..Remsg.sender_id.user_id) or 0
local mgrkldnoww = tonumber(mgrkldnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrkldnum"..Remsg.sender_id.user_id , mgrkldnoww)
kldnamed = "قلاده"
Redis:set(Thealhlfy.."mgrkldname"..Remsg.sender_id.user_id,kldnamed)
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
if tonumber(mgrkldnum) == 0 then
Redis:del(Thealhlfy.."mgrkldname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id)
end
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) قلاده\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سوار (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء سوار (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
if tonumber(mgrswrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك اساور ","md",true)
end
if tonumber(mgrswrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سوار","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
local mgrswrnow = tonumber(mgrswrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id , mgrswrnow)
local mgrswrnumm = Redis:get(Thealhlfy.."mgrswrnum"..Remsg.sender_id.user_id) or 0
local mgrswrnoww = tonumber(mgrswrnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrswrnum"..Remsg.sender_id.user_id , mgrswrnoww)
swrnamed = "سوار"
Redis:set(Thealhlfy.."mgrswrname"..Remsg.sender_id.user_id,swrnamed)
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
if tonumber(mgrswrnum) == 0 then
Redis:del(Thealhlfy.."mgrswrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id)
end
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سوار\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء خاتم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء خاتم (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
if tonumber(mgrktmnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك خواتم ","md",true)
end
if tonumber(mgrktmnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." خاتم","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
local mgrktmnow = tonumber(mgrktmnum) - tonumber(coniss)
Redis:set(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id , mgrktmnow)
local mgrktmnumm = Redis:get(Thealhlfy.."mgrktmnum"..Remsg.sender_id.user_id) or 0
local mgrktmnoww = tonumber(mgrktmnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."mgrktmnum"..Remsg.sender_id.user_id , mgrktmnoww)
ktmnamed = "خاتم"
Redis:set(Thealhlfy.."mgrktmname"..Remsg.sender_id.user_id,ktmnamed)
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
if tonumber(mgrktmnum) == 0 then
Redis:del(Thealhlfy.."mgrktmname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id)
end
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) خاتم\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء قصر (.*)$') then
local UserName = text:match('^شراء قصر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار قصر بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
ksrakr = tonumber(coniss) * 1000000
if tonumber(ballance) < tonumber(ksrakr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local akrksrname = Redis:get(Thealhlfy.."akrksrname"..msg.sender_id.user_id)
local akrksrprice = Redis:get(Thealhlfy.."akrksrprice"..msg.sender_id.user_id) or 0
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
local akrksrnow = tonumber(akrksrnum) + tonumber(coniss)
Redis:set(Thealhlfy.."akrksrnum"..msg.sender_id.user_id , akrksrnow)
ksrnamed = "قصر"
Redis:set(Thealhlfy.."akrksrname"..msg.sender_id.user_id , ksrnamed)
Redis:set(Thealhlfy.."akrksrprice"..msg.sender_id.user_id , 1000000)
totalypalice = tonumber(ballance) - tonumber(ksrakr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(ksrakr))
send(msg.chat_id,msg.id, "⌯ وصل شراء عقار\n⇜ نوع العقار : قصر \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد قصورك : `"..akrksrnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء فيلا (.*)$') then
local UserName = text:match('^شراء فيلا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار فيلا بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
felakr = tonumber(coniss) * 500000
if tonumber(ballance) < tonumber(felakr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local akrfelname = Redis:get(Thealhlfy.."akrfelname"..msg.sender_id.user_id)
local akrfelprice = Redis:get(Thealhlfy.."akrfelprice"..msg.sender_id.user_id) or 0
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
local akrfelnow = tonumber(akrfelnum) + tonumber(coniss)
Redis:set(Thealhlfy.."akrfelnum"..msg.sender_id.user_id , akrfelnow)
felnamed = "فيلا"
Redis:set(Thealhlfy.."akrfelname"..msg.sender_id.user_id , felnamed)
Redis:set(Thealhlfy.."akrfelprice"..msg.sender_id.user_id , 500000)
totalypalice = tonumber(ballance) - tonumber(felakr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(felakr))
send(msg.chat_id,msg.id, "⌯ وصل شراء عقار\n⇜ نوع العقار : قصر \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد فيلاتك : `"..akrfelnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء منزل (.*)$') then
local UserName = text:match('^شراء منزل (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار منزل بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
mnzakr = tonumber(coniss) * 200000
if tonumber(ballance) < tonumber(mnzakr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local akrmnzname = Redis:get(Thealhlfy.."akrmnzname"..msg.sender_id.user_id)
local akrmnzprice = Redis:get(Thealhlfy.."akrmnzprice"..msg.sender_id.user_id) or 0
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
local akrmnznow = tonumber(akrmnznum) + tonumber(coniss)
Redis:set(Thealhlfy.."akrmnznum"..msg.sender_id.user_id , akrmnznow)
mnznamed = "منزل"
Redis:set(Thealhlfy.."akrmnzname"..msg.sender_id.user_id , mnznamed)
Redis:set(Thealhlfy.."akrmnzprice"..msg.sender_id.user_id , 200000)
totalypalice = tonumber(ballance) - tonumber(mnzakr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(mnzakr))
send(msg.chat_id,msg.id, "⌯ وصل شراء عقار\n⇜ نوع العقار : منزل \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد منازلك : `"..akrmnznow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع قصر (.*)$') then
local UserName = text:match('^بيع قصر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
if tonumber(akrksrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك قصور ","md",true)
end
if tonumber(akrksrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." قصر","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local akrksrname = Redis:get(Thealhlfy.."akrksrname"..msg.sender_id.user_id)
local akrksrprice = Redis:get(Thealhlfy.."akrksrprice"..msg.sender_id.user_id) or 0
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
local akrksrnow = tonumber(akrksrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."akrksrnum"..msg.sender_id.user_id , akrksrnow)
local Textinggt = {"900000", "1000000", "1100000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellakr = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellakr
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
if tonumber(akrksrnum) == 0 then
Redis:del(Thealhlfy.."akrksrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrksrnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع عقار\n⇜ نوع العقار : قصر \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellakr).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع فيلا (.*)$') then
local UserName = text:match('^بيع فيلا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
if tonumber(akrfelnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك فيلات ","md",true)
end
if tonumber(akrfelnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." فيلا ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local akrfelname = Redis:get(Thealhlfy.."akrfelname"..msg.sender_id.user_id)
local akrfelprice = Redis:get(Thealhlfy.."akrfelprice"..msg.sender_id.user_id) or 0
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
local akrfelnow = tonumber(akrfelnum) - tonumber(coniss)
Redis:set(Thealhlfy.."akrfelnum"..msg.sender_id.user_id , akrfelnow)
local Textinggt = {"400000", "500000", "600000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
felakr = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + felakr
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
if tonumber(akrfelnum) == 0 then
Redis:del(Thealhlfy.."akrfelname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrfelnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع عقار\n⇜ نوع العقار : فيلا \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(felakr).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع منزل (.*)$') then
local UserName = text:match('^بيع منزل (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
if tonumber(akrmnznum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك منازل ","md",true)
end
if tonumber(akrmnznum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." منزل ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local akrmnzname = Redis:get(Thealhlfy.."akrmnzname"..msg.sender_id.user_id)
local akrmnzprice = Redis:get(Thealhlfy.."akrmnzprice"..msg.sender_id.user_id) or 0
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
local akrmnznow = tonumber(akrmnznum) - tonumber(coniss)
Redis:set(Thealhlfy.."akrmnznum"..msg.sender_id.user_id , akrmnznow)
local Textinggt = {"90000", "100000", "110000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
mnzakr = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + mnzakr
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
if tonumber(akrmnznum) == 0 then
Redis:del(Thealhlfy.."akrmnzname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrmnznum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع عقار\n⇜ نوع العقار : منزل \n⇜ العدد : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(mnzakr).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء قصر (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local UserName = text:match('^اهداء قصر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
if tonumber(akrksrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك قصور ","md",true)
end
if tonumber(akrksrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." قصر ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
local akrksrnow = tonumber(akrksrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."akrksrnum"..msg.sender_id.user_id , akrksrnow)
local akrksrnumm = Redis:get(Thealhlfy.."akrksrnum"..Remsg.sender_id.user_id) or 0
local akrksrnoww = tonumber(akrksrnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."akrksrnum"..Remsg.sender_id.user_id , akrksrnoww)
ksrnamed = "قصر"
Redis:set(Thealhlfy.."akrksrname"..Remsg.sender_id.user_id,ksrnamed)
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
if tonumber(akrksrnum) == 0 then
Redis:del(Thealhlfy.."akrksrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrksrnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) قصر\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء فيلا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء فيلا (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
if tonumber(akrfelnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك فيلات ","md",true)
end
if tonumber(akrfelnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." فيلا ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
local akrfelnow = tonumber(akrfelnum) - tonumber(coniss)
Redis:set(Thealhlfy.."akrfelnum"..msg.sender_id.user_id , akrfelnow)
local akrfelnumm = Redis:get(Thealhlfy.."akrfelnum"..Remsg.sender_id.user_id) or 0
local akrfelnoww = tonumber(akrfelnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."akrfelnum"..Remsg.sender_id.user_id , akrfelnoww)
felnamed = "فيلا"
Redis:set(Thealhlfy.."akrfelname"..Remsg.sender_id.user_id,felnamed)
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
if tonumber(akrfelnum) == 0 then
Redis:del(Thealhlfy.."akrfelname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrfelnum"..msg.sender_id.user_id)
end
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) فيلا\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء منزل (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء منزل (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
if tonumber(akrmnznum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك منازل ","md",true)
end
if tonumber(akrmnznum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." منزل","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
local akrmnznow = tonumber(akrmnznum) - tonumber(coniss)
Redis:set(Thealhlfy.."akrmnznum"..msg.sender_id.user_id , akrmnznow)
local akrmnznumm = Redis:get(Thealhlfy.."akrmnznum"..Remsg.sender_id.user_id) or 0
local akrmnznoww = tonumber(akrmnznumm) + tonumber(coniss)
Redis:set(Thealhlfy.."akrmnznum"..Remsg.sender_id.user_id , akrmnznoww)
mnznamed = "منزل"
Redis:set(Thealhlfy.."akrmnzname"..Remsg.sender_id.user_id,mnznamed)
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
if tonumber(akrmnznum) == 0 then
Redis:del(Thealhlfy.."akrmnzname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."akrmnznum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) منزل\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء طياره شبح (.*)$') or text and text:match('^شراء طيارة شبح (.*)$') then

local UserName = text:match('^شراء طياره شبح (.*)$') or text:match('^شراء طيارة شبح (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار طياره شبح بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
shbhair = tonumber(coniss) * 1000000000
if tonumber(ballance) < tonumber(shbhair) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local airshbhname = Redis:get(Thealhlfy.."airshbhname"..msg.sender_id.user_id)
local airshbhprice = Redis:get(Thealhlfy.."airshbhprice"..msg.sender_id.user_id) or 0
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
local airshbhnow = tonumber(airshbhnum) + tonumber(coniss)
Redis:set(Thealhlfy.."airshbhnum"..msg.sender_id.user_id , airshbhnow)
shbhnamed = "شبح"
Redis:set(Thealhlfy.."airshbhname"..msg.sender_id.user_id , shbhnamed)
Redis:set(Thealhlfy.."airshbhprice"..msg.sender_id.user_id , 1000000000)
totalypalice = tonumber(ballance) - tonumber(shbhair)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(shbhair))
send(msg.chat_id,msg.id, "⌯ وصل شراء طائرة\n⇜ نوع الطائرة : شبح \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد طائراتك الشبح : `"..airshbhnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء طياره سفر (.*)$') or text and text:match('^شراء طيارة سفر (.*)$') then

local UserName = text:match('^شراء طياره سفر (.*)$') or text:match('^شراء طيارة سفر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار طياره سفر بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
sfarair = tonumber(coniss) * 500000000
if tonumber(ballance) < tonumber(sfarair) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local airsfarname = Redis:get(Thealhlfy.."airsfarname"..msg.sender_id.user_id)
local airsfarprice = Redis:get(Thealhlfy.."airsfarprice"..msg.sender_id.user_id) or 0
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
local airsfarnow = tonumber(airsfarnum) + tonumber(coniss)
Redis:set(Thealhlfy.."airsfarnum"..msg.sender_id.user_id , airsfarnow)
sfarnamed = "سفر"
Redis:set(Thealhlfy.."airsfarname"..msg.sender_id.user_id , sfarnamed)
Redis:set(Thealhlfy.."airsfarprice"..msg.sender_id.user_id , 500000000)
totalypalice = tonumber(ballance) - tonumber(sfarair)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(sfarair))
send(msg.chat_id,msg.id, "⌯ وصل شراء طائرة\n⇜ نوع الطائرة : سفر \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد طائراتك السفر : `"..airsfarnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء طياره خاصه (.*)$') or text and text:match('^شراء طيارة خاصه (.*)$') then

local UserName = text:match('^شراء طياره خاصه (.*)$') or text:match('^شراء طيارة خاصه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار طياره خاصه بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
khasair = tonumber(coniss) * 200000000
if tonumber(ballance) < tonumber(khasair) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local airkhasname = Redis:get(Thealhlfy.."airkhasname"..msg.sender_id.user_id)
local airkhasprice = Redis:get(Thealhlfy.."airkhasprice"..msg.sender_id.user_id) or 0
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
local airkhasnow = tonumber(airkhasnum) + tonumber(coniss)
Redis:set(Thealhlfy.."airkhasnum"..msg.sender_id.user_id , airkhasnow)
khasnamed = "خاصه"
Redis:set(Thealhlfy.."airkhasname"..msg.sender_id.user_id , khasnamed)
Redis:set(Thealhlfy.."airkhasprice"..msg.sender_id.user_id , 200000000)
totalypalice = tonumber(ballance) - tonumber(khasair)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(khasair))
send(msg.chat_id,msg.id, "⌯ وصل شراء طائرة\n⇜ نوع الطائرة : خاصه \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد طائراتك الخاصه : `"..airkhasnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع طياره شبح (.*)$') or text and text:match('^بيع طيارة شبح (.*)$') then

local UserName = text:match('^بيع طياره شبح (.*)$') or text:match('^بيع طيارة شبح (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
if tonumber(airshbhnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك طائرات شبح ","md",true)
end
if tonumber(airshbhnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." طيارة شبح ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local airshbhname = Redis:get(Thealhlfy.."airshbhname"..msg.sender_id.user_id)
local airshbhprice = Redis:get(Thealhlfy.."airshbhprice"..msg.sender_id.user_id) or 0
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
local airshbhnow = tonumber(airshbhnum) - tonumber(coniss)
Redis:set(Thealhlfy.."airshbhnum"..msg.sender_id.user_id , airshbhnow)
local Textinggt = {"900000000", "1000000000", "1100000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellair = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellair
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
if tonumber(airshbhnum) == 0 then
Redis:del(Thealhlfy.."airshbhname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airshbhnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع طائرة\n⇜ نوع الطائرة : شبح \n⇜ عدد الطائرات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellair).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع طياره سفر (.*)$') or text and text:match('^بيع طيارة سفر (.*)$') then

local UserName = text:match('^بيع طياره سفر (.*)$') or text:match('^بيع طيارة سفر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
if tonumber(airsfarnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك طائرات سفر ","md",true)
end
if tonumber(airsfarnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." طيارة سفر ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local airsfarname = Redis:get(Thealhlfy.."airsfarname"..msg.sender_id.user_id)
local airsfarprice = Redis:get(Thealhlfy.."airsfarprice"..msg.sender_id.user_id) or 0
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
local airsfarnow = tonumber(airsfarnum) - tonumber(coniss)
Redis:set(Thealhlfy.."airsfarnum"..msg.sender_id.user_id , airsfarnow)
local Textinggt = {"400000000", "500000000", "600000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellair = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellair
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
if tonumber(airsfarnum) == 0 then
Redis:del(Thealhlfy.."airsfarname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airsfarnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع طائرة\n⇜ نوع الطائرة : سفر \n⇜ عدد الطائرات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellair).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع طياره خاصه (.*)$') or text and text:match('^بيع طيارة خاصه (.*)$') then

local UserName = text:match('^بيع طياره خاصه (.*)$') or text:match('^بيع طيارة خاصه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
if tonumber(airkhasnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك طائرات خاصه ","md",true)
end
if tonumber(airkhasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." طيارة خاصه ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local airkhasname = Redis:get(Thealhlfy.."airkhasname"..msg.sender_id.user_id)
local airkhasprice = Redis:get(Thealhlfy.."airkhasprice"..msg.sender_id.user_id) or 0
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
local airkhasnow = tonumber(airkhasnum) - tonumber(coniss)
Redis:set(Thealhlfy.."airkhasnum"..msg.sender_id.user_id , airkhasnow)
local Textinggt = {"150000000", "200000000", "250000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellair = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellair
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
if tonumber(airkhasnum) == 0 then
Redis:del(Thealhlfy.."airkhasname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airkhasnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع طائرة\n⇜ نوع الطائرة : خاصه \n⇜ عدد الطائرات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellair).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء طائره شبح (.*)$') or text and text:match('^اهداء طائرة شبح (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء طائره شبح (.*)$') or text:match('^اهداء طائرة شبح (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
if tonumber(airshbhnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك طائرات شبح ","md",true)
end
if tonumber(airshbhnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." طائرة شبح ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
local airshbhnow = tonumber(airshbhnum) - tonumber(coniss)
Redis:set(Thealhlfy.."airshbhnum"..msg.sender_id.user_id , airshbhnow)
local airshbhnumm = Redis:get(Thealhlfy.."airshbhnum"..Remsg.sender_id.user_id) or 0
local airshbhnoww = tonumber(airshbhnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."airshbhnum"..Remsg.sender_id.user_id , airshbhnoww)
shbhnamed = "شبح"
Redis:set(Thealhlfy.."airshbhname"..Remsg.sender_id.user_id,shbhnamed)
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
if tonumber(airshbhnum) == 0 then
Redis:del(Thealhlfy.."airshbhname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airshbhnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) طائرة شبح\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء طائره سفر (.*)$') or text and text:match('^اهداء طائرة سفر (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء طائره سفر (.*)$') or text:match('^اهداء طائرة سفر (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
if tonumber(airsfarnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك طائرات سفر ","md",true)
end
if tonumber(airsfarnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." طائرة سفر ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
local airsfarnow = tonumber(airsfarnum) - tonumber(coniss)
Redis:set(Thealhlfy.."airsfarnum"..msg.sender_id.user_id , airsfarnow)
local airsfarnumm = Redis:get(Thealhlfy.."airsfarnum"..Remsg.sender_id.user_id) or 0
local airsfarnoww = tonumber(airsfarnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."airsfarnum"..Remsg.sender_id.user_id , airsfarnoww)
sfarnamed = "سفر"
Redis:set(Thealhlfy.."airsfarname"..Remsg.sender_id.user_id,sfarnamed)
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
if tonumber(airsfarnum) == 0 then
Redis:del(Thealhlfy.."airsfarname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airsfarnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) طائرة سفر\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء طائره خاصه (.*)$') or text and text:match('^اهداء طائرة خاصه (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then

local UserName = text:match('^اهداء طائره خاصه (.*)$') or text:match('^اهداء طائرة خاصه (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
if tonumber(airkhasnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك طائرات خاصه ","md",true)
end
if tonumber(airkhasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." طائرة خاصه ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
local airkhasnow = tonumber(airkhasnum) - tonumber(coniss)
Redis:set(Thealhlfy.."airkhasnum"..msg.sender_id.user_id , airkhasnow)
local airkhasnumm = Redis:get(Thealhlfy.."airkhasnum"..Remsg.sender_id.user_id) or 0
local airkhasnoww = tonumber(airkhasnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."airkhasnum"..Remsg.sender_id.user_id , airkhasnoww)
khasnamed = "خاصه"
Redis:set(Thealhlfy.."airkhasname"..Remsg.sender_id.user_id,khasnamed)
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
if tonumber(airkhasnum) == 0 then
Redis:del(Thealhlfy.."airkhasname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."airkhasnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) طائرة خاصه\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره فيلار (.*)$') or text and text:match('^شراء سيارة فيلار (.*)$') then
local UserName = text:match('^شراء سياره فيلار (.*)$') or text:match('^شراء سيارة فيلار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره فيلار بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
rangpr = tonumber(coniss) * 10000000
if tonumber(ballance) < tonumber(rangpr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local carrangname = Redis:get(Thealhlfy.."carrangname"..msg.sender_id.user_id)
local carrangprice = Redis:get(Thealhlfy.."carrangprice"..msg.sender_id.user_id) or 0
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
local carrangnow = tonumber(carrangnum) + tonumber(coniss)
Redis:set(Thealhlfy.."carrangnum"..msg.sender_id.user_id , carrangnow)
rangnamed = "فيلار"
Redis:set(Thealhlfy.."carrangname"..msg.sender_id.user_id , rangnamed)
Redis:set(Thealhlfy.."carrangprice"..msg.sender_id.user_id , 10000000)
totalypalice = tonumber(ballance) - tonumber(rangpr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(rangpr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : فيلار \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك الفيلار : `"..carrangnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره اكسنت (.*)$') or text and text:match('^شراء سيارة اكسنت (.*)$') then
local UserName = text:match('^شراء سياره اكسنت (.*)$') or text:match('^شراء سيارة اكسنت (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره اكسنت بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
accepr = tonumber(coniss) * 9000000
if tonumber(ballance) < tonumber(accepr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local caraccename = Redis:get(Thealhlfy.."caraccename"..msg.sender_id.user_id)
local caracceprice = Redis:get(Thealhlfy.."caracceprice"..msg.sender_id.user_id) or 0
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
local caraccenow = tonumber(caraccenum) + tonumber(coniss)
Redis:set(Thealhlfy.."caraccenum"..msg.sender_id.user_id , caraccenow)
accenamed = "اكسنت"
Redis:set(Thealhlfy.."caraccename"..msg.sender_id.user_id , accenamed)
Redis:set(Thealhlfy.."caracceprice"..msg.sender_id.user_id , 9000000)
totalypalice = tonumber(ballance) - tonumber(accepr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(accepr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : اكسنت \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك الاكسنت : `"..caraccenow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره كامري (.*)$') or text and text:match('^شراء سيارة كامري (.*)$') then
local UserName = text:match('^شراء سياره كامري (.*)$') or text:match('^شراء سيارة كامري (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره كامري بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
camrpr = tonumber(coniss) * 8000000
if tonumber(ballance) < tonumber(camrpr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local carcamrname = Redis:get(Thealhlfy.."carcamrname"..msg.sender_id.user_id)
local carcamrprice = Redis:get(Thealhlfy.."carcamrprice"..msg.sender_id.user_id) or 0
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
local carcamrnow = tonumber(carcamrnum) + tonumber(coniss)
Redis:set(Thealhlfy.."carcamrnum"..msg.sender_id.user_id , carcamrnow)
camrnamed = "كامري"
Redis:set(Thealhlfy.."carcamrname"..msg.sender_id.user_id , camrnamed)
Redis:set(Thealhlfy.."carcamrprice"..msg.sender_id.user_id , 8000000)
totalypalice = tonumber(ballance) - tonumber(camrpr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(camrpr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : كامري \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك الكامري : `"..carcamrnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره النترا (.*)$') or text and text:match('^شراء سيارة النترا (.*)$') then
local UserName = text:match('^شراء سياره النترا (.*)$') or text:match('^شراء سيارة النترا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره النترا بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
alntrpr = tonumber(coniss) * 7000000
if tonumber(ballance) < tonumber(alntrpr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local caralntrname = Redis:get(Thealhlfy.."caralntrname"..msg.sender_id.user_id)
local caralntrprice = Redis:get(Thealhlfy.."caralntrprice"..msg.sender_id.user_id) or 0
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
local caralntrnow = tonumber(caralntrnum) + tonumber(coniss)
Redis:set(Thealhlfy.."caralntrnum"..msg.sender_id.user_id , caralntrnow)
alntrnamed = "النترا"
Redis:set(Thealhlfy.."caralntrname"..msg.sender_id.user_id , alntrnamed)
Redis:set(Thealhlfy.."caralntrprice"..msg.sender_id.user_id , 7000000)
totalypalice = tonumber(ballance) - tonumber(alntrpr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(alntrpr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : النترا \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك الالنترا : `"..caralntrnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره هايلكس (.*)$') or text and text:match('^شراء سيارة هايلكس (.*)$') then
local UserName = text:match('^شراء سياره هايلكس (.*)$') or text:match('^شراء سيارة هايلكس (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره هايلكس بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
hilxpr = tonumber(coniss) * 6000000
if tonumber(ballance) < tonumber(hilxpr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local carhilxname = Redis:get(Thealhlfy.."carhilxname"..msg.sender_id.user_id)
local carhilxprice = Redis:get(Thealhlfy.."carhilxprice"..msg.sender_id.user_id) or 0
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
local carhilxnow = tonumber(carhilxnum) + tonumber(coniss)
Redis:set(Thealhlfy.."carhilxnum"..msg.sender_id.user_id , carhilxnow)
hilxnamed = "هايلكس"
Redis:set(Thealhlfy.."carhilxname"..msg.sender_id.user_id , hilxnamed)
Redis:set(Thealhlfy.."carhilxprice"..msg.sender_id.user_id , 6000000)
totalypalice = tonumber(ballance) - tonumber(hilxpr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(hilxpr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : هايلكس \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك الهايلكس : `"..carhilxnow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره سوناتا (.*)$') or text and text:match('^شراء سيارة سوناتا (.*)$') then
local UserName = text:match('^شراء سياره سوناتا (.*)$') or text:match('^شراء سيارة سوناتا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره سوناتا بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
sonapr = tonumber(coniss) * 5000000
if tonumber(ballance) < tonumber(sonapr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local carsonaname = Redis:get(Thealhlfy.."carsonaname"..msg.sender_id.user_id)
local carsonaprice = Redis:get(Thealhlfy.."carsonaprice"..msg.sender_id.user_id) or 0
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
local carsonanow = tonumber(carsonanum) + tonumber(coniss)
Redis:set(Thealhlfy.."carsonanum"..msg.sender_id.user_id , carsonanow)
sonanamed = "سوناتا"
Redis:set(Thealhlfy.."carsonaname"..msg.sender_id.user_id , sonanamed)
Redis:set(Thealhlfy.."carsonaprice"..msg.sender_id.user_id , 5000000)
totalypalice = tonumber(ballance) - tonumber(sonapr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(sonapr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : سوناتا \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك السوناتا : `"..carsonanow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره كورولا (.*)$') or text and text:match('^شراء سيارة كورولا (.*)$') then
local UserName = text:match('^شراء سياره كورولا (.*)$') or text:match('^شراء سيارة كورولا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري اكثر من مليار سياره كورولا بعملية وحدة\n✧","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
coropr = tonumber(coniss) * 4000000
if tonumber(ballance) < tonumber(coropr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
local carcoroname = Redis:get(Thealhlfy.."carcoroname"..msg.sender_id.user_id)
local carcoroprice = Redis:get(Thealhlfy.."carcoroprice"..msg.sender_id.user_id) or 0
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
local carcoronow = tonumber(carcoronum) + tonumber(coniss)
Redis:set(Thealhlfy.."carcoronum"..msg.sender_id.user_id , carcoronow)
coronamed = "كورولا"
Redis:set(Thealhlfy.."carcoroname"..msg.sender_id.user_id , coronamed)
Redis:set(Thealhlfy.."carcoroprice"..msg.sender_id.user_id , 4000000)
totalypalice = tonumber(ballance) - tonumber(coropr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(coropr))
send(msg.chat_id,msg.id, "⌯ وصل شراء سيارة\n⇜ نوع السيارة : كورولا \n⇜ اجمالي السعر : "..convert_monyy.." 💵\n⇜ عدد سياراتك الكورولا : `"..carcoronow.."`\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره فيلار (.*)$') or text and text:match('^بيع سيارة فيلار (.*)$') then
local UserName = text:match('^بيع سياره فيلار (.*)$') or text:match('^بيع سيارة فيلار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
if tonumber(carrangnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات فيلار ","md",true)
end
if tonumber(carrangnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة فيلار ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local carrangname = Redis:get(Thealhlfy.."carrangname"..msg.sender_id.user_id)
local carrangprice = Redis:get(Thealhlfy.."carrangprice"..msg.sender_id.user_id) or 0
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
local carrangnow = tonumber(carrangnum) - tonumber(coniss)
Redis:set(Thealhlfy.."carrangnum"..msg.sender_id.user_id , carrangnow)
local Textinggt = {"9000000", "10000000", "11000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
if tonumber(carrangnum) == 0 then
Redis:del(Thealhlfy.."carrangname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carrangnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : فيلار \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره اكسنت (.*)$') or text and text:match('^بيع سيارة اكسنت (.*)$') then
local UserName = text:match('^بيع سياره اكسنت (.*)$') or text:match('^بيع سيارة اكسنت (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
if tonumber(caraccenum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات اكسنت ","md",true)
end
if tonumber(caraccenum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة اكسنت ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local caraccename = Redis:get(Thealhlfy.."caraccename"..msg.sender_id.user_id)
local caracceprice = Redis:get(Thealhlfy.."caracceprice"..msg.sender_id.user_id) or 0
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
local caraccenow = tonumber(caraccenum) - tonumber(coniss)
Redis:set(Thealhlfy.."caraccenum"..msg.sender_id.user_id , caraccenow)
local Textinggt = {"8000000", "9000000", "10000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
if tonumber(caraccenum) == 0 then
Redis:del(Thealhlfy.."caraccename"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caraccenum"..msg.sender_id.user_id)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : اكسنت \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره كامري (.*)$') or text and text:match('^بيع سيارة كامري (.*)$') then
local UserName = text:match('^بيع سياره كامري (.*)$') or text:match('^بيع سيارة كامري (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
if tonumber(carcamrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات كامري ","md",true)
end
if tonumber(carcamrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة كامري ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local carcamrname = Redis:get(Thealhlfy.."carcamrname"..msg.sender_id.user_id)
local carcamrprice = Redis:get(Thealhlfy.."carcamrprice"..msg.sender_id.user_id) or 0
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
local carcamrnow = tonumber(carcamrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."carcamrnum"..msg.sender_id.user_id , carcamrnow)
local Textinggt = {"7000000", "8000000", "9000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
if tonumber(carcamrnum) == 0 then
Redis:del(Thealhlfy.."carcamrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcamrnum"..msg.sender_id.user_id)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : كامري \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره النترا (.*)$') or text and text:match('^بيع سيارة النترا (.*)$') then
local UserName = text:match('^بيع سياره النترا (.*)$') or text:match('^بيع سيارة النترا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
if tonumber(caralntrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات النترا ","md",true)
end
if tonumber(caralntrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة النترا ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local caralntrname = Redis:get(Thealhlfy.."caralntrname"..msg.sender_id.user_id)
local caralntrprice = Redis:get(Thealhlfy.."caralntrprice"..msg.sender_id.user_id) or 0
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
local caralntrnow = tonumber(caralntrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."caralntrnum"..msg.sender_id.user_id , caralntrnow)
local Textinggt = {"6000000", "7000000", "8000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
if tonumber(caralntrnum) == 0 then
Redis:del(Thealhlfy.."caralntrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caralntrnum"..msg.sender_id.user_id)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : النترا \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره هايلكس (.*)$') or text and text:match('^بيع سيارة هايلكس (.*)$') then
local UserName = text:match('^بيع سياره هايلكس (.*)$') or text:match('^بيع سيارة هايلكس (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
if tonumber(carhilxnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات هايلكس ","md",true)
end
if tonumber(carhilxnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة هايلكس ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local carhilxname = Redis:get(Thealhlfy.."carhilxname"..msg.sender_id.user_id)
local carhilxprice = Redis:get(Thealhlfy.."carhilxprice"..msg.sender_id.user_id) or 0
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
local carhilxnow = tonumber(carhilxnum) - tonumber(coniss)
Redis:set(Thealhlfy.."carhilxnum"..msg.sender_id.user_id , carhilxnow)
local Textinggt = {"5000000", "6000000", "7000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
if tonumber(carhilxnum) == 0 then
Redis:del(Thealhlfy.."carhilxname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carhilxnum"..msg.sender_id.user_id)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : هايلكس \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره سوناتا (.*)$') or text and text:match('^بيع سيارة سوناتا (.*)$') then
local UserName = text:match('^بيع سياره سوناتا (.*)$') or text:match('^بيع سيارة سوناتا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
if tonumber(carsonanum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات سوناتا ","md",true)
end
if tonumber(carsonanum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة سوناتا ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local carsonaname = Redis:get(Thealhlfy.."carsonaname"..msg.sender_id.user_id)
local carsonaprice = Redis:get(Thealhlfy.."carsonaprice"..msg.sender_id.user_id) or 0
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
local carsonanow = tonumber(carsonanum) - tonumber(coniss)
Redis:set(Thealhlfy.."carsonanum"..msg.sender_id.user_id , carsonanow)
local Textinggt = {"4000000", "5000000", "6000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
if tonumber(carsonanum) == 0 then
Redis:del(Thealhlfy.."carsonaname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carsonanum"..msg.sender_id.user_id)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : سوناتا \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره كورولا (.*)$') or text and text:match('^بيع سيارة كورولا (.*)$') then
local UserName = text:match('^بيع سياره كورولا (.*)$') or text:match('^بيع سيارة كورولا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
if tonumber(carcoronum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات كورولا ","md",true)
end
if tonumber(carcoronum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة كورولا ","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local carcoroname = Redis:get(Thealhlfy.."carcoroname"..msg.sender_id.user_id)
local carcoroprice = Redis:get(Thealhlfy.."carcoroprice"..msg.sender_id.user_id) or 0
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
local carcoronow = tonumber(carcoronum) - tonumber(coniss)
Redis:set(Thealhlfy.."carcoronum"..msg.sender_id.user_id , carcoronow)
local Textinggt = {"3000000", "4000000", "5000000",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
sellcar = tonumber(coniss) * Descriptioont
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , totalypalice)
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
if tonumber(carcoronum) == 0 then
Redis:del(Thealhlfy.."carcoroname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcoronum"..msg.sender_id.user_id)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "⌯ وصل بيع سيارة\n⇜ نوع السيارة : كورولا \n⇜ عدد السيارات : "..tonumber(coniss).."\n⇜ اجمالي السعر : "..tonumber(sellcar).." 💵\n⇜ رصيدك الان : "..convert_mony.."\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره فيلار (.*)$') or text and text:match('^اهداء سيارة فيلار (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره فيلار (.*)$') or text:match('^اهداء سيارة فيلار (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
if tonumber(carrangnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات فيلار ","md",true)
end
if tonumber(carrangnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة فيلار ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
local carrangnow = tonumber(carrangnum) - tonumber(coniss)
Redis:set(Thealhlfy.."carrangnum"..msg.sender_id.user_id , carrangnow)
local carrangnumm = Redis:get(Thealhlfy.."carrangnum"..Remsg.sender_id.user_id) or 0
local carrangnoww = tonumber(carrangnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."carrangnum"..Remsg.sender_id.user_id , carrangnoww)
rangnamed = "فيلار"
Redis:set(Thealhlfy.."carrangname"..Remsg.sender_id.user_id,rangnamed)
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
if tonumber(carrangnum) == 0 then
Redis:del(Thealhlfy.."carrangname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carrangnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة فيلار\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره اكسنت (.*)$') or text and text:match('^اهداء سيارة اكسنت (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره اكسنت (.*)$') or text:match('^اهداء سيارة اكسنت (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
if tonumber(caraccenum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات اكسنت ","md",true)
end
if tonumber(caraccenum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة اكسنت ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
local caraccenow = tonumber(caraccenum) - tonumber(coniss)
Redis:set(Thealhlfy.."caraccenum"..msg.sender_id.user_id , caraccenow)
local caraccenumm = Redis:get(Thealhlfy.."caraccenum"..Remsg.sender_id.user_id) or 0
local caraccenoww = tonumber(caraccenumm) + tonumber(coniss)
Redis:set(Thealhlfy.."caraccenum"..Remsg.sender_id.user_id , caraccenoww)
accenamed = "اكسنت"
Redis:set(Thealhlfy.."caraccename"..Remsg.sender_id.user_id,accenamed)
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
if tonumber(caraccenum) == 0 then
Redis:del(Thealhlfy.."caraccename"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caraccenum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة اكسنت\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره كامري (.*)$') or text and text:match('^اهداء سيارة كامري (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره كامري (.*)$') or text:match('^اهداء سيارة كامري (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
if tonumber(carcamrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات كامري ","md",true)
end
if tonumber(carcamrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة كامري ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
local carcamrnow = tonumber(carcamrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."carcamrnum"..msg.sender_id.user_id , carcamrnow)
local carcamrnumm = Redis:get(Thealhlfy.."carcamrnum"..Remsg.sender_id.user_id) or 0
local carcamrnoww = tonumber(carcamrnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."carcamrnum"..Remsg.sender_id.user_id , carcamrnoww)
camrnamed = "كامري"
Redis:set(Thealhlfy.."carcamrname"..Remsg.sender_id.user_id,camrnamed)
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
if tonumber(carcamrnum) == 0 then
Redis:del(Thealhlfy.."carcamrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcamrnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة كامري\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره هايلكس (.*)$') or text and text:match('^اهداء سيارة هايلكس (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره هايلكس (.*)$') or text:match('^اهداء سيارة هايلكس (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
if tonumber(carhilxnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات هايلكس ","md",true)
end
if tonumber(carhilxnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة هايلكس ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
local carhilxnow = tonumber(carhilxnum) - tonumber(coniss)
Redis:set(Thealhlfy.."carhilxnum"..msg.sender_id.user_id , carhilxnow)
local carhilxnumm = Redis:get(Thealhlfy.."carhilxnum"..Remsg.sender_id.user_id) or 0
local carhilxnoww = tonumber(carhilxnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."carhilxnum"..Remsg.sender_id.user_id , carhilxnoww)
hilxnamed = "هايلكس"
Redis:set(Thealhlfy.."carhilxname"..Remsg.sender_id.user_id,hilxnamed)
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
if tonumber(carhilxnum) == 0 then
Redis:del(Thealhlfy.."carhilxname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carhilxnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة هايلكس\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره النترا (.*)$') or text and text:match('^اهداء سيارة النترا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره النترا (.*)$') or text:match('^اهداء سيارة النترا (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
if tonumber(caralntrnum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات النترا ","md",true)
end
if tonumber(caralntrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة النترا ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
local caralntrnow = tonumber(caralntrnum) - tonumber(coniss)
Redis:set(Thealhlfy.."caralntrnum"..msg.sender_id.user_id , caralntrnow)
local caralntrnumm = Redis:get(Thealhlfy.."caralntrnum"..Remsg.sender_id.user_id) or 0
local caralntrnoww = tonumber(caralntrnumm) + tonumber(coniss)
Redis:set(Thealhlfy.."caralntrnum"..Remsg.sender_id.user_id , caralntrnoww)
alntrnamed = "النترا"
Redis:set(Thealhlfy.."caralntrname"..Remsg.sender_id.user_id,alntrnamed)
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
if tonumber(caralntrnum) == 0 then
Redis:del(Thealhlfy.."caralntrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."caralntrnum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة النترا\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره سوناتا (.*)$') or text and text:match('^اهداء سيارة سوناتا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره سوناتا (.*)$') or text:match('^اهداء سيارة سوناتا (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
if tonumber(carsonanum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات سوناتا ","md",true)
end
if tonumber(carsonanum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة سوناتا ","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
local carsonanow = tonumber(carsonanum) - tonumber(coniss)
Redis:set(Thealhlfy.."carsonanum"..msg.sender_id.user_id , carsonanow)
local carsonanumm = Redis:get(Thealhlfy.."carsonanum"..Remsg.sender_id.user_id) or 0
local carsonanoww = tonumber(carsonanumm) + tonumber(coniss)
Redis:set(Thealhlfy.."carsonanum"..Remsg.sender_id.user_id , carsonanoww)
sonanamed = "سوناتا"
Redis:set(Thealhlfy.."carsonaname"..Remsg.sender_id.user_id,sonanamed)
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
if tonumber(carsonanum) == 0 then
Redis:del(Thealhlfy.."carsonaname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carsonanum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة سوناتا\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره كورولا (.*)$') or text and text:match('^اهداء سيارة كورولا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره كورولا (.*)$') or text:match('^اهداء سيارة كورولا (.*)$')
if Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."giftmmt" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ مايمديك تهدي الحين\n⇜ تعال بعد "..time.." ","md",true)
end
local coniss = coin(UserName)
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
if tonumber(carcoronum) == 0 then
return send(msg.chat_id,msg.id, "⇜ ليس لديك سيارات كورولا ","md",true)
end
if tonumber(carcoronum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ ماعندك "..tonumber(coniss).." سيارة كورولا","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ تهدي نفسك 🤡","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
local carcoronow = tonumber(carcoronum) - tonumber(coniss)
Redis:set(Thealhlfy.."carcoronum"..msg.sender_id.user_id , carcoronow)
local carcoronumm = Redis:get(Thealhlfy.."carcoronum"..Remsg.sender_id.user_id) or 0
local carcoronoww = tonumber(carcoronumm) + tonumber(coniss)
Redis:set(Thealhlfy.."carcoronum"..Remsg.sender_id.user_id , carcoronoww)
coronamed = "كورولا"
Redis:set(Thealhlfy.."carcoroname"..Remsg.sender_id.user_id,coronamed)
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
if tonumber(carcoronum) == 0 then
Redis:del(Thealhlfy.."carcoroname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."carcoronum"..msg.sender_id.user_id)
end
send(msg.chat_id,msg.id, "⇜ تم اهديته ( "..tonumber(coniss).." ) سيارة كورولا\n\n⇜ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✧","md",true)
Redis:setex(Thealhlfy.."giftmmt" .. msg.sender_id.user_id,1800, true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == "ممتلكاتي" or text == "ممتلكات" then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
local mgrmasname = Redis:get(Thealhlfy.."mgrmasname"..msg.sender_id.user_id)
local mgrmasnum = Redis:get(Thealhlfy.."mgrmasnum"..msg.sender_id.user_id) or 0
if mgrmasname then
mgrmasnamee = "- "..mgrmasname.." : ( `"..mgrmasnum.."` ) \n"
else
mgrmasnamee = ""
end
local mgrkldname = Redis:get(Thealhlfy.."mgrkldname"..msg.sender_id.user_id)
local mgrkldnum = Redis:get(Thealhlfy.."mgrkldnum"..msg.sender_id.user_id) or 0
if mgrkldname then
mgrkldnamee = "- "..mgrkldname.." : ( `"..mgrkldnum.."` ) \n"
else
mgrkldnamee = ""
end
local mgrswrname = Redis:get(Thealhlfy.."mgrswrname"..msg.sender_id.user_id)
local mgrswrnum = Redis:get(Thealhlfy.."mgrswrnum"..msg.sender_id.user_id) or 0
if mgrswrname then
mgrswrnamee = "- "..mgrswrname.." : ( `"..mgrswrnum.."` ) \n"
else
mgrswrnamee = ""
end
local mgrktmname = Redis:get(Thealhlfy.."mgrktmname"..msg.sender_id.user_id)
local mgrktmnum = Redis:get(Thealhlfy.."mgrktmnum"..msg.sender_id.user_id) or 0
if mgrktmname then
mgrktmnamee = "- "..mgrktmname.." : ( `"..mgrktmnum.."` ) \n"
else
mgrktmnamee = ""
end
local akrksrname = Redis:get(Thealhlfy.."akrksrname"..msg.sender_id.user_id)
local akrksrnum = Redis:get(Thealhlfy.."akrksrnum"..msg.sender_id.user_id) or 0
if akrksrname then
akrksrnamee = "- "..akrksrname.." : ( `"..akrksrnum.."` ) \n"
else
akrksrnamee = ""
end
local akrfelname = Redis:get(Thealhlfy.."akrfelname"..msg.sender_id.user_id)
local akrfelnum = Redis:get(Thealhlfy.."akrfelnum"..msg.sender_id.user_id) or 0
if akrfelname then
akrfelnamee = "- "..akrfelname.." : ( `"..akrfelnum.."` ) \n"
else
akrfelnamee = ""
end
local akrmnzname = Redis:get(Thealhlfy.."akrmnzname"..msg.sender_id.user_id)
local akrmnznum = Redis:get(Thealhlfy.."akrmnznum"..msg.sender_id.user_id) or 0
if akrmnzname then
akrmnznamee = "- "..akrmnzname.." : ( `"..akrmnznum.."` ) \n"
else
akrmnznamee = ""
end
local airshbhname = Redis:get(Thealhlfy.."airshbhname"..msg.sender_id.user_id)
local airshbhnum = Redis:get(Thealhlfy.."airshbhnum"..msg.sender_id.user_id) or 0
if airshbhname then
airshbhnamee = "- "..airshbhname.." : ( `"..airshbhnum.."` ) \n"
else
airshbhnamee = ""
end
local airsfarname = Redis:get(Thealhlfy.."airsfarname"..msg.sender_id.user_id)
local airsfarnum = Redis:get(Thealhlfy.."airsfarnum"..msg.sender_id.user_id) or 0
if airsfarname then
airsfarnamee = "- "..airsfarname.." : ( `"..airsfarnum.."` ) \n"
else
airsfarnamee = ""
end
local airkhasname = Redis:get(Thealhlfy.."airkhasname"..msg.sender_id.user_id)
local airkhasnum = Redis:get(Thealhlfy.."airkhasnum"..msg.sender_id.user_id) or 0
if airkhasname then
airkhasnamee = "- "..airkhasname.." : ( `"..airkhasnum.."` ) \n"
else
airkhasnamee = ""
end
local carrangname = Redis:get(Thealhlfy.."carrangname"..msg.sender_id.user_id)
local carrangnum = Redis:get(Thealhlfy.."carrangnum"..msg.sender_id.user_id) or 0
if carrangname then
carrangnamee = "- "..carrangname.." : ( `"..carrangnum.."` ) \n"
else
carrangnamee = ""
end
local caraccename = Redis:get(Thealhlfy.."caraccename"..msg.sender_id.user_id)
local caraccenum = Redis:get(Thealhlfy.."caraccenum"..msg.sender_id.user_id) or 0
if caraccename then
caraccenamee = "- "..caraccename.." : ( `"..caraccenum.."` ) \n"
else
caraccenamee = ""
end
local carcamrname = Redis:get(Thealhlfy.."carcamrname"..msg.sender_id.user_id)
local carcamrnum = Redis:get(Thealhlfy.."carcamrnum"..msg.sender_id.user_id) or 0
if carcamrname then
carcamrnamee = "- "..carcamrname.." : ( `"..carcamrnum.."` ) \n"
else
carcamrnamee = ""
end
local caralntrname = Redis:get(Thealhlfy.."caralntrname"..msg.sender_id.user_id)
local caralntrnum = Redis:get(Thealhlfy.."caralntrnum"..msg.sender_id.user_id) or 0
if caralntrname then
caralntrnamee = "- "..caralntrname.." : ( `"..caralntrnum.."` ) \n"
else
caralntrnamee = ""
end
local carhilxname = Redis:get(Thealhlfy.."carhilxname"..msg.sender_id.user_id)
local carhilxnum = Redis:get(Thealhlfy.."carhilxnum"..msg.sender_id.user_id) or 0
if carhilxname then
carhilxnamee = "- "..carhilxname.." : ( `"..carhilxnum.."` ) \n"
else
carhilxnamee = ""
end
local carsonaname = Redis:get(Thealhlfy.."carsonaname"..msg.sender_id.user_id)
local carsonanum = Redis:get(Thealhlfy.."carsonanum"..msg.sender_id.user_id) or 0
if carsonaname then
carsonanamee = "- "..carsonaname.." : ( `"..carsonanum.."` ) \n"
else
carsonanamee = ""
end
local carcoroname = Redis:get(Thealhlfy.."carcoroname"..msg.sender_id.user_id)
local carcoronum = Redis:get(Thealhlfy.."carcoronum"..msg.sender_id.user_id) or 0
if carcoroname then
carcoronamee = "- "..carcoroname.." : ( `"..carcoronum.."` ) \n"
else
carcoronamee = ""
end
if akrksrnum == 0 and akrfelnum == 0 and akrmnznum == 0 and mgrmasnum == 0 and mgrkldnum == 0 and mgrswrnum == 0 and mgrktmnum == 0 and airshbhnum == 0 and airsfarnum == 0 and airkhasnum == 0 and carrangnum == 0 and caraccenum == 0 and carcamrnum == 0 and caralntrnum == 0 and carhilxnum == 0 and carsonanum == 0 and carcoronum == 0 then
send(msg.chat_id,msg.id, "⇜ لا يوجد لديك ممتلكات\n⇜ تستطيع الشراء عن طريق ارسال كلمة ( `المعرض` )\n\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ مجوهراتك : 💎\n\n"..mgrmasnamee..""..mgrkldnamee..""..mgrswrnamee..""..mgrktmnamee.."\n⇜ عقاراتك : 🏘\n\n"..akrksrnamee..""..akrfelnamee..""..akrmnznamee.."\n⇜ طائراتك : ✈️\n\n"..airshbhnamee..""..airsfarnamee..""..airkhasnamee.."\n⇜ سياراتك : 🚗\n\n"..carrangnamee..""..caraccenamee..""..carcamrnamee..""..caralntrnamee..""..carhilxnamee..""..carsonanamee..""..carcoronamee.."\n\n⇜ تستطيع بيع او اهداء ممتلكاتك\nمثال :\nبيع فيلا 4 \nاهداء طائره شبح 2 ( بالرد ) \n\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == 'زواج' then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زواج` المهر","md",true)
end
if text and text:match("^زواج (%d+)$") and msg.reply_to_message_id == 0 then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زواج` المهر ( بالرد )","md",true)
end
if text and text:match("^زواج (.*)$") and msg.reply_to_message_id ~= 0 then

ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local UserName = text:match('^زواج (.*)$')
local coniss = coin(UserName)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ زوجتك نفسي 🤣😒","md",true)  
return false
end
if Redis:get(Thealhlfy.."zwag_request:"..msg.sender_id.user_id) then 
return send(msg.chat_id,msg.id, "⇜ في طلب باسمك انتظر قليلاً \n✧","md",true)
end
if tonumber(coniss) < 10000 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح به هو 10000 درهم \n✧","md",true)
end
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 10000 then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي\n✧","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس مو للزواج 🤣","md",true)  
return false
end
if Redis:get(Thealhlfy.."roog1"..msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ ابك تراك متزوج !!","md",true)
return false
end
if Redis:get(Thealhlfy.."rooga1"..msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ ابك تراك متزوج !!","md",true)
return false
end
if Redis:get(Thealhlfy.."roog1"..Remsg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ ابعد بعيد لاتحوس وتدور حول المتزوجين","md",true)
return false
end
if Redis:get(Thealhlfy.."rooga1"..Remsg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ ابعد بعيد لاتحوس وتدور حول المتزوجين","md",true)
return false
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local zwg = bot.getUser(msg.sender_id.user_id)
local zwga = bot.getUser(Remsg.sender_id.user_id)
local zwg_tag = '['..zwg.first_name.."](tg://user?id="..msg.sender_id.user_id..")"
local zwga_tag = '['..zwga.first_name.."](tg://user?id="..Remsg.sender_id.user_id..")"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافقة', data =Remsg.sender_id.user_id.."/zwag_yes/"..msg.sender_id.user_id.."/mahr/"..coniss},{text = 'غير موافقة', data = Remsg.sender_id.user_id.."/zwag_no/"..msg.sender_id.user_id},
},
}
}
Redis:setex(Thealhlfy.."zwag_request:"..msg.sender_id.user_id,60,true)
Redis:setex(Thealhlfy.."zwag_request:"..Remsg.sender_id.user_id,60,true)
return send(msg.chat_id,msg.id,"⇜ الزوج : "..zwg_tag.."\n⇜ الزوجة : "..zwga_tag.."\n⇜ المهر : "..coniss.."\n⇜ شو رأيك معاكي دقيقة وينتهي الطلب ؟","md",false, false, false, false, reply_markup)
else
return send(msg.chat_id,msg.reply_to_message_id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "زواجات غش" then
if msg.ControllerBot then
  local zwag_users = Redis:smembers(Thealhlfy.."roogg1")
  if #zwag_users == 0 then
  return send(msg.chat_id,msg.id,"⇜ مافي زواجات حاليا","md",true)
  end
  top_zwag = "⇜ توب 30 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(Thealhlfy.."rahr1"..v)
  local zwga = Redis:get(Thealhlfy.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
  local zwg_tag = '['..zwg_name..'](tg://user?id='..v[2]..')'
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(Thealhlfy..v[3].."first_name:") or "لا يوجد اسم"
  local zwga_tag = '['..zwga_name..'](tg://user?id='..v[3]..')'
tt =  '['..zwg_name..'](tg://user?id='..v[2]..')'
kk = '['..zwga_name..'](tg://user?id='..v[3]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = zwag_emoji[k]
znum = znum + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_zwag = top_zwag..emo.." "..gflos.." 💵 l "..tt.." 👫 "..kk.."\n"
gg = "\n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
  end
  end
  local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_zwag,"md",false, false, false, false, reply_markup)
  end
  end
if text == "توب زواج" or text == "توب متزوجات" or text == "توب زوجات" or text == "توب زواجات" or text == "زواجات" or text == "الزواجات" then

  local zwag_users = Redis:smembers(Thealhlfy.."roogg1")
  if #zwag_users == 0 then
  return send(msg.chat_id,msg.id,"⇜ مافي زواجات حاليا","md",true)
  end
  top_zwag = "⇜ توب 30 اغلى زواجات :\n\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(Thealhlfy.."rahr1"..v)
  local zwga = Redis:get(Thealhlfy.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(Thealhlfy..v[3].."first_name:") or "لا يوجد اسم"
tt =  "["..zwg_name.."]("..zwg_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
kk =  "["..zwga_name.."]("..zwga_name..")"
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Thealhlfy.."doltebank"..v[2]) or " "
local doltebankz = Redis:get(Thealhlfy.."doltebank"..v[3]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = zwag_emoji[k]
znum = znum + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_zwag = top_zwag..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.." 👫 "..kk.." "..doltebankz.."\n"
gg = "\n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
  end
  end
  local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_zwag..gg,"md",false, false, false, false, reply_markup)
  end
if text == 'زواجي' then

if Redis:sismember(Thealhlfy.."roogg1",msg.sender_id.user_id) or Redis:sismember(Thealhlfy.."roogga1",msg.sender_id.user_id) then
local zoog = Redis:get(Thealhlfy.."roog1"..msg.sender_id.user_id)
local zooga = Redis:get(Thealhlfy.."rooga1"..msg.sender_id.user_id)
local mahr = Redis:get(Thealhlfy.."rahr1"..msg.sender_id.user_id)
local convert_mony = string.format("%.0f",mahr)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد اسم"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد اسم"
end
send(msg.chat_id,msg.id, "⌯ وثيقة الزواج حقتك :\n\n⇜ الزوج "..neews.." 🤵🏻\n⇜ الزوجة "..newws.." 👰🏻‍♀️\n⇜ المهر : "..convert_mony.." درهم 💵","md",true)
else
send(msg.chat_id,msg.id, "⇜ انت اعزب","md",true)
end
end
if text == 'زوجها' or text == "زوجته" or text == "جوزها" or text == "زوجتو" or text == "زواجه" and msg.reply_to_message_id ~= 0 then

local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if msg.sender_id.user_id == Remsg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ اكتب `زواجي`","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."roogg1",Remsg.sender_id.user_id) or Redis:sismember(Thealhlfy.."roogga1",Remsg.sender_id.user_id) then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 100 then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس مو متزوجه ","md",true)  
return false
end
local zoog = Redis:get(Thealhlfy.."roog1"..Remsg.sender_id.user_id)
local zooga = Redis:get(Thealhlfy.."rooga1"..Remsg.sender_id.user_id)
local mahr = Redis:get(Thealhlfy.."rahr1"..Remsg.sender_id.user_id)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد اسم"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد اسم"
end
local otheka = ballancee - 100
local convert_mony = string.format("%.0f",mahr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(otheka))
send(msg.chat_id,msg.id, "⌯ وثيقة الزواج حقته :\n\n⇜ الزوج "..neews.." 🤵🏻\n⇜ الزوجة "..newws.." 👰🏻‍♀️\n⇜ المهر : "..convert_mony.." درهم 💵","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ مسكين اعزب مو متزوج","md",true)
end
end
if text == 'طلاق' then

if Redis:sismember(Thealhlfy.."roogg1",msg.sender_id.user_id) or Redis:sismember(Thealhlfy.."roogga1",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local zoog = Redis:get(Thealhlfy.."roog1"..msg.sender_id.user_id)
local zooga = tonumber(Redis:get(Thealhlfy.."rooga1"..msg.sender_id.user_id))
if tonumber(zoog) == msg.sender_id.user_id then
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد اسم"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد اسم"
end
Redis:srem(Thealhlfy.."roogg1", msg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogga1", msg.sender_id.user_id)
Redis:del(Thealhlfy.."roog1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rooga1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rahr1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rahrr1"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogg1", zooga)
Redis:srem(Thealhlfy.."roogga1", zooga)
Redis:del(Thealhlfy.."roog1"..zooga)
Redis:del(Thealhlfy.."rooga1"..zooga)
Redis:del(Thealhlfy.."rahr1"..zooga)
Redis:del(Thealhlfy.."rahrr1"..zooga)
return send(msg.chat_id,msg.id, "⇜ ابشر طلقتك من زوجتك "..newws.."","md",true)
else
send(msg.chat_id,msg.id, "⇜ الطلاق للزوج فقط","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ انت اعزب","md",true)
end
end
if text == 'خلع' then

if Redis:sismember(Thealhlfy.."roogg1",msg.sender_id.user_id) or Redis:sismember(Thealhlfy.."roogga1",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
local zoog = Redis:get(Thealhlfy.."roog1"..msg.sender_id.user_id)
local zooga = Redis:get(Thealhlfy.."rooga1"..msg.sender_id.user_id)
if tonumber(zooga) == msg.sender_id.user_id then
local mahrr = Redis:get(Thealhlfy.."rahrr1"..msg.sender_id.user_id)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد اسم"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد اسم"
end
ballancee = Redis:get(Thealhlfy.."boob"..zoog) or 0
kalea = ballancee + mahrr
Redis:set(Thealhlfy.."boob"..zoog , kalea)
local convert_mony = string.format("%.0f",mahrr)
send(msg.chat_id,msg.id, "⇜ خلعت زوجك "..neews.."\n⇜ ورجعت له المهر ( "..convert_mony.." درهم 💵 )","md",true)
Redis:srem(Thealhlfy.."roogg1", zoog)
Redis:srem(Thealhlfy.."roogga1", zoog)
Redis:del(Thealhlfy.."roog1"..zoog)
Redis:del(Thealhlfy.."rooga1"..zoog)
Redis:del(Thealhlfy.."rahr1"..zoog)
Redis:del(Thealhlfy.."rahrr1"..zoog)
Redis:srem(Thealhlfy.."roogg1", msg.sender_id.user_id)
Redis:srem(Thealhlfy.."roogga1", msg.sender_id.user_id)
Redis:del(Thealhlfy.."roog1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rooga1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rahr1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."rahrr1"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ الخلع للزوجات فقط","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ انت اعزب","md",true)
end
end
if text == 'مراهنه' or text == 'مراهنة' then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `مراهنه` المبلغ","md",true)
end
if text and text:match('^مراهنه (.*)$') or text and text:match('^مراهنة (.*)$') then

local UserName = text:match('^مراهنه (.*)$') or text:match('^مراهنة (.*)$')
local coniss = coin(UserName)
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 999 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 1000 درهم 💵\n✧","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
Redis:del(Thealhlfy..'List_rhan'..msg.chat_id)  
Redis:set(Thealhlfy.."playerrhan"..msg.chat_id,msg.sender_id.user_id)
Redis:set(Thealhlfy.."playercoins"..msg.chat_id..msg.sender_id.user_id,coniss)
Redis:set(Thealhlfy.."raeahkam"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Thealhlfy..'List_rhan'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Thealhlfy.."Start_rhan"..msg.chat_id,3600,true)
Redis:set(Thealhlfy.."allrhan"..msg.chat_id..12345 , coniss)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
rehan = tonumber(ballancee) - tonumber(coniss)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , rehan)
return send(msg.chat_id,msg.id,"⇜ بدينا المراهنة وسجلت اسمك \n⇜ اللي بده يشارك يرسل ( انا والمبلغ ) .","md",true)
end
if text == 'نعم' and Redis:get(Thealhlfy.."Witting_Startrhan"..msg.chat_id) then
rarahkam = Redis:get(Thealhlfy.."raeahkam"..msg.chat_id)
if tonumber(rarahkam) == msg.sender_id.user_id then
local list = Redis:smembers(Thealhlfy..'List_rhan'..msg.chat_id) 
if #list == 1 then 
return send(msg.chat_id,msg.id,"⇜ عذراً لم يشارك احد بالرهان","md",true)  
end 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '@['..UserId_Info.username..']'
end
benrahan = Redis:get(Thealhlfy.."allrhan"..msg.chat_id..12345) or 0
local ballancee = Redis:get(Thealhlfy.."boob"..UserName) or 0
rehane = tonumber(benrahan) / 100 * 25
rehan = tonumber(ballancee) + math.floor(rehane)
Redis:set(Thealhlfy.."boob"..UserName , rehan)
local rhan_users = Redis:smembers(Thealhlfy.."List_rhan"..msg.chat_id)
for k,v in pairs(rhan_users) do
Redis:del(Thealhlfy..'playercoins'..msg.chat_id..v)
end
Redis:del(Thealhlfy..'allrhan'..msg.chat_id..12345) 
Redis:del(Thealhlfy..'playerrhan'..msg.chat_id) 
Redis:del(Thealhlfy..'raeahkam'..msg.chat_id) 
Redis:del(Thealhlfy..'List_rhan'..msg.chat_id) 
Redis:del(Thealhlfy.."Witting_Startrhan"..msg.chat_id)
Redis:del(Thealhlfy.."Start_rhan"..msg.chat_id)
local ballancee = Redis:get(Thealhlfy.."boob"..UserName) or 0
local convert_mony = string.format("%.0f",rehane)
local convert_monyy = string.format("%.0f",ballancee)
return send(msg.chat_id,msg.id,'⌯ فاز '..ls..' بالرهان 🎊\n⇜ المبلغ : '..convert_mony..' درهم 💵\n⇜ خصمت 25% ضريبة \n⇜ رصيدك الان : '..convert_monyy..' درهم 💵\n✧',"md",true)
end
end
--------------------------------------------------------------------------------------------------------------
if text == 'الكره' or text == 'كرة' or text == 'نادي' or text == 'النادي' or text == 'لعبه الكره' or text == 'لعبه الكرة' then
return send(msg.chat_id,msg.id, "☆ اوامر لعبه الكره\n\n⌯ انشاء نادي + الاسم ↢ تسوي نادي وتقدر تلعب مباريات مع اصحابك\n\n⌯ مسح ناديي ↢ تمسح ناديك\n\n⌯ ناديي ↢ يطلع لك اسم ناديك ومعلومات عنه\n\n⌯ تدريب ↢ يعطيك طاقه كل 20 دقيقة\n\n⌯ مباره وديه ↢ تلعب مباره وديه مع نادي في فوز ، خساره او تعادل؜\n\n⌯ مباره ↢ بالرد تلعب مع شخص مباره في فوز ، تعادل او خساره الاقوى راح يفوز\n\n⌯ شراء لاعب ↢ تشتري لاعب لناديك\n\n⌯ بيع لاعب ↢ تبيع لاعب من ناديك\n\n⌯ تغيير لقب النادي ↢ يغير لقب ناديك\n\n⌯ توب النوادي ↢ اعلى 10 نوادي باللعبة\n✧","md",true)
end
if text == "توب نادي" or text == "توب النادي" or text == "توب النوادي" or text == "توب نوادي" then

local bank_users = Redis:smembers(Thealhlfy.."ownernade")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد نوادي","md",true)
end
top_monyd = "⇜ توب اعلى 10 نوادي :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."nokatnade"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(Thealhlfy.."lkbnade"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Thealhlfy.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_monyd..gg,"md",false, false, false, false, reply_markup)
end
if text == 'انشاء نادي' or text == 'بناء نادي' then
send(msg.chat_id,msg.id, "⇜ ارسل انشاء نادي + الاسم\n⇜ مثال : انشاء نادي الفتوة\n✧","md",true)
end
if text and text:match('انشاء نادي (.*)') or text and text:match('بناء نادي (.*)') then

local Cnamed = text:match('انشاء نادي (.*)') or text:match('بناء نادي (.*)')
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if Redis:get(Thealhlfy.."namenade"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ لديك نادي مسبقاً ","md",true)
end
if Redis:sismember(Thealhlfy.."lkbnadesadd", Cnamed) then
return send(msg.chat_id,msg.id, "⇜ الاسم موجود مسبقاً\n⇜ اختر اسم اخر\n✧","md",true)
end
Redis:set(Thealhlfy.."lkbnade"..msg.sender_id.user_id, Cnamed)
msgnade = '⇜ اختر النادي : ⚽️\n✧'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ريال مدريد', data = msg.sender_id.user_id..'/realm'},{text = 'برشلونة', data = msg.sender_id.user_id..'/barca'},{text = 'تشيلسي', data = msg.sender_id.user_id..'/chels'},
},
{
{text = 'مانشستر يونايتد', data = msg.sender_id.user_id..'/manun'},{text = 'ليفربول', data = msg.sender_id.user_id..'/livb'},{text = 'انتر ميلان', data = msg.sender_id.user_id..'/intmi'},
},
{
{text = 'مانشستر سيتي', data = msg.sender_id.user_id..'/manci'},{text = 'يوفنتس', data = msg.sender_id.user_id..'/juvin'},{text = 'ارسنال', data = msg.sender_id.user_id..'/arsi'}, 
},
{
{text = 'Louis',url="t.me/Y88F8"}, 
},
}
}
return send(msg.chat_id,msg.id,msgnade,"md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح نادي' or text == 'مسح النادي' or text == 'مسح ناديي' or text == 'مسح فريقي' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n( `انشاء نادي` ) والاسم","md",true)
end
namfra = Redis:get(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."namenade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nokatnade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energynade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."traningnade"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."nameplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."5"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."lkbnadesadd", namfra)
Redis:srem(Thealhlfy.."ownernade",msg.sender_id.user_id)
Redis:del(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم مسح النادي الخاص بك","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تدريب' or text == 'التدريب' or text == 'تدريب نادي' or text == 'تدريب ناديي' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n( `انشاء نادي` ) والاسم","md",true)
end
if Redis:ttl(Thealhlfy.."traningnade" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."traningnade" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ تستطيع تدريب النادي الخاص بك بعد "..time.." ","md",true)
end
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
namenade = Redis:get(Thealhlfy.."namenade"..msg.sender_id.user_id)
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
lkbnade = Redis:get(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
namenade = Redis:get(Thealhlfy.."namenade"..msg.sender_id.user_id)
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
if tonumber(energynade) < 151 then
Redis:incrby(Thealhlfy.."energynade"..msg.sender_id.user_id,1)
end
if energyplayer1 then
if tonumber(energyplayer1) < 151 then
Redis:incrby(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id,1)
end
end
if energyplayer2 then
if tonumber(energyplayer2) < 151 then
Redis:incrby(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id,1)
end
end
if energyplayer3 then
if tonumber(energyplayer3) < 151 then
Redis:incrby(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id,1)
end
end
if energyplayer4 then
if tonumber(energyplayer4) < 151 then
Redis:incrby(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id,1)
end
end
if energyplayer5 then
if tonumber(energyplayer5) < 151 then
Redis:incrby(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id,1)
end
end
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
Redis:setex(Thealhlfy.."traningnade" .. msg.sender_id.user_id,1800, true)
send(msg.chat_id,msg.id, "⌯ تم تدريب النادي الخاص بك "..news.."\n⇜ اسم النادي : "..namenade.."\n⇜ لقب النادي : "..lkbnade.."\n⇜ طاقة النادي : "..energynade.."\n⇜ اكتب ( `ناديي` ) لمعرفة طاقات لاعبينك  ","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تغير لقب النادي' or text == 'تغيير لقب النادي' or text == 'تغيير لقب نادي' or text == 'تغير لقب نادي' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n( `انشاء نادي` ) والاسم","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballance) < tonumber(25000) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تغيير اللقب فلوسك ماتكفي","md",true)
end
Redis:setex(Thealhlfy.."changlkbnade" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
send(msg.chat_id,msg.id,"⇜ ارسل اللقب الجديد\n⇜ للالغاء ارسل ( `الغاء الامر` )\n✧","md",true)  
return false
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if Redis:get(Thealhlfy.."changlkbnade" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
Redis:del(Thealhlfy.."changlkbnade" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
if text == "الغاء" or text == "الغاء الامر" then
return send(msg.chat_id,msg.id, "⇜ تم الغاء امر تغيير لقب النادي","md",true)
end
if Redis:sismember(Thealhlfy.."lkbnadesadd", text) then
return send(msg.chat_id,msg.id, "⇜ الاسم موجود مسبقاً\n⇜ اختر اسم اخر\n✧","md",true)
end
namfra = Redis:get(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."lkbnadesadd", namfra)
Redis:del(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
Redis:set(Thealhlfy.."lkbnade"..msg.sender_id.user_id, text)
Redis:sadd(Thealhlfy.."lkbnadesadd", text)
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
cccallcc = tonumber(ballance) - 25000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,cccallcc)
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballance)
send(msg.chat_id,msg.id, "⇜ تم تغيير لقب ناديك\n\n⇜ اللقب الجديد : "..text.."\n⇜ سعر تغيير اللقب : 25000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
end
if text == 'عرض لاعب' or text == 'بيع لاعب' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n( `انشاء نادي` ) والاسم","md",true)
end
nameplayer1 = Redis:get(Thealhlfy.."nameplayer".."1"..msg.sender_id.user_id)
nameplayer2 = Redis:get(Thealhlfy.."nameplayer".."2"..msg.sender_id.user_id)
nameplayer3 = Redis:get(Thealhlfy.."nameplayer".."3"..msg.sender_id.user_id)
nameplayer4 = Redis:get(Thealhlfy.."nameplayer".."4"..msg.sender_id.user_id)
nameplayer5 = Redis:get(Thealhlfy.."nameplayer".."5"..msg.sender_id.user_id)
if nameplayer1 then
mrkzplayer1 = Redis:get(Thealhlfy.."mrkzplayer".."1"..msg.sender_id.user_id)
cityplayer1 = Redis:get(Thealhlfy.."cityplayer".."1"..msg.sender_id.user_id)
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
priceplayer1 = Redis:get(Thealhlfy.."priceplayer".."1"..msg.sender_id.user_id)
nameplayer1done = "⌯ اسم اللاعب : `"..nameplayer1.."`\n- مركزه : "..mrkzplayer1.."\n- طاقة اللاعب : "..energyplayer1.."\n- الجنسية : "..cityplayer1.."\n- السعر : "..priceplayer1.."\n\n"
else
nameplayer1done = ""
end
if nameplayer2 then
mrkzplayer2 = Redis:get(Thealhlfy.."mrkzplayer".."2"..msg.sender_id.user_id)
cityplayer2 = Redis:get(Thealhlfy.."cityplayer".."2"..msg.sender_id.user_id)
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
priceplayer2 = Redis:get(Thealhlfy.."priceplayer".."2"..msg.sender_id.user_id)
nameplayer2done = "⌯ اسم اللاعب : `"..nameplayer2.."`\n- مركزه : "..mrkzplayer2.."\n- طاقة اللاعب : "..energyplayer2.."\n- الجنسية : "..cityplayer2.."\n- السعر : "..priceplayer2.."\n\n"
else
nameplayer2done = ""
end
if nameplayer3 then
mrkzplayer3 = Redis:get(Thealhlfy.."mrkzplayer".."3"..msg.sender_id.user_id)
cityplayer3 = Redis:get(Thealhlfy.."cityplayer".."3"..msg.sender_id.user_id)
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
priceplayer3 = Redis:get(Thealhlfy.."priceplayer".."3"..msg.sender_id.user_id)
nameplayer3done = "⌯ اسم اللاعب : `"..nameplayer3.."`\n- مركزه : "..mrkzplayer3.."\n- طاقة اللاعب : "..energyplayer3.."\n- الجنسية : "..cityplayer3.."\n- السعر : "..priceplayer3.."\n\n"
else
nameplayer3done = ""
end
if nameplayer4 then
mrkzplayer4 = Redis:get(Thealhlfy.."mrkzplayer".."4"..msg.sender_id.user_id)
cityplayer4 = Redis:get(Thealhlfy.."cityplayer".."4"..msg.sender_id.user_id)
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
priceplayer4 = Redis:get(Thealhlfy.."priceplayer".."4"..msg.sender_id.user_id)
nameplayer4done = "⌯ اسم اللاعب : `"..nameplayer4.."`\n- مركزه : "..mrkzplayer4.."\n- طاقة اللاعب : "..energyplayer4.."\n- الجنسية : "..cityplayer4.."\n- السعر : "..priceplayer4.."\n\n"
else
nameplayer4done = ""
end
if nameplayer5 then
mrkzplayer5 = Redis:get(Thealhlfy.."mrkzplayer".."5"..msg.sender_id.user_id)
cityplayer5 = Redis:get(Thealhlfy.."cityplayer".."5"..msg.sender_id.user_id)
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
priceplayer5 = Redis:get(Thealhlfy.."priceplayer".."5"..msg.sender_id.user_id)
nameplayer5done = "⌯ اسم اللاعب : `"..nameplayer5.."`\n- مركزه : "..mrkzplayer5.."\n- طاقة اللاعب : "..energyplayer5.."\n- الجنسية : "..cityplayer5.."\n- السعر : "..priceplayer5.."\n\n"
else
nameplayer5done = ""
end
if not nameplayer1 and not nameplayer2 and not nameplayer3 and not nameplayer4 and not nameplayer5 then
return send(msg.chat_id,msg.id, "⇜ لا يوجد لديك لاعبين\n⇜ تستطيع شراء لاعب بالامر ( `شراء لاعب` )","md",true)
end
Redis:setex(Thealhlfy.."shoplyname" .. msg.chat_id .. ":" .. msg.sender_id.user_id,60, true)
send(msg.chat_id,msg.id,"⇜ ارسل اسم اللاعب فقط\n\n"..nameplayer1done..""..nameplayer2done..""..nameplayer3done..""..nameplayer4done..""..nameplayer5done.."\n\n⇜ اضغط لنسخ الاسم\n⇜ للالغاء ارسل ( `الغاء الامر` )\n✧","md",true)  
return false
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if Redis:get(Thealhlfy.."shoplyname" .. msg.chat_id .. ":" .. msg.sender_id.user_id) then
Redis:del(Thealhlfy.."shoplyname" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
if text == "الغاء" or text == "الغاء الامر" then
return send(msg.chat_id,msg.id, "⇜ تم الغاء امر بيع اللاعب","md",true)
end
nameplayer1 = Redis:get(Thealhlfy.."nameplayer".."1"..msg.sender_id.user_id)
nameplayer2 = Redis:get(Thealhlfy.."nameplayer".."2"..msg.sender_id.user_id)
nameplayer3 = Redis:get(Thealhlfy.."nameplayer".."3"..msg.sender_id.user_id)
nameplayer4 = Redis:get(Thealhlfy.."nameplayer".."4"..msg.sender_id.user_id)
nameplayer5 = Redis:get(Thealhlfy.."nameplayer".."5"..msg.sender_id.user_id)
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if text == nameplayer1 then
priceplayer1 = Redis:get(Thealhlfy.."priceplayer".."1"..msg.sender_id.user_id)
pricetotaly = ballance + tonumber(priceplayer1)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,pricetotaly)
Redis:del(Thealhlfy.."nameplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."1"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."1"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم بيع اللاعب","md",true)
elseif text == nameplayer2 then
priceplayer2 = Redis:get(Thealhlfy.."priceplayer".."2"..msg.sender_id.user_id)
pricetotaly = ballance + tonumber(priceplayer2)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,pricetotaly)
Redis:del(Thealhlfy.."nameplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."2"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."2"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم بيع اللاعب","md",true)
elseif text == nameplayer3 then
priceplayer3 = Redis:get(Thealhlfy.."priceplayer".."3"..msg.sender_id.user_id)
pricetotaly = ballance + tonumber(priceplayer3)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,pricetotaly)
Redis:del(Thealhlfy.."nameplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."3"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."3"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم بيع اللاعب","md",true)
elseif text == nameplayer4 then
priceplayer4 = Redis:get(Thealhlfy.."priceplayer".."4"..msg.sender_id.user_id)
pricetotaly = ballance + tonumber(priceplayer4)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,pricetotaly)
Redis:del(Thealhlfy.."nameplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."4"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."4"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم بيع اللاعب","md",true)
elseif text == nameplayer5 then
priceplayer5 = Redis:get(Thealhlfy.."priceplayer".."5"..msg.sender_id.user_id)
pricetotaly = ballance + tonumber(priceplayer5)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,pricetotaly)
Redis:del(Thealhlfy.."nameplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mrkzplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."cityplayer".."5"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."priceplayer".."5"..msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم بيع اللاعب","md",true)
else
send(msg.chat_id,msg.id, "⇜ اسم اللاعب خطأ !!","md",true)
end
end
if text == 'ناديي' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n⇜ ( `انشاء نادي` ) والاسم","md",true)
end
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
namenade = Redis:get(Thealhlfy.."namenade"..msg.sender_id.user_id)
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
lkbnade = Redis:get(Thealhlfy.."lkbnade"..msg.sender_id.user_id)
nokatnade = Redis:get(Thealhlfy.."nokatnade"..msg.sender_id.user_id) or 0
nameplayer1 = Redis:get(Thealhlfy.."nameplayer".."1"..msg.sender_id.user_id)
nameplayer2 = Redis:get(Thealhlfy.."nameplayer".."2"..msg.sender_id.user_id)
nameplayer3 = Redis:get(Thealhlfy.."nameplayer".."3"..msg.sender_id.user_id)
nameplayer4 = Redis:get(Thealhlfy.."nameplayer".."4"..msg.sender_id.user_id)
nameplayer5 = Redis:get(Thealhlfy.."nameplayer".."5"..msg.sender_id.user_id)
if nameplayer1 then
mrkzplayer1 = Redis:get(Thealhlfy.."mrkzplayer".."1"..msg.sender_id.user_id)
cityplayer1 = Redis:get(Thealhlfy.."cityplayer".."1"..msg.sender_id.user_id)
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
nameplayer1done = "⌯ اسم اللاعب : "..nameplayer1.."\n- مركزه : "..mrkzplayer1.."\n- طاقة اللاعب : "..energyplayer1.."\n- الجنسية : "..cityplayer1.."\n\n"
else
nameplayer1done = ""
end
if nameplayer2 then
mrkzplayer2 = Redis:get(Thealhlfy.."mrkzplayer".."2"..msg.sender_id.user_id)
cityplayer2 = Redis:get(Thealhlfy.."cityplayer".."2"..msg.sender_id.user_id)
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
nameplayer2done = "⌯ اسم اللاعب : "..nameplayer2.."\n- مركزه : "..mrkzplayer2.."\n- طاقة اللاعب : "..energyplayer2.."\n- الجنسية : "..cityplayer2.."\n\n"
else
nameplayer2done = ""
end
if nameplayer3 then
mrkzplayer3 = Redis:get(Thealhlfy.."mrkzplayer".."3"..msg.sender_id.user_id)
cityplayer3 = Redis:get(Thealhlfy.."cityplayer".."3"..msg.sender_id.user_id)
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
nameplayer3done = "⌯ اسم اللاعب : "..nameplayer3.."\n- مركزه : "..mrkzplayer3.."\n- طاقة اللاعب : "..energyplayer3.."\n- الجنسية : "..cityplayer3.."\n\n"
else
nameplayer3done = ""
end
if nameplayer4 then
mrkzplayer4 = Redis:get(Thealhlfy.."mrkzplayer".."4"..msg.sender_id.user_id)
cityplayer4 = Redis:get(Thealhlfy.."cityplayer".."4"..msg.sender_id.user_id)
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
nameplayer4done = "⌯ اسم اللاعب : "..nameplayer4.."\n- مركزه : "..mrkzplayer4.."\n- طاقة اللاعب : "..energyplayer4.."\n- الجنسية : "..cityplayer4.."\n\n"
else
nameplayer4done = ""
end
if nameplayer5 then
mrkzplayer5 = Redis:get(Thealhlfy.."mrkzplayer".."5"..msg.sender_id.user_id)
cityplayer5 = Redis:get(Thealhlfy.."cityplayer".."5"..msg.sender_id.user_id)
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
nameplayer5done = "⌯ اسم اللاعب : "..nameplayer5.."\n- مركزه : "..mrkzplayer5.."\n- طاقة اللاعب : "..energyplayer5.."\n- الجنسية : "..cityplayer5.."\n\n"
else
nameplayer5done = ""
end
if not nameplayer1 and not nameplayer2 and not nameplayer3 and not nameplayer4 and not nameplayer5 then
send(msg.chat_id,msg.id, "⌯ صاحب النادي "..news.."\n⇜ اسم النادي : "..namenade.."\n⇜ لقب النادي : "..lkbnade.."\n⇜ طاقة النادي : "..energynade.."\n⇜ نقاط النادي : "..nokatnade.."\n\n⇜ لا يوجد لديك لاعبين\n━━━━━━━━━\n\n⇜ شراء لاعب بالامر ( `شراء لاعب` )\n⇜ `بيع لاعب` \n⇜ تدريب ناديك بالامر ( `تدريب` )\n⇜ مباره وديه بالامر ( `مباره وديه` )\n⇜ مباره ضد لاعب بالامر ( `مباره` بالرد )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⌯ صاحب النادي "..news.."\n⇜ اسم النادي : "..namenade.."\n⇜ لقب النادي : "..lkbnade.."\n⇜ طاقة النادي : "..energynade.."\n⇜ نقاط النادي : "..nokatnade.."\n\n⇜ لاعبين النادي :\n\n"..nameplayer1done..""..nameplayer2done..""..nameplayer3done..""..nameplayer4done..""..nameplayer5done.."\n━━━━━━━━━\n\n⇜ شراء لاعب بالامر ( `شراء لاعب` )\n⇜ تدريب ناديك بالامر ( `تدريب` )\n⇜ مباره وديه بالامر ( `مباره وديه` )\n⇜ مباره عادية بالامر ( `مباره` )\n ✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'ناديه' and tonumber(msg.reply_to_message_id) ~= 0 then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها نادي ","md",true)
return false
end
if not Redis:get(Thealhlfy.."namenade" .. Remsg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعنده نادي","md",true)
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
namenade = Redis:get(Thealhlfy.."namenade"..Remsg.sender_id.user_id)
energynade = Redis:get(Thealhlfy.."energynade"..Remsg.sender_id.user_id)
lkbnade = Redis:get(Thealhlfy.."lkbnade"..Remsg.sender_id.user_id)
nokatnade = Redis:get(Thealhlfy.."nokatnade"..Remsg.sender_id.user_id) or 0
nameplayer1 = Redis:get(Thealhlfy.."nameplayer".."1"..Remsg.sender_id.user_id)
nameplayer2 = Redis:get(Thealhlfy.."nameplayer".."2"..Remsg.sender_id.user_id)
nameplayer3 = Redis:get(Thealhlfy.."nameplayer".."3"..Remsg.sender_id.user_id)
nameplayer4 = Redis:get(Thealhlfy.."nameplayer".."4"..Remsg.sender_id.user_id)
nameplayer5 = Redis:get(Thealhlfy.."nameplayer".."5"..Remsg.sender_id.user_id)
if nameplayer1 then
mrkzplayer1 = Redis:get(Thealhlfy.."mrkzplayer".."1"..Remsg.sender_id.user_id)
cityplayer1 = Redis:get(Thealhlfy.."cityplayer".."1"..Remsg.sender_id.user_id)
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id)
nameplayer1done = "⌯ اسم اللاعب : "..nameplayer1.."\n- مركزه : "..mrkzplayer1.."\n- طاقة اللاعب : "..energyplayer1.."\n- الجنسية : "..cityplayer1.."\n\n"
else
nameplayer1done = ""
end
if nameplayer2 then
mrkzplayer2 = Redis:get(Thealhlfy.."mrkzplayer".."2"..Remsg.sender_id.user_id)
cityplayer2 = Redis:get(Thealhlfy.."cityplayer".."2"..Remsg.sender_id.user_id)
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id)
nameplayer2done = "⌯ اسم اللاعب : "..nameplayer2.."\n- مركزه : "..mrkzplayer2.."\n- طاقة اللاعب : "..energyplayer2.."\n- الجنسية : "..cityplayer2.."\n\n"
else
nameplayer2done = ""
end
if nameplayer3 then
mrkzplayer3 = Redis:get(Thealhlfy.."mrkzplayer".."3"..Remsg.sender_id.user_id)
cityplayer3 = Redis:get(Thealhlfy.."cityplayer".."3"..Remsg.sender_id.user_id)
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id)
nameplayer3done = "⌯ اسم اللاعب : "..nameplayer3.."\n- مركزه : "..mrkzplayer3.."\n- طاقة اللاعب : "..energyplayer3.."\n- الجنسية : "..cityplayer3.."\n\n"
else
nameplayer3done = ""
end
if nameplayer4 then
mrkzplayer4 = Redis:get(Thealhlfy.."mrkzplayer".."4"..Remsg.sender_id.user_id)
cityplayer4 = Redis:get(Thealhlfy.."cityplayer".."4"..Remsg.sender_id.user_id)
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id)
nameplayer4done = "⌯ اسم اللاعب : "..nameplayer4.."\n- مركزه : "..mrkzplayer4.."\n- طاقة اللاعب : "..energyplayer4.."\n- الجنسية : "..cityplayer4.."\n\n"
else
nameplayer4done = ""
end
if nameplayer5 then
mrkzplayer5 = Redis:get(Thealhlfy.."mrkzplayer".."5"..Remsg.sender_id.user_id)
cityplayer5 = Redis:get(Thealhlfy.."cityplayer".."5"..Remsg.sender_id.user_id)
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id)
nameplayer5done = "⌯ اسم اللاعب : "..nameplayer5.."\n- مركزه : "..mrkzplayer5.."\n- طاقة اللاعب : "..energyplayer5.."\n- الجنسية : "..cityplayer5.."\n\n"
else
nameplayer5done = ""
end
if not nameplayer1 and not nameplayer2 and not nameplayer3 and not nameplayer4 and not nameplayer5 then
send(msg.chat_id,msg.id, "⌯ صاحب النادي "..news.."\n⇜ اسم النادي : "..namenade.."\n⇜ لقب النادي : "..lkbnade.."\n⇜ طاقة النادي : "..energynade.."\n⇜ نقاط النادي : "..nokatnade.."\n\n⇜ لا يوجد لديه لاعبين\n✧","md",true)
else
send(msg.chat_id,msg.id, "⌯ صاحب النادي "..news.."\n⇜ اسم النادي : "..namenade.."\n⇜ لقب النادي : "..lkbnade.."\n⇜ طاقة النادي : "..energynade.."\n⇜ نقاط النادي : "..nokatnade.."\n\n⇜ لاعبين النادي :\n\n"..nameplayer1done..""..nameplayer2done..""..nameplayer3done..""..nameplayer4done..""..nameplayer5done.."\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مباره وديه' or text == 'مبارة ودية' or text == 'مباره ودية' or text == 'مبارة وديه' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n( `انشاء نادي` ) والاسم","md",true)
end
if Redis:ttl(Thealhlfy.."matchode" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."matchode" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ تستطيع لعب مبارة وديه بعد "..time.." ","md",true)
end
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
namenade = Redis:get(Thealhlfy.."namenade"..msg.sender_id.user_id)
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id) or 0
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id) or 0
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id) or 0
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id) or 0
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id) or 0
energymynade = tonumber(energynade) + tonumber(energyplayer1) + tonumber(energyplayer2) + tonumber(energyplayer3) + tonumber(energyplayer4) + tonumber(energyplayer5)
local energybott = {"50", "100", "150", "200", "250", "300", "350", "400", "450", "0", "25", "70", "125",}
local energybot = energybott[math.random(#energybott)]
local resultt = {"0 - 1", "0 - 2", "0 - 3", "0 - 4", "0 - 5", "1 - 2", "1 - 3", "1 - 4", "1 - 5", "2 - 3", "2 - 4", "2 - 5", "3 - 4", "3 - 5", "4 - 5", "5 - 6",}
local result = resultt[math.random(#resultt)]
local tadoll = {"0 - 0", "1 - 1", "2 - 2", "3 - 3", "4 - 4", "5 - 5",}
local tadol = tadoll[math.random(#tadoll)]
local nadebott = {"اشبيلية", "ريفر بلايت", "ريفر بلايت", "بوروسيا", "أياكس الهولندي", "ليون", "شاختار دونيتسك", "روما", "فياريال", "بوكا جونيورز", "نابولي", "بنفيكا", "فلامنجو", "ليستر سيتي", "بالمرسي", "ليل", "ريال سوسيداد", "ايندهوفن", "الأهلي المصري", "الهلال السعودي", "الاتحاد السعودي",}
local nadebot = nadebott[math.random(#nadebott)]
if energymynade > tonumber(energybot) then
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
cccallcc = tonumber(ballance) + 500000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,cccallcc)
Redis:incrby(Thealhlfy.."energynade"..msg.sender_id.user_id,1)
Redis:incrby(Thealhlfy.."nokatnade"..msg.sender_id.user_id,1)
Redis:setex(Thealhlfy.."matchode" .. msg.sender_id.user_id,1200, true)
send(msg.chat_id,msg.id, "⌯ لقد فزت بالمبارة "..news.." ⚽️\n⇜ اسم النادي : "..namenade.."\n⇜ نادي الخصم : "..nadebot.."\n⇜ النتيجة : "..result.."\n⇜ تم زيادة نقطة لطاقة ناديك\n✧","md",true)
elseif energymynade < tonumber(energybot) then
Redis:decrby(Thealhlfy.."energynade"..msg.sender_id.user_id,1)
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
if tonumber(energynade) < 0 then
Redis:set(Thealhlfy.."energynade"..msg.sender_id.user_id,0)
end
Redis:decrby(Thealhlfy.."nokatnade"..msg.sender_id.user_id,1)
nokatnade = Redis:get(Thealhlfy.."nokatnade"..msg.sender_id.user_id)
if tonumber(nokatnade) < 0 then
Redis:set(Thealhlfy.."nokatnade"..msg.sender_id.user_id,0)
end
Redis:setex(Thealhlfy.."matchode" .. msg.sender_id.user_id,1200, true)
send(msg.chat_id,msg.id, "⌯ لقد خسرت بالمبارة "..news.." ⚽️\n⇜ اسم النادي : "..namenade.."\n⇜ نادي الخصم : "..nadebot.."\n⇜ النتيجة : "..result.."\n⇜ خسرت نقطة من طاقة ناديك\n✧","md",true)
else
Redis:setex(Thealhlfy.."matchode" .. msg.sender_id.user_id,1200, true)
send(msg.chat_id,msg.id, "⌯ لقد تعادلت بالمبارة "..news.." ⚽️\n⇜ اسم النادي : "..namenade.."\n⇜ نادي الخصم : "..nadebot.."\n⇜ النتيجة : "..tadol.."\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مباره' or text == 'مبارة' or text == 'لعب مبارة' or text == 'لعب مباره' and tonumber(msg.reply_to_message_id) ~= 0 then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."namenade" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك نادي اصلاً\n⇜ قم بانشاء النادي الخاص بك عن طريق الامر \n( `انشاء نادي` ) والاسم","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها نادي ","md",true)
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
send(msg.chat_id,msg.id,"\n⇜ بدك تلعب مبارة مع نفسك 🤡","md",true)  
return false
end
if not Redis:get(Thealhlfy.."namenade" .. Remsg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ خصمك ماعنده نادي ","md",true)
end
if Redis:ttl(Thealhlfy.."matchplayer" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."matchplayer" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ تستطيع لعب مبارة بعد "..time.." ","md",true)
end
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
namenade = Redis:get(Thealhlfy.."namenade"..msg.sender_id.user_id)
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id) or 0
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id) or 0
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id) or 0
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id) or 0
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id) or 0
energymynade = tonumber(energynade) + tonumber(energyplayer1) + tonumber(energyplayer2) + tonumber(energyplayer3) + tonumber(energyplayer4) + tonumber(energyplayer5)

namenadevs = Redis:get(Thealhlfy.."namenade"..Remsg.sender_id.user_id)
energynadevs = Redis:get(Thealhlfy.."energynade"..Remsg.sender_id.user_id)
energyplayer1vs = Redis:get(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id) or 0
energyplayer2vs = Redis:get(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id) or 0
energyplayer3vs = Redis:get(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id) or 0
energyplayer4vs = Redis:get(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id) or 0
energyplayer5vs = Redis:get(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id) or 0
energymynadevs = tonumber(energynadevs) + tonumber(energyplayer1vs) + tonumber(energyplayer2vs) + tonumber(energyplayer3vs) + tonumber(energyplayer4vs) + tonumber(energyplayer5vs)
local resultt = {"0 - 1", "0 - 2", "0 - 3", "0 - 4", "0 - 5", "1 - 2", "1 - 3", "1 - 4", "1 - 5", "2 - 3", "2 - 4", "2 - 5", "3 - 4", "3 - 5", "4 - 5", "5 - 6",}
local result = resultt[math.random(#resultt)]
local tadoll = {"0 - 0", "1 - 1", "2 - 2", "3 - 3", "4 - 4", "5 - 5",}
local tadol = tadoll[math.random(#tadoll)]
if energymynade > energymynadevs then
Redis:incrby(Thealhlfy.."energynade"..msg.sender_id.user_id,1)
Redis:incrby(Thealhlfy.."nokatnade"..msg.sender_id.user_id,1)
if energyplayer1 then
Redis:incrby(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id,1)
end
if energyplayer2 then
Redis:incrby(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id,1)
end
if energyplayer3 then
Redis:incrby(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id,1)
end
if energyplayer4 then
Redis:incrby(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id,1)
end
if energyplayer5 then
Redis:incrby(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id,1)
end
Redis:decrby(Thealhlfy.."energynade"..Remsg.sender_id.user_id,1)
energynadevs = Redis:get(Thealhlfy.."energynade"..Remsg.sender_id.user_id)
if tonumber(energynadevs) < 0 then
Redis:set(Thealhlfy.."energynade"..Remsg.sender_id.user_id,0)
end
if energyplayer1vs then
Redis:decrby(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id,1)
end
energyplayer1vs = Redis:get(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id)
if tonumber(energyplayer1vs) < 0 then
Redis:set(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id,0)
end
if energyplayer2vs then
Redis:decrby(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id,1)
end
energyplayer2vs = Redis:get(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id)
if tonumber(energyplayer2vs) < 0 then
Redis:set(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id,0)
end
if energyplayer3vs then
Redis:decrby(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id,1)
end
energyplayer3vs = Redis:get(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id)
if tonumber(energyplayer3vs) < 0 then
Redis:set(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id,0)
end
if energyplayer4vs then
Redis:decrby(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id,1)
end
energyplayer4vs = Redis:get(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id)
if tonumber(energyplayer4vs) < 0 then
Redis:set(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id,0)
end
if energyplayer5vs then
Redis:decrby(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id,1)
end
energyplayer5vs = Redis:get(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id)
if tonumber(energyplayer5vs) < 0 then
Redis:set(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id,0)
end
Redis:decrby(Thealhlfy.."nokatnade"..Remsg.sender_id.user_id,1)
nokatnadevs = Redis:get(Thealhlfy.."nokatnade"..Remsg.sender_id.user_id)
if tonumber(nokatnadevs) < 0 then
Redis:set(Thealhlfy.."nokatnade"..Remsg.sender_id.user_id,0)
end
Redis:setex(Thealhlfy.."matchplayer" .. msg.sender_id.user_id,1200, true)
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
cccallcc = tonumber(ballance) + 1000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id,cccallcc)
send(msg.chat_id,msg.id, "⌯ لقد فزت بالمبارة "..news.." ⚽️\n⇜ اسم النادي : "..namenade.."\n⇜ نادي الخصم : "..namenadevs.."\n⇜ النتيجة : "..result.."\n⇜ الجائزة : 1000000 درهم 💵\n⇜ تم زيادة طاقة ناديك ولاعبينك وانقاصها من الخصم\n✧","md",true)
elseif energymynade < energymynadevs then
Redis:incrby(Thealhlfy.."energynade"..Remsg.sender_id.user_id,1)
Redis:incrby(Thealhlfy.."nokatnade"..Remsg.sender_id.user_id,1)
if energyplayer1vs then
Redis:incrby(Thealhlfy.."energyplayer".."1"..Remsg.sender_id.user_id,1)
end
if energyplayer2vs then
Redis:incrby(Thealhlfy.."energyplayer".."2"..Remsg.sender_id.user_id,1)
end
if energyplayer3vs then
Redis:incrby(Thealhlfy.."energyplayer".."3"..Remsg.sender_id.user_id,1)
end
if energyplayer4vs then
Redis:incrby(Thealhlfy.."energyplayer".."4"..Remsg.sender_id.user_id,1)
end
if energyplayer5vs then
Redis:incrby(Thealhlfy.."energyplayer".."5"..Remsg.sender_id.user_id,1)
end
Redis:decrby(Thealhlfy.."energynade"..msg.sender_id.user_id,1)
energynade = Redis:get(Thealhlfy.."energynade"..msg.sender_id.user_id)
if tonumber(energynade) < 0 then
Redis:set(Thealhlfy.."energynade"..msg.sender_id.user_id,0)
end
if energyplayer1 then
Redis:decrby(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id,1)
end
energyplayer1 = Redis:get(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id)
if tonumber(energyplayer1) < 0 then
Redis:set(Thealhlfy.."energyplayer".."1"..msg.sender_id.user_id,0)
end
if energyplayer2 then
Redis:decrby(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id,1)
end
energyplayer2 = Redis:get(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id)
if tonumber(energyplayer2) < 0 then
Redis:set(Thealhlfy.."energyplayer".."2"..msg.sender_id.user_id,0)
end
if energyplayer3 then
Redis:decrby(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id,1)
end
energyplayer3 = Redis:get(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id)
if tonumber(energyplayer3) < 0 then
Redis:set(Thealhlfy.."energyplayer".."3"..msg.sender_id.user_id,0)
end
if energyplayer4 then
Redis:decrby(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id,1)
end
energyplayer4 = Redis:get(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id)
if tonumber(energyplayer4) < 0 then
Redis:set(Thealhlfy.."energyplayer".."4"..msg.sender_id.user_id,0)
end
if energyplayer5 then
Redis:decrby(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id,1)
end
energyplayer5 = Redis:get(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id)
if tonumber(energyplayer5) < 0 then
Redis:set(Thealhlfy.."energyplayer".."5"..msg.sender_id.user_id,0)
end
Redis:decrby(Thealhlfy.."nokatnade"..msg.sender_id.user_id,1)
nokatnade = Redis:get(Thealhlfy.."nokatnade"..msg.sender_id.user_id)
if tonumber(nokatnade) < 0 then
Redis:set(Thealhlfy.."nokatnade"..msg.sender_id.user_id,0)
end
Redis:setex(Thealhlfy.."matchplayer" .. msg.sender_id.user_id,1200, true)
send(msg.chat_id,msg.id, "⌯ لقد خسرت بالمبارة "..news.." ⚽️\n⇜ اسم النادي : "..namenade.."\n⇜ نادي الخصم : "..namenadevs.."\n⇜ النتيجة : "..result.."\n⇜ تم انقاص طاقة ناديك ولاعبينك وزيادتها لدى الخصم\n✧","md",true)
else
Redis:setex(Thealhlfy.."matchplayer" .. msg.sender_id.user_id,1200, true)
send(msg.chat_id,msg.id, "⌯ لقد تعادلت بالمبارة "..news.." ⚽️\n⇜ اسم النادي : "..namenade.."\n⇜ نادي الخصم : "..namenadevs.."\n⇜ النتيجة : "..tadol.."\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'شراء لاعب' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if Redis:get(Thealhlfy.."mrkzplayer".."1"..msg.sender_id.user_id) and Redis:get(Thealhlfy.."mrkzplayer".."2"..msg.sender_id.user_id) and Redis:get(Thealhlfy.."mrkzplayer".."3"..msg.sender_id.user_id) and Redis:get(Thealhlfy.."mrkzplayer".."4"..msg.sender_id.user_id) and Redis:get(Thealhlfy.."mrkzplayer".."5"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ النادي الخاص بك مكتمل\n⇜ تستطيع بيع لاعب عن طريق الامر ( بيع لاعب )  ","md",true)
end
if Redis:ttl(Thealhlfy.."buyplayer" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."buyplayer" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ تستطيع شراء لاعب بعد "..time.." ","md",true)
end
Redis:setex(Thealhlfy.."buyplayer" .. msg.sender_id.user_id,900, true)
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
msgplayer = "⇜ الاسم : لويس سواريز\n⇜ مركزه : مهاجم ايمن\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : اوكرانيا 🇺🇦\n⇜ سعر اللاعب : 39000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/luisyes'},{text = 'لا', data = msg.sender_id.user_id..'/luisno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "2" then
msgplayer = "⇜ الاسم : داني الفيش \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ سعر اللاعب : 50000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/danyes'},{text = 'لا', data = msg.sender_id.user_id..'/danno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "3" then
msgplayer = "⇜ الاسم : فيل فودن\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 70000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/fdnyes'},{text = 'لا', data = msg.sender_id.user_id..'/fdnno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "4" then
msgplayer = "⇜ الاسم : رافيل فاران\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : فرنسا 🇫🇷\n⇜ سعر اللاعب : 40000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/rafyes'},{text = 'لا', data = msg.sender_id.user_id..'/rafno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "5" then
msgplayer = "⇜ الاسم : خوان ماتا\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : إسبانيا 🇪🇸\n⇜ سعر اللاعب : 20000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/kuanyes'},{text = 'لا', data = msg.sender_id.user_id..'/kuanno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "6" then
msgplayer = "⇜ الاسم : هاري ماجواير\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 80\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 15000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/hariyes'},{text = 'لا', data = msg.sender_id.user_id..'/harino'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "7" then
msgplayer = "⇜ الاسم : روميلو لوكاكو\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : بلجيكا 🇧🇪 󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 100000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/romoyes'},{text = 'لا', data = msg.sender_id.user_id..'/romono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "8" then
msgplayer = "⇜ الاسم : تياجو سيلفا \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ سعر اللاعب : 20000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/tiagoyes'},{text = 'لا', data = msg.sender_id.user_id..'/tiagono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "9" then
msgplayer = "⇜ الاسم : جيرارد بيكيه\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : إسبانيا 🇪🇸\n⇜ سعر اللاعب : 30000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/gerardyes'},{text = 'لا', data = msg.sender_id.user_id..'/gerardno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "10" then
msgplayer = "⇜ الاسم : تير شتيجن\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 91\n⇜ الجنسية :ألمانيا 🇩🇪\n⇜ سعر اللاعب : 110000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/tyryes'},{text = 'لا', data = msg.sender_id.user_id..'/tyrno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "11" then
msgplayer = "⇜ الاسم : عثمان ديمبلي\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : فرنسا 🇫🇷\n⇜ سعر اللاعب : 45000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/osmanyes'},{text = 'لا', data = msg.sender_id.user_id..'/osmanno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "12" then
msgplayer = "⇜ الاسم : رودريغو \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ سعر اللاعب : 78000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/rodrigoyes'},{text = 'لا', data = msg.sender_id.user_id..'/rodrigono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "13" then
msgplayer = "⇜ الاسم : ميليتاو \n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ سعر اللاعب : 65000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/milyes'},{text = 'لا', data = msg.sender_id.user_id..'/milno'},

},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "14" then
msgplayer = "⇜ الاسم : ألابا\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 86\n⇜ الجنسيه : النمسا 🇦🇹\n⇜ سعر اللاعب : 73000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/albayes'},{text = 'لا', data = msg.sender_id.user_id..'/albano'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "15" then
msgplayer = "⇜ الاسم : فينيسيوس\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 94\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ سعر اللاعب : 180000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/fenesyes'},{text = 'لا', data = msg.sender_id.user_id..'/fenesno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "16" then
msgplayer = "⇜ الاسم : دي ماريا\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : الأرجنتين 🇦🇷 \n⇜ سعر اللاعب : 55000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/demayes'},{text = 'لا', data = msg.sender_id.user_id..'/demano'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "17" then
msgplayer = "⇜ الاسم : دانيلو\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : البرازيل 🇧🇷 \n⇜ سعر اللاعب : 20000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/danilyes'},{text = 'لا', data = msg.sender_id.user_id..'/danilno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "18" then
msgplayer = "⇜ الاسم :  دانييلي\n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : إيطاليا 🇮🇹 \n⇜ سعر اللاعب : 38000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/daneleyes'},{text = 'لا', data = msg.sender_id.user_id..'/daneleno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "19" then
msgplayer = "⇜ الاسم :  إبراهيموفتش \n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 85\n⇜ الجنسيه : السويد 🇸🇪 \n⇜ سعر اللاعب : 55000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/ibrahyes'},{text = 'لا', data = msg.sender_id.user_id..'/ibrahno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "20" then
msgplayer = "⇜ الاسم :  دوناروما \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 89\n⇜ الجنسيه : إيطاليا 🇮🇹\n⇜ سعر اللاعب : 99000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/donaryes'},{text = 'لا', data = msg.sender_id.user_id..'/donarno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "21" then
msgplayer = "⇜ الاسم :  أشرف حكيمي \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 85\n⇜ الجنسيه : المغرب 🇲🇦 \n⇜ سعر اللاعب : 55000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/ashrfyes'},{text = 'لا', data = msg.sender_id.user_id..'/ashrfno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "22" then
msgplayer = "⇜ الاسم :  ايدن ازارد \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 86\n⇜ بلجيكا 🇧🇪 : الجنسيه \n⇜ سعر اللاعب : 59000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/idenyes'},{text = 'لا', data = msg.sender_id.user_id..'/idenno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "23" then
msgplayer = "⇜ الاسم :  سيرجو راموس \n⇜ مركزه : مدافع\n⇜ طاقة اللاعب : 93\n⇜ اسبانيا 🇪🇸 : الجنسيه \n⇜ سعر اللاعب : 170000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/sergyes'},{text = 'لا', data = msg.sender_id.user_id..'/sergno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "24" then
msgplayer = "⇜ الاسم : فرمينو\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ سعر اللاعب : 60000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/fermyes'},{text = 'لا', data = msg.sender_id.user_id..'/fermno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "25" then
msgplayer = "⇜ الاسم : جاك كلارك\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 19000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/jackyes'},{text = 'لا', data = msg.sender_id.user_id..'/jackno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "26" then
msgplayer = "⇜ الاسم : انسلو فاتي\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸\n⇜ سعر اللاعب : 53000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/ansloyes'},{text = 'لا', data = msg.sender_id.user_id..'/anslono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "27" then
msgplayer = "⇜ الاسم : توريس\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸\n⇜ سعر اللاعب : 41000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/toresyes'},{text = 'لا', data = msg.sender_id.user_id..'/toresno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "28" then
msgplayer = "⇜ الاسم : توماس مولر\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : ألمانيا 🇩🇪\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/muleryes'},{text = 'لا', data = msg.sender_id.user_id..'/mulerno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "29" then
msgplayer = "⇜ الاسم : برونو فيرنانديز\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : البرتغال 🇵🇹\n⇜ سعر اللاعب : 74000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/brunoyes'},{text = 'لا', data = msg.sender_id.user_id..'/brunono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "30" then
msgplayer = "⇜ الاسم : بول بوجبا\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : فرنسا 🇫🇷\n⇜ سعر اللاعب : 78000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/paulyes'},{text = 'لا', data = msg.sender_id.user_id..'/paulno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "31" then
msgplayer = "⇜ الاسم : لوكا مودريتش\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : كرواتيا 🇭🇷\n⇜ سعر اللاعب : 90000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/modricyes'},{text = 'لا', data = msg.sender_id.user_id..'/modricno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "32" then
msgplayer = "⇜ الاسم : إيسكو\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : اسبانيا 🇪🇸\n⇜ سعر اللاعب : 41000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/iscoyes'},{text = 'لا', data = msg.sender_id.user_id..'/iscnono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "33" then
msgplayer = "⇜ الاسم : فابينهو\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 81\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ سعر اللاعب : 20000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/fabinyes'},{text = 'لا', data = msg.sender_id.user_id..'/fabinno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "34" then
msgplayer = "⇜ الاسم : هيندرسون\n⇜ مركزه : وسط\n⇜ طاقة اللاعب : 86\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 70000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/hinsonyes'},{text = 'لا', data = msg.sender_id.user_id..'/hinsonno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "35" then
msgplayer = "⇜ الاسم : جان اوبلاك\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : رومانيا 🇹🇩\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/janyes'},{text = 'لا', data = msg.sender_id.user_id..'/janno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "36" then
msgplayer = "⇜ الاسم : كيلور نافاس\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : كوستا ريكا🇨🇷\n⇜ سعر اللاعب : 70000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/kayloryes'},{text = 'لا', data = msg.sender_id.user_id..'/kaylorno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "37" then
msgplayer = "⇜ الاسم : يان سومر\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 87\n⇜ الجنسية : سويسرا 🇨🇭\n⇜ سعر اللاعب : 70000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/sommeryes'},{text = 'لا', data = msg.sender_id.user_id..'/sommerno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "38" then
msgplayer = "⇜ الاسم : بيرند لينو\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 85\n⇜ الجنسية : المانيا🇩🇪\n⇜ سعر اللاعب : 52000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/brendyes'},{text = 'لا', data = msg.sender_id.user_id..'/brendyes'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "39" then
msgplayer = "⇜ الاسم : ميندي\n⇜ مركزه : حاسر\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : غانا 🇬🇭\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/mendyyes'},{text = 'لا', data = msg.sender_id.user_id..'/mendyno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "40" then
msgplayer = "⇜ الاسم : اندريه اونانا\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 83\n⇜ الجنسية : غانا 🇬🇭\n⇜ سعر اللاعب : 20000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/onanayes'},{text = 'لا', data = msg.sender_id.user_id..'/onanano'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "41" then
msgplayer = "⇜ الاسم : روي باتريكو\n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : البرتغال 🇵🇹\n⇜ سعر اللاعب : 40000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/royyes'},{text = 'لا', data = msg.sender_id.user_id..'/royno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "42" then
msgplayer = "⇜ الاسم : كاسبر \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 84\n⇜ الجنسية : الدنمارك 🇩🇰\n⇜ سعر اللاعب : 40000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/kasperyes'},{text = 'لا', data = msg.sender_id.user_id..'/kasperno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "43" then
msgplayer = "⇜ الاسم : دافيد \n⇜ مركزه : حارس\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : اسبانيا 🇪🇸\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/geayes'},{text = 'لا', data = msg.sender_id.user_id..'/geano'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "44" then
msgplayer = "⇜ الاسم : جواو فليكس\n⇜ مركزه : مهاجم\n⇜ طاقة اللاعب : 82\n⇜ الجنسية : البرتغال 🇵🇹\n⇜ سعر اللاعب : 20000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/felixyes'},{text = 'لا', data = msg.sender_id.user_id..'/felixno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "45" then
msgplayer = "⇜ الاسم : محمد صلاح\n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : مصر 🇪🇬\n⇜ سعر اللاعب : 100000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/salahyes'},{text = 'لا', data = msg.sender_id.user_id..'/salahno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "46" then
msgplayer = "⇜ الاسم : نيمار \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 91\n⇜ الجنسية : البرازيل 🇧🇷\n⇜ سعر اللاعب : 100000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/neymaryes'},{text = 'لا', data = msg.sender_id.user_id..'/neymarno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "47" then
msgplayer = "⇜ الاسم : ساديو ماني \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 90\n⇜ الجنسية : السنغال 🇸🇳\n⇜ سعر اللاعب : 90000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/sadioyes'},{text = 'لا', data = msg.sender_id.user_id..'/sadiono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "48" then
msgplayer = "⇜ الاسم : رحيم ستيرليج \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/rehimyes'},{text = 'لا', data = msg.sender_id.user_id..'/rehimno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "49" then
msgplayer = "⇜ الاسم : يادون سانشو \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : إنجلترا 🏴󠁧󠁢󠁥󠁮󠁧󠁿\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/sanchoyes'},{text = 'لا', data = msg.sender_id.user_id..'/sanchono'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
elseif Descriptioont == "50" then
msgplayer = "⇜ الاسم : سون  \n⇜ مركزه : جناح\n⇜ طاقة اللاعب : 88\n⇜ الجنسية : كوريه الجنوبيه 🇰🇷\n⇜ سعر اللاعب : 80000 درهم 💵\n هل ترغب بشراء اللاعب ؟\n✧"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg.sender_id.user_id..'/sonyes'},{text = 'لا', data = msg.sender_id.user_id..'/sonno'},
},
}
}
send(msg.chat_id,msg.id,msgplayer,"md",false, false, false, false, reply_markup)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match('انشاء مزرعه (.*)') or text and text:match('انشاء مزرعة (.*)') or text and text:match('بناء مزرعة (.*)') or text and text:match('بناء مزرعه (.*)') then
 
local Cnamed = text:match('انشاء مزرعه (.*)') or text:match('انشاء مزرعة (.*)') or text:match('بناء مزرعة (.*)') or text:match('بناء مزرعه (.*)')
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
namefram = Redis:get(Thealhlfy.."namefram"..msg.sender_id.user_id)
if Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ لديك مزرعه مسبقاً ","md",true)
end
if Redis:sismember(Thealhlfy.."farmarname", Cnamed) then
return send(msg.chat_id,msg.id, "⇜ اسم المزرعه موجود مسبقاً\n⇜ اختر اسم اخر\n✧","md",true)
end
Redis:set(Thealhlfy.."namefram"..msg.sender_id.user_id, Cnamed)
ttshakse = '⇜ اختر مساحة المزرعة : 🛣\n✧'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '4×4', data = msg.sender_id.user_id..'/4×4'},{text = '6×6', data = msg.sender_id.user_id..'/6×6'},{text = '8×8', data = msg.sender_id.user_id..'/8×8'},
},
{
{text = '12×12', data = msg.sender_id.user_id..'/12×12'},{text = '16×16', data = msg.sender_id.user_id..'/16×16'},{text = '32×32', data = msg.sender_id.user_id..'/32×32'},
},
{
{text = 'Louis',url="t.me/Y88F8"}, 
},
}
}
return send(msg.chat_id,msg.id,ttshakse,"md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "توب مزارع" or text == "توب المزارع" then

local bank_users = Redis:smembers(Thealhlfy.."ownerfram")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد مزارع","md",true)
end
top_monyd = "⇜ توب اعلى 10 مزارع :\n\n"
mony_listd = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."toplvfarm"..v) or 0
table.insert(mony_listd, {tonumber(mony) , v})
end
table.sort(mony_listd, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)"
}
for k,v in pairs(mony_listd) do
if num <= 10 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local kk = Redis:get(Thealhlfy.."namefram"..v[2])
kk = kk:gsub("🇾🇪️",'')
kk = kk:gsub("🇹🇳",'')
kk = kk:gsub("🇸🇾",'')
kk = kk:gsub("🇸🇩",'')
kk = kk:gsub("🇸🇦",'')
kk = kk:gsub("🇶🇦",'')
kk = kk:gsub("🇵🇸",'')
kk = kk:gsub("🇴🇲",'')
kk = kk:gsub("🇲🇦",'')
kk = kk:gsub("🇱🇾",'')
kk = kk:gsub("🇱🇧",'')
kk = kk:gsub("🇰🇼️",'')
kk = kk:gsub("🇯🇴",'')
kk = kk:gsub("🇮🇶",'')
kk = kk:gsub("🇪🇬",'')
kk = kk:gsub("🇧🇭",'')
kk = kk:gsub("🇩🇿️",'')
kk = kk:gsub("🇦🇪",'')
kk = kk:gsub("@[%a%d_]+",'')
kk = kk:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Thealhlfy.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_monyd = top_monyd..emo.." "..gflos.."  l "..kk.." ( "..tt.." "..doltebank.." ) \n"
gg = " ━━━━━━━━━\n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_monyd..gg,"md",false, false, false, false, reply_markup)
end
if text == 'مزرعه' or text == 'مزرعة' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⌯ اهلا فيك بمزرعة لويس :\n\n⇜ المزروعات واسعارها :\n- بطاطا : 75 درهم 💵\n- بندوره : 100 درهم 💵\n- خس : 125 درهم 💵\n- خيار : 150 درهم 💵\n- جزر : 175 درهم 💵\n- فليفله : 200 درهم 💵\n- فريز : 300 درهم 💵\n- ذره : 400 درهم 💵\n- ثوم : 500 درهم 💵\n- فطر : 800 درهم 💵\n- شجره تفاح : 1000 درهم 💵\n- شجره عنب : 1250 درهم 💵\n-شجره زيتون : 1500 درهم 💵\n- شجره موز : 2000 درهم 💵\n- شجره مانجا : 3000 درهم 💵\n\n⇜ مثال طريقة الزراعه : \n- زراعه بطاطا 10\n- زراعه شجر موز 15\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه' or text == 'زراعة' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n- زراعه بندوره والعدد\n- زراعه خيار والعدد\n- زراعه فريز والعدد\n- زراعه فليفله والعدد\n- زراعه خس والعدد\n- زراعه جزر والعدد\n- زراعه بطاطا والعدد\n- زراعه شجر تفاح والعدد\n- زراعه شجر موز والعدد\n- زراعه شجر زيتون والعدد\n- زراعه شجر عنب والعدد\n\n⇜ مثال طريقة الزراعه : \n- زراعه بطاطا 10\n- زراعه شجر موز 15\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه بطاطا' or text == 'زراعة بطاطا' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه بطاطا` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه بندوره' or text == 'زراعة بندوره' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه بندوره` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه خس' or text == 'زراعة خس' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه خس` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه خيار' or text == 'زراعة خيار' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه خيار` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه جزر' or text == 'زراعة جزر' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه جزر` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه فليفله' or text == 'زراعة فليفله' or text == 'زراعه فليفلة' or text == 'زراعة فليفلة' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه فليفله` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه فريز' or text == 'زراعة فريز' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه فريز` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه ذره' or text == 'زراعة ذرة' or text == 'زراعة ذره' or text == 'زراعه ذرة' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه ذره` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه ثوم' or text == 'زراعة ثوم' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه ثوم` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه فطر' or text == 'زراعة فطر' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه فطر` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه شجر تفاح' or text == 'زراعة شجر تفاح' or text == 'زراعه شجره تفاح' or text == 'زراعة شجرة تفاح' or text == 'زراعه تفاح' or text == 'زراعة تفاح' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه شجر تفاح` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه شجر عنب' or text == 'زراعة شجر عنب' or text == 'زراعه شجره عنب' or text == 'زراعة شجرة عنب' or text == 'زراعه عنب' or text == 'زراعة عنب' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه شجر عنب` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه شجر زيتون' or text == 'زراعة شجر زيتون' or text == 'زراعه شجره زيتون' or text == 'زراعة شجرة زيتون' or text == 'زراعه زيتون' or text == 'زراعة زيتون' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه شجر زيتون` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه شجر موز' or text == 'زراعة شجر موز' or text == 'زراعه شجره موز' or text == 'زراعة شجرة موز' or text == 'زراعه موز' or text == 'زراعة موز' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه شجر موز` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زراعه شجر مانجا' or text == 'زراعة شجر مانجا' or text == 'زراعه شجره مانجا' or text == 'زراعة شجرة مانجا' or text == 'زراعه مانجا' or text == 'زراعة مانجا' then
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `زراعه شجر مانجا` والعدد","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح مزرعه' or text == 'مسح مزرعة' or text == 'مسح المزرعه' or text == 'مسح المزرعة' or text == 'مسح مزرعتي' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه اصلاً\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` ) والاسم","md",true)
end
namfra = Redis:get(Thealhlfy.."namefram"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."toplvfarm"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btatatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btatanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btataname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemontime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khesstime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khessnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khessname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."kheartime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khearnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khearname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzartime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflaname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freaztime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freaznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freazname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doratime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doranum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doraname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetontime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozztime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozzname"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mangatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."manganum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."manganame"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."sizefram"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."namefram"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mzroatsize"..msg.sender_id.user_id)
Redis:srem(Thealhlfy.."farmarname", namfra)
Redis:srem(Thealhlfy.."ownerfram",msg.sender_id.user_id)
send(msg.chat_id,msg.id, "⇜ تم مسح مزرعتك","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "مزرعتي" then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` ) والاسم","md",true)
end
local namefram = Redis:get(Thealhlfy.."namefram"..msg.sender_id.user_id)
local sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
local mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
local mazofxbh = tonumber(sizefram) - tonumber(mzroatsize)
local btatahours = Redis:ttl(Thealhlfy.."btatatime" .. msg.sender_id.user_id) / 60
local btatatime = Redis:get(Thealhlfy.."btatatime" .. msg.sender_id.user_id)
local btataname = Redis:get(Thealhlfy.."btataname"..msg.sender_id.user_id)
local btatanum = Redis:get(Thealhlfy.."btatanum"..msg.sender_id.user_id) or 0
if btataname and btatatime then
btatanamee = "🥔 "..btataname.." : ( `"..math.floor(btatanum).."` ) الوقت المتبقي "..math.floor(btatahours).." دقيقة\n"
elseif btataname then
btatanamee = "🥔 "..btataname.." : ( `"..math.floor(btatanum).."` ) جاهزة للحصد\n"
else
btatanamee = ""
end
local lemonhours = Redis:ttl(Thealhlfy.."lemontime" .. msg.sender_id.user_id) / 60
local lemontime = Redis:get(Thealhlfy.."lemontime" .. msg.sender_id.user_id)
local lemonname = Redis:get(Thealhlfy.."lemonname"..msg.sender_id.user_id)
local lemonnum = Redis:get(Thealhlfy.."lemonnum"..msg.sender_id.user_id) or 0
if lemonname and lemontime then
lemonnamee = "🍅 "..lemonname.." : ( `"..math.floor(lemonnum).."` ) الوقت المتبقي "..math.floor(lemonhours).." دقيقة\n"
elseif lemonname then
lemonnamee = "🍅 "..lemonname.." : ( `"..math.floor(lemonnum).."` ) جاهزة للحصد\n"
else
lemonnamee = ""
end
local khesshours = Redis:ttl(Thealhlfy.."khesstime" .. msg.sender_id.user_id) / 60
local khesstime = Redis:get(Thealhlfy.."khesstime" .. msg.sender_id.user_id)
local khessname = Redis:get(Thealhlfy.."khessname"..msg.sender_id.user_id)
local khessnum = Redis:get(Thealhlfy.."khessnum"..msg.sender_id.user_id) or 0
if khessname and khesstime then
khessnamee = "🥬 "..khessname.." : ( `"..math.floor(khessnum).."` ) الوقت المتبقي "..math.floor(khesshours).." دقيقة\n"
elseif khessname then
khessnamee = "🥬 "..khessname.." : ( `"..math.floor(khessnum).."` ) جاهز للحصد\n"
else
khessnamee = ""
end
local khearhours = Redis:ttl(Thealhlfy.."kheartime" .. msg.sender_id.user_id) / 60
local kheartime = Redis:get(Thealhlfy.."kheartime" .. msg.sender_id.user_id)
local khearname = Redis:get(Thealhlfy.."khearname"..msg.sender_id.user_id)
local khearnum = Redis:get(Thealhlfy.."khearnum"..msg.sender_id.user_id) or 0
if khearname and kheartime then
khearnamee = "🥒 "..khearname.." : ( `"..math.floor(khearnum).."` ) الوقت المتبقي "..math.floor(khearhours).." دقيقة\n"
elseif khearname then
khearnamee = "🥒 "..khearname.." : ( `"..math.floor(khearnum).."` ) جاهز للحصد\n"
else
khearnamee = ""
end
local jzarhours = Redis:ttl(Thealhlfy.."jzartime" .. msg.sender_id.user_id) / 60
local jzartime = Redis:get(Thealhlfy.."jzartime" .. msg.sender_id.user_id)
local jzarname = Redis:get(Thealhlfy.."jzarname"..msg.sender_id.user_id)
local jzarnum = Redis:get(Thealhlfy.."jzarnum"..msg.sender_id.user_id) or 0
if jzarname and jzartime then
jzarnamee = "🥕 "..jzarname.." : ( `"..math.floor(jzarnum).."` ) الوقت المتبقي "..math.floor(jzarhours).." دقيقة\n"
elseif jzarname then
jzarnamee = "🥕 "..jzarname.." : ( `"..math.floor(jzarnum).."` ) جاهز للحصد\n"
else
jzarnamee = ""
end
local fleflahours = Redis:ttl(Thealhlfy.."fleflatime" .. msg.sender_id.user_id) / 60
local fleflatime = Redis:get(Thealhlfy.."fleflatime" .. msg.sender_id.user_id)
local fleflaname = Redis:get(Thealhlfy.."fleflaname"..msg.sender_id.user_id)
local fleflanum = Redis:get(Thealhlfy.."fleflanum"..msg.sender_id.user_id) or 0
if fleflaname and fleflatime then
fleflanamee = "🫑 "..fleflaname.." : ( `"..math.floor(fleflanum).."` ) الوقت المتبقي "..math.floor(fleflahours).." دقيقة\n"
elseif fleflaname then
fleflanamee = "🫑 "..fleflaname.." : ( `"..math.floor(fleflanum).."` ) جاهزة للحصد\n"
else
fleflanamee = ""
end
local freazhours = Redis:ttl(Thealhlfy.."freaztime" .. msg.sender_id.user_id) / 60
local freaztime = Redis:get(Thealhlfy.."freaztime" .. msg.sender_id.user_id)
local freazname = Redis:get(Thealhlfy.."freazname"..msg.sender_id.user_id)
local freaznum = Redis:get(Thealhlfy.."freaznum"..msg.sender_id.user_id) or 0
if freazname and freaztime then
freaznamee = "🍓 "..freazname.." : ( `"..math.floor(freaznum).."` ) الوقت المتبقي "..math.floor(freazhours).." دقيقة\n"
elseif freazname then
freaznamee = "🍓 "..freazname.." : ( `"..math.floor(freaznum).."` ) جاهز للحصد\n"
else
freaznamee = ""
end
local dorahours = Redis:ttl(Thealhlfy.."doratime" .. msg.sender_id.user_id) / 60
local doratime = Redis:get(Thealhlfy.."doratime" .. msg.sender_id.user_id)
local doraname = Redis:get(Thealhlfy.."doraname"..msg.sender_id.user_id)
local doranum = Redis:get(Thealhlfy.."doranum"..msg.sender_id.user_id) or 0
if doraname and doratime then
doranamee = "🌽 "..doraname.." : ( `"..math.floor(doranum).."` ) الوقت المتبقي "..math.floor(dorahours).." دقيقة\n"
elseif doraname then
doranamee = "🌽 "..doraname.." : ( `"..math.floor(doranum).."` ) جاهز للحصد\n"
else
doranamee = ""
end
local tomhours = Redis:ttl(Thealhlfy.."tomtime" .. msg.sender_id.user_id) / 60
local tomtime = Redis:get(Thealhlfy.."tomtime" .. msg.sender_id.user_id)
local tomname = Redis:get(Thealhlfy.."tomname"..msg.sender_id.user_id)
local tomnum = Redis:get(Thealhlfy.."tomnum"..msg.sender_id.user_id) or 0
if tomname and tomtime then
tomnamee = "🧄 "..tomname.." : ( `"..math.floor(tomnum).."` ) الوقت المتبقي "..math.floor(tomhours).." دقيقة\n"
elseif tomname then
tomnamee = "🧄 "..tomname.." : ( `"..math.floor(tomnum).."` ) جاهز للحصد\n"
else
tomnamee = ""
end
local ftrhours = Redis:ttl(Thealhlfy.."ftrtime" .. msg.sender_id.user_id) / 60
local ftrtime = Redis:get(Thealhlfy.."ftrtime" .. msg.sender_id.user_id)
local ftrname = Redis:get(Thealhlfy.."ftrname"..msg.sender_id.user_id)
local ftrnum = Redis:get(Thealhlfy.."ftrnum"..msg.sender_id.user_id) or 0
if ftrname and ftrtime then
ftrnamee = "🍄 "..ftrname.." : ( `"..math.floor(ftrnum).."` ) الوقت المتبقي "..math.floor(ftrhours).." دقيقة\n"
elseif ftrname then
ftrnamee = "🍄 "..ftrname.." : ( `"..math.floor(ftrnum).."` ) جاهز للحصد\n"
else
ftrnamee = ""
end
local tfahhours = Redis:ttl(Thealhlfy.."tfahtime" .. msg.sender_id.user_id) / 60
local tfahtime = Redis:get(Thealhlfy.."tfahtime" .. msg.sender_id.user_id)
local tfahname = Redis:get(Thealhlfy.."tfahname"..msg.sender_id.user_id)
local tfahnum = Redis:get(Thealhlfy.."tfahnum"..msg.sender_id.user_id) or 0
if tfahname and tfahtime then
tfahnamee = "🍏 "..tfahname.." : ( `"..math.floor(tfahnum).."` ) الوقت المتبقي "..math.floor(tfahhours).." دقيقة\n"
elseif tfahname then
tfahnamee = "🍏 "..tfahname.." : ( `"..math.floor(tfahnum).."` ) جاهز للحصد\n"
else
tfahnamee = ""
end
local enabhours = Redis:ttl(Thealhlfy.."enabtime" .. msg.sender_id.user_id) / 60
local enabtime = Redis:get(Thealhlfy.."enabtime" .. msg.sender_id.user_id)
local enabname = Redis:get(Thealhlfy.."enabname"..msg.sender_id.user_id)
local enabnum = Redis:get(Thealhlfy.."enabnum"..msg.sender_id.user_id) or 0
if enabname and enabtime then
enabnamee = "🍇 "..enabname.." : ( `"..math.floor(enabnum).."` ) الوقت المتبقي "..math.floor(enabhours).." دقيقة\n"
elseif enabname then
enabnamee = "🍇 "..enabname.." : ( `"..math.floor(enabnum).."` ) جاهز للحصد\n"
else
enabnamee = ""
end
local zetonhours = Redis:ttl(Thealhlfy.."zetontime" .. msg.sender_id.user_id) / 60
local zetontime = Redis:get(Thealhlfy.."zetontime" .. msg.sender_id.user_id)
local zetonname = Redis:get(Thealhlfy.."zetonname"..msg.sender_id.user_id)
local zetonnum = Redis:get(Thealhlfy.."zetonnum"..msg.sender_id.user_id) or 0
if zetonname and zetontime then
zetonnamee = "🫒 "..zetonname.." : ( `"..math.floor(zetonnum).."` ) الوقت المتبقي "..math.floor(zetonhours).." دقيقة\n"
elseif zetonname then
zetonnamee = "🫒 "..zetonname.." : ( `"..math.floor(zetonnum).."` ) جاهز للحصد\n"
else
zetonnamee = ""
end
local mozzhours = Redis:ttl(Thealhlfy.."mozztime" .. msg.sender_id.user_id) / 60
local mozztime = Redis:get(Thealhlfy.."mozztime" .. msg.sender_id.user_id)
local mozzname = Redis:get(Thealhlfy.."mozzname"..msg.sender_id.user_id)
local mozznum = Redis:get(Thealhlfy.."mozznum"..msg.sender_id.user_id) or 0
if mozzname and mozztime then
mozznamee = "🍌 "..mozzname.." : ( `"..math.floor(mozznum).."` ) الوقت المتبقي "..math.floor(mozzhours).." دقيقة\n"
elseif mozzname then
mozznamee = "🍌 "..mozzname.." : ( `"..math.floor(mozznum).."` ) جاهز للحصد\n"
else
mozznamee = ""
end
local mangahours = Redis:ttl(Thealhlfy.."mangatime" .. msg.sender_id.user_id) / 60
local mangatime = Redis:get(Thealhlfy.."mangatime" .. msg.sender_id.user_id)
local manganame = Redis:get(Thealhlfy.."manganame"..msg.sender_id.user_id)
local manganum = Redis:get(Thealhlfy.."manganum"..msg.sender_id.user_id) or 0
if manganame and mangatime then
manganamee = "🥭 "..manganame.." : ( `"..math.floor(manganum).."` ) الوقت المتبقي "..math.floor(mangahours).." دقيقة\n"
elseif manganame then
manganamee = "🥭 "..manganame.." : ( `"..math.floor(manganum).."` ) جاهز للحصد\n"
else
manganamee = ""
end
if btatanum == 0 and lemonnum == 0 and khessnum == 0 and khearnum == 0 and jzarnum == 0 and fleflanum == 0 and freaznum == 0 and doranum == 0 and tomnum == 0 and ftrnum == 0 and tfahnum == 0 and enabnum == 0 and zetonnum == 0 and mozznum == 0 and manganum == 0 then
send(msg.chat_id,msg.id, "⇜ اسم مزرعتك 🏕 : "..namefram.."\n⇜ مساحة المزرعة المتبقية : "..mazofxbh.." متر\n\n⇜ لا يوجد مزروعات\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ اسم مزرعتك 🏕 : "..namefram.."\n⇜ مساحة المزرعة المتبقية : "..mazofxbh.." متر\n\n⇜ مزروعاتك :\n"..btatanamee..""..lemonnamee..""..khessnamee..""..khearnamee..""..jzarnamee..""..fleflanamee..""..freaznamee..""..doranamee..""..tomnamee..""..ftrnamee..""..tfahnamee..""..enabnamee..""..zetonnamee..""..mozznamee..""..manganamee.."\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه بطاطا (.*)$') or text and text:match('^زراعة بطاطا (.*)$') then

local UserName = text:match('^زراعه بطاطا (.*)$') or text:match('^زراعة بطاطا (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."btatatime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."btatatime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة بطاطا قبل 🥔\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصادها\n- طريقة الحصاد بالامر : `حصد بطاطا`","md",true)
end
if Redis:get(Thealhlfy.."btatanum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة بطاطا قبل 🥔\n⇜ قم بحصادها اولاً\n- طريقة الحصاد بالامر : `حصد بطاطا`","md",true)
end
kajwha = tonumber(coniss) * 0.7
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
btata = tonumber(coniss) * 75
if tonumber(ballance) < tonumber(btata) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."btatanum"..msg.sender_id.user_id , coniss)
btataname = "بطاطا"
Redis:set(Thealhlfy.."btataname"..msg.sender_id.user_id , btataname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
btatasize = tonumber(coniss) * 0.7
btatasizee = btatasize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(btatasizee))
totalypalice = tonumber(ballance) - tonumber(btata)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."btatatime"..msg.sender_id.user_id,1220, true)
local convert_mony = string.format("%.0f",math.floor(btata))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة بطاطا 🥔\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 20 دقيقة ⏳️ ثم قم بحصادها\n- الامر ( `حصد بطاطا` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه بندوره (.*)$') or text and text:match('^زراعة بندوره (.*)$') then

local UserName = text:match('^زراعه بندوره (.*)$') or text:match('^زراعة بندوره (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."lemontime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."lemontime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة بندوره قبل 🍅\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد بندوره`","md",true)
end
if Redis:get(Thealhlfy.."lemonnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة بندوره قبل 🍅\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد بندوره`","md",true)
end
kajwha = tonumber(coniss) * 1
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
lemon = tonumber(coniss) * 100
if tonumber(ballance) < tonumber(lemon) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."lemonnum"..msg.sender_id.user_id , coniss)
lemonname = "بندوره"
Redis:set(Thealhlfy.."lemonname"..msg.sender_id.user_id , lemonname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
lemonsize = tonumber(coniss) * 1
lemonsizee = lemonsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(lemonsizee))
totalypalice = tonumber(ballance) - tonumber(lemon)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."lemontime"..msg.sender_id.user_id,1520, true)
local convert_mony = string.format("%.0f",math.floor(lemon))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة بندوره 🍅\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 25 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد بندوره` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه خس (.*)$') or text and text:match('^زراعة خس (.*)$') then

local UserName = text:match('^زراعه خس (.*)$') or text:match('^زراعة خس (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."khesstime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."khesstime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة خس قبل 🥬\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصادها\n- طريقة الحصاد بالامر : `حصد خس`","md",true)
end
if Redis:get(Thealhlfy.."khessnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة خس قبل 🥬\n⇜ قم بحصادها اولاً\n- طريقة الحصاد بالامر : `حصد خس`","md",true)
end
kajwha = tonumber(coniss) * 1.2
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
khess = tonumber(coniss) * 125
if tonumber(ballance) < tonumber(khess) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."khessnum"..msg.sender_id.user_id , coniss)
khessname = "خس"
Redis:set(Thealhlfy.."khessname"..msg.sender_id.user_id , khessname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
khesssize = tonumber(coniss) * 1.2
khesssizee = khesssize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(khesssizee))
totalypalice = tonumber(ballance) - tonumber(khess)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."khesstime"..msg.sender_id.user_id,1800, true)
local convert_mony = string.format("%.0f",math.floor(khess))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة خس 🥬\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 30 دقيقة ⏳️ ثم قم بحصادها\n- الامر ( `حصد خس` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه خيار (.*)$') or text and text:match('^زراعة خيار (.*)$') then

local UserName = text:match('^زراعه خيار (.*)$') or text:match('^زراعة خيار (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."kheartime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."kheartime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة خيار قبل 🥒\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد خيار`","md",true)
end
if Redis:get(Thealhlfy.."khearnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة خيار قبل 🥒\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد خيار`","md",true)
end
kajwha = tonumber(coniss) * 1.5
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
khear = tonumber(coniss) * 150
if tonumber(ballance) < tonumber(khear) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."khearnum"..msg.sender_id.user_id , coniss)
khearname = "خيار"
Redis:set(Thealhlfy.."khearname"..msg.sender_id.user_id , khearname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
khearsize = tonumber(coniss) * 1.5
khearsizee = khearsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(khearsizee))
totalypalice = tonumber(ballance) - tonumber(khear)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."kheartime"..msg.sender_id.user_id,2120, true)
local convert_mony = string.format("%.0f",math.floor(khear))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة خيار 🥒\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 35 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد خيار` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه جزر (.*)$') or text and text:match('^زراعة جزر (.*)$') then

local UserName = text:match('^زراعه جزر (.*)$') or text:match('^زراعة جزر (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."jzartime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."jzartime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة جزر قبل 🥕\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد جزر`","md",true)
end
if Redis:get(Thealhlfy.."jzarnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة جزر قبل 🥕\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد جزر`","md",true)
end
kajwha = tonumber(coniss) * 1.7
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
jzar = tonumber(coniss) * 175
if tonumber(ballance) < tonumber(jzar) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."jzarnum"..msg.sender_id.user_id , coniss)
jzarname = "جزر"
Redis:set(Thealhlfy.."jzarname"..msg.sender_id.user_id , jzarname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
jzarsize = tonumber(coniss) * 1.7
jzarsizee = jzarsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(jzarsizee))
totalypalice = tonumber(ballance) - tonumber(jzar)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."jzartime"..msg.sender_id.user_id,2420, true)
local convert_mony = string.format("%.0f",math.floor(jzar))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة جزر 🥕\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 40 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد جزر` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه فليفله (.*)$') or text and text:match('^زراعة فليفله (.*)$') then

local UserName = text:match('^زراعه فليفله (.*)$') or text:match('^زراعة فليفله (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."fleflatime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."fleflatime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة فليفله قبل 🫑\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصادها\n- طريقة الحصاد بالامر : `حصد فليفله`","md",true)
end
if Redis:get(Thealhlfy.."fleflanum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة فليفله قبل 🫑\n⇜ قم بحصادها اولاً\n- طريقة الحصاد بالامر : `حصد فليفله`","md",true)
end
kajwha = tonumber(coniss) * 2
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
flefla = tonumber(coniss) * 200
if tonumber(ballance) < tonumber(flefla) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."fleflanum"..msg.sender_id.user_id , coniss)
fleflaname = "فليفله"
Redis:set(Thealhlfy.."fleflaname"..msg.sender_id.user_id , fleflaname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
fleflasize = tonumber(coniss) * 2
fleflasizee = fleflasize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(fleflasizee))
totalypalice = tonumber(ballance) - tonumber(flefla)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."fleflatime"..msg.sender_id.user_id,2720, true)
local convert_mony = string.format("%.0f",math.floor(flefla))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة فليفله 🫑\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 45 دقيقة ⏳️ ثم قم بحصادها\n- الامر ( `حصد فليفله` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه فريز (.*)$') or text and text:match('^زراعة فريز (.*)$') then

local UserName = text:match('^زراعه فريز (.*)$') or text:match('^زراعة فريز (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."freaztime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."freaztime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة فريز قبل 🍓\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد فريز`","md",true)
end
if Redis:get(Thealhlfy.."freaznum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة فريز قبل 🍓\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد فريز`","md",true)
end
kajwha = tonumber(coniss) * 3
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
freaz = tonumber(coniss) * 300
if tonumber(ballance) < tonumber(freaz) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."freaznum"..msg.sender_id.user_id , coniss)
freazname = "فريز"
Redis:set(Thealhlfy.."freazname"..msg.sender_id.user_id , freazname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
freazsize = tonumber(coniss) * 3
freazsizee = freazsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(freazsizee))
totalypalice = tonumber(ballance) - tonumber(freaz)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."freaztime"..msg.sender_id.user_id,3020, true)
local convert_mony = string.format("%.0f",math.floor(freaz))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة فريز 🍓\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 50 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد فريز` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه ذره (.*)$') or text and text:match('^زراعة ذره (.*)$') or text and text:match('^زراعه ذرة (.*)$') or text and text:match('^زراعة ذرة (.*)$') then

local UserName = text:match('^زراعه ذره (.*)$') or text:match('^زراعة ذره (.*)$') or text:match('^زراعه ذرة (.*)$') or text:match('^زراعة ذرة (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."doratime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."doratime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة ذره قبل 🌽\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد ذره`","md",true)
end
if Redis:get(Thealhlfy.."doranum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة ذره قبل 🌽\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد ذره`","md",true)
end
kajwha = tonumber(coniss) * 4
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
dora = tonumber(coniss) * 400
if tonumber(ballance) < tonumber(dora) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."doranum"..msg.sender_id.user_id , coniss)
doraname = "ذره"
Redis:set(Thealhlfy.."doraname"..msg.sender_id.user_id , doraname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
dorasize = tonumber(coniss) * 4
dorasizee = dorasize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(dorasizee))
totalypalice = tonumber(ballance) - tonumber(dora)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."doratime"..msg.sender_id.user_id,3320, true)
local convert_mony = string.format("%.0f",math.floor(dora))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة ذره 🌽\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 55 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد ذره` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه ثوم (.*)$') or text and text:match('^زراعة ثوم (.*)$') then

local UserName = text:match('^زراعه ثوم (.*)$') or text:match('^زراعة ثوم (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."tomtime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."tomtime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة ثوم قبل 🧄\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد ثوم`","md",true)
end
if Redis:get(Thealhlfy.."tomnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة ثوم قبل 🧄\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد ثوم`","md",true)
end
kajwha = tonumber(coniss) * 5
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
tom = tonumber(coniss) * 500
if tonumber(ballance) < tonumber(tom) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."tomnum"..msg.sender_id.user_id , coniss)
tomname = "ثوم"
Redis:set(Thealhlfy.."tomname"..msg.sender_id.user_id , tomname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
tomsize = tonumber(coniss) * 5
tomsizee = tomsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(tomsizee))
totalypalice = tonumber(ballance) - tonumber(tom)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."tomtime"..msg.sender_id.user_id,3620, true)
local convert_mony = string.format("%.0f",math.floor(tom))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة ثوم 🧄\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 60 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد ثوم` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه فطر (.*)$') or text and text:match('^زراعة فطر (.*)$') then

local UserName = text:match('^زراعه فطر (.*)$') or text:match('^زراعة فطر (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."ftrtime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."ftrtime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة فطر قبل 🍄\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد فطر`","md",true)
end
if Redis:get(Thealhlfy.."ftrnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة فطر قبل 🍄\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد فطر`","md",true)
end
kajwha = tonumber(coniss) * 6
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
ftr = tonumber(coniss) * 600
if tonumber(ballance) < tonumber(ftr) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."ftrnum"..msg.sender_id.user_id , coniss)
ftrname = "فطر"
Redis:set(Thealhlfy.."ftrname"..msg.sender_id.user_id , ftrname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
ftrsize = tonumber(coniss) * 6
ftrsizee = ftrsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(ftrsizee))
totalypalice = tonumber(ballance) - tonumber(ftr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."ftrtime"..msg.sender_id.user_id,4220, true)
local convert_mony = string.format("%.0f",math.floor(ftr))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة فطر 🍄\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 70 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد فطر` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه شجر تفاح (.*)$') or text and text:match('^زراعة شجر تفاح (.*)$') then

local UserName = text:match('^زراعه شجر تفاح (.*)$') or text:match('^زراعة شجر تفاح (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."tfahtime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."tfahtime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة شجر تفاح قبل 🍏\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد شجر تفاح`","md",true)
end
if Redis:get(Thealhlfy.."tfahnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة شجر تفاح قبل 🍏\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد شجر تفاح`","md",true)
end
kajwha = tonumber(coniss) * 10
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
tfah = tonumber(coniss) * 1000
if tonumber(ballance) < tonumber(tfah) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."tfahnum"..msg.sender_id.user_id , coniss)
tfahname = "تفاح"
Redis:set(Thealhlfy.."tfahname"..msg.sender_id.user_id , tfahname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
tfahsize = tonumber(coniss) * 10
tfahsizee = tfahsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(tfahsizee))
totalypalice = tonumber(ballance) - tonumber(tfah)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."tfahtime"..msg.sender_id.user_id,5420, true)
local convert_mony = string.format("%.0f",math.floor(tfah))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة شجر تفاح 🍏\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 90 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد شجر تفاح` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه شجر عنب (.*)$') or text and text:match('^زراعة شجر عنب (.*)$') then

local UserName = text:match('^زراعه شجر عنب (.*)$') or text:match('^زراعة شجر عنب (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."enabtime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."enabtime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة شجر عنب قبل 🍇\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد شجر عنب`","md",true)
end
if Redis:get(Thealhlfy.."enabnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة شجر عنب قبل 🍇\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد شجر عنب`","md",true)
end
kajwha = tonumber(coniss) * 12.5
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
enab = tonumber(coniss) * 1250
if tonumber(ballance) < tonumber(enab) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."enabnum"..msg.sender_id.user_id , coniss)
enabname = "عنب"
Redis:set(Thealhlfy.."enabname"..msg.sender_id.user_id , enabname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
enabsize = tonumber(coniss) * 12.5
enabsizee = enabsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(enabsizee))
totalypalice = tonumber(ballance) - tonumber(enab)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."enabtime"..msg.sender_id.user_id,6020, true)
local convert_mony = string.format("%.0f",math.floor(enab))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة شجر عنب 🍇\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 100 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد شجر عنب` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه شجر زيتون (.*)$') or text and text:match('^زراعة شجر زيتون (.*)$') then

local UserName = text:match('^زراعه شجر زيتون (.*)$') or text:match('^زراعة شجر زيتون (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."zetontime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."zetontime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة شجر زيتون قبل 🫒\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد شجر زيتون`","md",true)
end
if Redis:get(Thealhlfy.."zetonnum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة شجر زيتون قبل 🫒\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد شجر زيتون`","md",true)
end
kajwha = tonumber(coniss) * 15
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
zeton = tonumber(coniss) * 1500
if tonumber(ballance) < tonumber(zeton) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."zetonnum"..msg.sender_id.user_id , coniss)
zetonname = "زيتون"
Redis:set(Thealhlfy.."zetonname"..msg.sender_id.user_id , zetonname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
zetonsize = tonumber(coniss) * 15
zetonsizee = zetonsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(zetonsizee))
totalypalice = tonumber(ballance) - tonumber(zeton)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."zetontime"..msg.sender_id.user_id,7220, true)
local convert_mony = string.format("%.0f",math.floor(zeton))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة شجر زيتون 🫒\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 120 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد شجر زيتون` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه شجر موز (.*)$') or text and text:match('^زراعة شجر موز (.*)$') then

local UserName = text:match('^زراعه شجر موز (.*)$') or text:match('^زراعة شجر موز (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."mozztime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."mozztime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة شجر موز قبل 🍌\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد شجر موز`","md",true)
end
if Redis:get(Thealhlfy.."mozznum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة شجر موز قبل 🍌\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد شجر موز`","md",true)
end
kajwha = tonumber(coniss) * 20
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
mozz = tonumber(coniss) * 2000
if tonumber(ballance) < tonumber(mozz) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."mozznum"..msg.sender_id.user_id , coniss)
mozzname = "موز"
Redis:set(Thealhlfy.."mozzname"..msg.sender_id.user_id , mozzname)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mozzsize = tonumber(coniss) * 20
mozzsizee = mozzsize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(mozzsizee))
totalypalice = tonumber(ballance) - tonumber(mozz)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."mozztime"..msg.sender_id.user_id,8420, true)
local convert_mony = string.format("%.0f",math.floor(mozz))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة شجر موز 🍌\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 140 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد شجر موز` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^زراعه شجر مانجا (.*)$') or text and text:match('^زراعة شجر مانجا (.*)$') then

local UserName = text:match('^زراعه شجر مانجا (.*)$') or text:match('^زراعة شجر مانجا (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if Redis:get(Thealhlfy.."mangatime" .. msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."mangatime" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ زرعة شجر مانجا قبل 🥭\n⇜ استنى "..math.floor(hours).." دقيقة ⏳️ ثم قم بحصاده\n- طريقة الحصاد بالامر : `حصد شجر مانجا`","md",true)
end
if Redis:get(Thealhlfy.."manganum" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ زرعة شجر مانجا قبل 🥭\n⇜ قم بحصاده اولاً\n- طريقة الحصاد بالامر : `حصد شجر مانجا`","md",true)
end
kajwha = tonumber(coniss) * 30
sizefram = Redis:get(Thealhlfy.."sizefram"..msg.sender_id.user_id)
if tonumber(kajwha) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mzroatsizee = tonumber(mzroatsize) + tonumber(kajwha)
if tonumber(mzroatsizee) > tonumber(sizefram) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري مساحة ارضك ماتكفي","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
manga = tonumber(coniss) * 3000
if tonumber(ballance) < tonumber(manga) then
return send(msg.chat_id,msg.id, "⇜ مايمديك تشتري فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."manganum"..msg.sender_id.user_id , coniss)
manganame = "مانجا"
Redis:set(Thealhlfy.."manganame"..msg.sender_id.user_id , manganame)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mangasize = tonumber(coniss) * 30
mangasizee = mangasize + mzroatsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(mangasizee))
totalypalice = tonumber(ballance) - tonumber(manga)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(totalypalice))
Redis:setex(Thealhlfy.."mangatime"..msg.sender_id.user_id,10220, true)
local convert_mony = string.format("%.0f",math.floor(manga))
toplvfarm = Redis:get(Thealhlfy.."toplvfarm"..msg.sender_id.user_id) or 0
toplvfarmm = tonumber(toplvfarm) + tonumber(coniss)
Redis:set(Thealhlfy.."toplvfarm"..msg.sender_id.user_id , toplvfarmm)
send(msg.chat_id,msg.id, "⇜ زرعة شجر مانجا 🥭\n⇜ العدد : "..math.floor(coniss).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ استنى 180 دقيقة ⏳️ ثم قم بحصاده\n- الامر ( `حصد شجر مانجا` )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'حصد بطاطا' or text == 'حصاد بطاطا' or text == 'حصد البطاطا' or text == 'حصاد البطاطا' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."btatanum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات بطاطا 🥔\n⇜ تستطيع زراعتها بالامر ( `زراعه بطاطا` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."btatatime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."btatatime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم تنضج البطاطا بمزرعتك 🥔\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
btatanum = Redis:get(Thealhlfy.."btatanum"..msg.sender_id.user_id)
btata = tonumber(btatanum) * 100
btataa = tonumber(ballance) + tonumber(btata)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(btataa))
local convert_mony = string.format("%.0f",math.floor(btata))
local convert_monyy = string.format("%.0f",math.floor(btataa))
send(msg.chat_id,msg.id, "⇜ تم حصاد البطاطا 🥔\n⇜ العدد : "..math.floor(btatanum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
btatasize = tonumber(btatanum) * 0.7
btatasizee = mzroatsize - btatasize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(btatasizee))
Redis:del(Thealhlfy.."btatatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btatanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."btataname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد بندوره' or text == 'حصاد بندوره' or text == 'حصد البندوره' or text == 'حصاد البندوره' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."lemonnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات بندوره 🍅\n⇜ تستطيع زراعتها بالامر ( `زراعه بندوره` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."lemontime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."lemontime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج البندوره بمزرعتك 🍅\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
lemonnum = Redis:get(Thealhlfy.."lemonnum"..msg.sender_id.user_id)
lemon = tonumber(lemonnum) * 150
lemona = tonumber(ballance) + tonumber(lemon)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(lemona))
local convert_mony = string.format("%.0f",math.floor(lemon))
local convert_monyy = string.format("%.0f",math.floor(lemona))
send(msg.chat_id,msg.id, "⇜ تم حصاد البندوره 🍅\n⇜ العدد : "..math.floor(lemonnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
lemonsize = tonumber(lemonnum) * 1
lemonsizee = mzroatsize - lemonsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(lemonsizee))
Redis:del(Thealhlfy.."lemontime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."lemonname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد خس' or text == 'حصاد خس' or text == 'حصد الخس' or text == 'حصاد الخس' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."khessnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات خس 🥬\n⇜ تستطيع زراعتها بالامر ( `زراعه خس` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."khesstime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."khesstime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الخس بمزرعتك 🥬\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
khessnum = Redis:get(Thealhlfy.."khessnum"..msg.sender_id.user_id)
khess = tonumber(khessnum) * 200
khessa = tonumber(ballance) + tonumber(khess)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(khessa))
local convert_mony = string.format("%.0f",math.floor(khess))
local convert_monyy = string.format("%.0f",math.floor(khessa))
send(msg.chat_id,msg.id, "⇜ تم حصاد الخس 🥬\n⇜ العدد : "..math.floor(khessnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
khesssize = tonumber(khessnum) * 1.2
khesssizee = mzroatsize - khesssize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(khesssizee))
Redis:del(Thealhlfy.."khesstime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khessnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khessname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد خيار' or text == 'حصاد خيار' or text == 'حصد الخيار' or text == 'حصاد الخيار' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."khearnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات خيار 🥒\n⇜ تستطيع زراعتها بالامر ( `زراعه خيار` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."kheartime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."kheartime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الخيار بمزرعتك 🥒\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
khearnum = Redis:get(Thealhlfy.."khearnum"..msg.sender_id.user_id)
khear = tonumber(khearnum) * 250
kheara = tonumber(ballance) + tonumber(khear)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(kheara))
local convert_mony = string.format("%.0f",math.floor(khear))
local convert_monyy = string.format("%.0f",math.floor(kheara))
send(msg.chat_id,msg.id, "⇜ تم حصاد الخيار 🥒\n⇜ العدد : "..math.floor(khearnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
khearsize = tonumber(khearnum) * 1.5
khearsizee = mzroatsize - khearsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(khearsizee))
Redis:del(Thealhlfy.."kheartime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khearnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."khearname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد جزر' or text == 'حصاد جزر' or text == 'حصد الجزر' or text == 'حصاد الجزر' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."jzarnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات جزر 🥕\n⇜ تستطيع زراعتها بالامر ( `زراعه جزر` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."jzartime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."jzartime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الجزر بمزرعتك 🥕\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
jzarnum = Redis:get(Thealhlfy.."jzarnum"..msg.sender_id.user_id)
jzar = tonumber(jzarnum) * 300
jzara = tonumber(ballance) + tonumber(jzar)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(jzara))
local convert_mony = string.format("%.0f",math.floor(jzar))
local convert_monyy = string.format("%.0f",math.floor(jzara))
send(msg.chat_id,msg.id, "⇜ تم حصاد الجزر 🥕\n⇜ العدد : "..math.floor(jzarnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
jzarsize = tonumber(jzarnum) * 1.7
jzarsizee = mzroatsize - jzarsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(jzarsizee))
Redis:del(Thealhlfy.."jzartime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."jzarname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد فليفله' or text == 'حصاد فليفله' or text == 'حصد الفليفله' or text == 'حصاد الفليفله' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."fleflanum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات فليفله 🫑\n⇜ تستطيع زراعتها بالامر ( `زراعه فليفله` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."fleflatime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."fleflatime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم تنضج الفليفله بمزرعتك 🫑\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
fleflanum = Redis:get(Thealhlfy.."fleflanum"..msg.sender_id.user_id)
flefla = tonumber(fleflanum) * 350
fleflaa = tonumber(ballance) + tonumber(flefla)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(fleflaa))
local convert_mony = string.format("%.0f",math.floor(flefla))
local convert_monyy = string.format("%.0f",math.floor(fleflaa))
send(msg.chat_id,msg.id, "⇜ تم حصاد الفليفله 🫑\n⇜ العدد : "..math.floor(fleflanum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
fleflasize = tonumber(fleflanum) * 2
fleflasizee = mzroatsize - fleflasize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(fleflasizee))
Redis:del(Thealhlfy.."fleflatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflanum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."fleflaname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد فريز' or text == 'حصاد فريز' or text == 'حصد الفريز' or text == 'حصاد الفريز' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."freaznum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات فريز 🍓\n⇜ تستطيع زراعتها بالامر ( `زراعه فريز` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."freaztime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."freaztime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الفريز بمزرعتك 🍓\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
freaznum = Redis:get(Thealhlfy.."freaznum"..msg.sender_id.user_id)
freaz = tonumber(freaznum) * 475
freaza = tonumber(ballance) + tonumber(freaz)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(freaza))
local convert_mony = string.format("%.0f",math.floor(freaz))
local convert_monyy = string.format("%.0f",math.floor(freaza))
send(msg.chat_id,msg.id, "⇜ تم حصاد الفريز 🍓\n⇜ العدد : "..math.floor(freaznum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
freazsize = tonumber(freaznum) * 3
freazsizee = mzroatsize - freazsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(freazsizee))
Redis:del(Thealhlfy.."freaztime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freaznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."freazname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد ذره' or text == 'حصاد ذره' or text == 'حصد ذرة' or text == 'حصاد ذرة' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."doranum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات ذره 🌽\n⇜ تستطيع زراعتها بالامر ( `زراعه ذره` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."doratime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."doratime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الذره بمزرعتك 🌽\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
doranum = Redis:get(Thealhlfy.."doranum"..msg.sender_id.user_id)
dora = tonumber(doranum) * 600
doraa = tonumber(ballance) + tonumber(dora)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(doraa))
local convert_mony = string.format("%.0f",math.floor(dora))
local convert_monyy = string.format("%.0f",math.floor(doraa))
send(msg.chat_id,msg.id, "⇜ تم حصاد الذره 🌽\n⇜ العدد : "..math.floor(doranum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
dorasize = tonumber(doranum) * 4
dorasizee = mzroatsize - dorasize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(dorasizee))
Redis:del(Thealhlfy.."doratime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doranum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."doraname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد ثوم' or text == 'حصاد ثوم' or text == 'حصد الثوم' or text == 'حصاد الثوم' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."tomnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات ثوم 🧄\n⇜ تستطيع زراعتها بالامر ( `زراعه ثوم` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."tomtime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."tomtime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الثوم بمزرعتك 🧄\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
tomnum = Redis:get(Thealhlfy.."tomnum"..msg.sender_id.user_id)
tom = tonumber(tomnum) * 725
toma = tonumber(ballance) + tonumber(tom)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(toma))
local convert_mony = string.format("%.0f",math.floor(tom))
local convert_monyy = string.format("%.0f",math.floor(toma))
send(msg.chat_id,msg.id, "⇜ تم حصاد الثوم 🧄\n⇜ العدد : "..math.floor(tomnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
tomsize = tonumber(tomnum) * 5
tomsizee = mzroatsize - tomsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(tomsizee))
Redis:del(Thealhlfy.."tomtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tomname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد فطر' or text == 'حصاد فطر' or text == 'حصد الفطر' or text == 'حصاد الفطر' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."ftrnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك مزروعات فطر 🍄\n⇜ تستطيع زراعتها بالامر ( `زراعه فطر` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."ftrtime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."ftrtime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الفطر بمزرعتك 🍄\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
ftrnum = Redis:get(Thealhlfy.."ftrnum"..msg.sender_id.user_id)
ftr = tonumber(ftrnum) * 800
ftra = tonumber(ballance) + tonumber(ftr)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(ftra))
local convert_mony = string.format("%.0f",math.floor(ftr))
local convert_monyy = string.format("%.0f",math.floor(ftra))
send(msg.chat_id,msg.id, "⇜ تم حصاد الفطر 🍄\n⇜ العدد : "..math.floor(ftrnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
ftrsize = tonumber(ftrnum) * 6
ftrsizee = mzroatsize - ftrsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(ftrsizee))
Redis:del(Thealhlfy.."ftrtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."ftrname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد شجر تفاح' or text == 'حصد شجر التفاح' or text == 'حصد شجره تفاح' or text == 'حصد شجره التفاح' or text == 'حصد شجرة التفاح' or text == 'حصد شجرة تفاح' or text == 'حصاد شجر تفاح' or text == 'حصاد شجر التفاح' or text == 'حصاد شجره تفاح' or text == 'حصاد شجره التفاح' or text == 'حصاد شجرة التفاح' or text == 'حصاد شجرة تفاح' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."tfahnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك شجر تفاح 🍏\n⇜ تستطيع زراعتها بالامر ( `زراعه شجر تفاح` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."tfahtime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."tfahtime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج التفاح بمزرعتك 🍏\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
tfahnum = Redis:get(Thealhlfy.."tfahnum"..msg.sender_id.user_id)
tfah = tonumber(tfahnum) * 1200
tfaha = tonumber(ballance) + tonumber(tfah)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(tfaha))
local convert_mony = string.format("%.0f",math.floor(tfah))
local convert_monyy = string.format("%.0f",math.floor(tfaha))
send(msg.chat_id,msg.id, "⇜ تم حصاد شجر التفاح 🍏\n⇜ العدد : "..math.floor(tfahnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
tfahsize = tonumber(tfahnum) * 10
tfahsizee = mzroatsize - tfahsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(tfahsizee))
Redis:del(Thealhlfy.."tfahtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."tfahname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد شجر عنب' or text == 'حصد شجر العنب' or text == 'حصد شجره عنب' or text == 'حصد شجره العنب' or text == 'حصد شجرة العنب' or text == 'حصد شجرة عنب' or text == 'حصاد شجر عنب' or text == 'حصاد شجر العنب' or text == 'حصاد شجره عنب' or text == 'حصاد شجره العنب' or text == 'حصاد شجرة العنب' or text == 'حصاد شجرة عنب' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."enabnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك شجر عنب 🍇\n⇜ تستطيع زراعتها بالامر ( `زراعه شجر عنب` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."enabtime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."enabtime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج العنب بمزرعتك 🍇\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
enabnum = Redis:get(Thealhlfy.."enabnum"..msg.sender_id.user_id)
enab = tonumber(enabnum) * 1500
enaba = tonumber(ballance) + tonumber(enab)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(enaba))
local convert_mony = string.format("%.0f",math.floor(enab))
local convert_monyy = string.format("%.0f",math.floor(enaba))
send(msg.chat_id,msg.id, "⇜ تم حصاد شجر العنب 🍇\n⇜ العدد : "..math.floor(enabnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
enabsize = tonumber(enabnum) * 12.5
enabsizee = mzroatsize - enabsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(enabsizee))
Redis:del(Thealhlfy.."enabtime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."enabname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد شجر زيتون' or text == 'حصد شجر الزيتون' or text == 'حصد شجره زيتون' or text == 'حصد شجره الزيتون' or text == 'حصد شجرة الزيتون' or text == 'حصد شجرة زيتون' or text == 'حصاد شجر زيتون' or text == 'حصاد شجر الزيتون' or text == 'حصاد شجره زيتون' or text == 'حصاد شجره الزيتون' or text == 'حصاد شجرة الزيتون' or text == 'حصاد شجرة زيتون' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."zetonnum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك شجر زيتون 🫒\n⇜ تستطيع زراعتها بالامر ( `زراعه شجر زيتون` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."zetontime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."zetontime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الزيتون بمزرعتك 🫒\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
zetonnum = Redis:get(Thealhlfy.."zetonnum"..msg.sender_id.user_id)
zeton = tonumber(zetonnum) * 1800
zetona = tonumber(ballance) + tonumber(zeton)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(zetona))
local convert_mony = string.format("%.0f",math.floor(zeton))
local convert_monyy = string.format("%.0f",math.floor(zetona))
send(msg.chat_id,msg.id, "⇜ تم حصاد شجر الزيتون 🫒\n⇜ العدد : "..math.floor(zetonnum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
zetonsize = tonumber(zetonnum) * 15
zetonsizee = mzroatsize - zetonsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(zetonsizee))
Redis:del(Thealhlfy.."zetontime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonnum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."zetonname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد شجر موز' or text == 'حصد شجر الموز' or text == 'حصد شجره موز' or text == 'حصد شجره الموز' or text == 'حصد شجرة الموز' or text == 'حصد شجرة موز' or text == 'حصاد شجر موز' or text == 'حصاد شجر الموز' or text == 'حصاد شجره موز' or text == 'حصاد شجره الموز' or text == 'حصاد شجرة الموز' or text == 'حصاد شجرة موز' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."mozznum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك شجر موز 🍌\n⇜ تستطيع زراعتها بالامر ( `زراعه شجر موز` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."mozztime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."mozztime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج الموز بمزرعتك 🍌\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
mozznum = Redis:get(Thealhlfy.."mozznum"..msg.sender_id.user_id)
mozz = tonumber(mozznum) * 2500
mozza = tonumber(ballance) + tonumber(mozz)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(mozza))
local convert_mony = string.format("%.0f",math.floor(mozz))
local convert_monyy = string.format("%.0f",math.floor(mozza))
send(msg.chat_id,msg.id, "⇜ تم حصاد شجر الموز 🍌\n⇜ العدد : "..math.floor(mozznum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mozzsize = tonumber(mozznum) * 20
mozzsizee = mzroatsize - mozzsize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(mozzsizee))
Redis:del(Thealhlfy.."mozztime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozznum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."mozzname"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'حصد شجر مانجا' or text == 'حصد شجر المانجا' or text == 'حصد شجره مانجا' or text == 'حصد شجره المانجا' or text == 'حصد شجرة المانجا' or text == 'حصد شجرة مانجا' or text == 'حصاد شجر مانجا' or text == 'حصاد شجر المانجا' or text == 'حصاد شجره مانجا' or text == 'حصاد شجره المانجا' or text == 'حصاد شجرة المانجا' or text == 'حصاد شجرة مانجا' then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if not Redis:get(Thealhlfy.."sizefram" .. msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك مزرعه\n⇜ قم ببناء مزرعتك عن طريق الامر \n( `بناء مزرعه` )","md",true)
end
if not Redis:get(Thealhlfy.."manganum"..msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ليس لديك شجر مانجا 🥭\n⇜ تستطيع زراعتها بالامر ( `زراعه شجر مانجا` )\n✧","md",true)
end
if Redis:get(Thealhlfy.."mangatime"..msg.sender_id.user_id) then
local hours = Redis:ttl(Thealhlfy.."mangatime".. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id, "⇜ لم ينضج المانجا بمزرعتك 🥭\n⇜ انتظر "..math.floor(hours).." دقيقة ⏳\n✧️","md",true)
end
ballance = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
manganum = Redis:get(Thealhlfy.."manganum"..msg.sender_id.user_id)
manga = tonumber(manganum) * 3500
mangaa = tonumber(ballance) + tonumber(manga)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(mangaa))
local convert_mony = string.format("%.0f",math.floor(manga))
local convert_monyy = string.format("%.0f",math.floor(mangaa))
send(msg.chat_id,msg.id, "⇜ تم حصاد شجر المانجا 🥭\n⇜ العدد : "..math.floor(manganum).."\n⇜ السعر : "..convert_mony.." درهم 💵\n⇜ رصيدك الان : "..convert_monyy.." درهم 💵\n✧","md",true)
mzroatsize = Redis:get(Thealhlfy.."mzroatsize"..msg.sender_id.user_id) or 0
mangasize = tonumber(manganum) * 30
mangasizee = mzroatsize - mangasize
Redis:set(Thealhlfy.."mzroatsize"..msg.sender_id.user_id , math.floor(mangasizee))
Redis:del(Thealhlfy.."mangatime"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."manganum"..msg.sender_id.user_id)
Redis:del(Thealhlfy.."manganame"..msg.sender_id.user_id)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'كنز' then
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."yiioooo" .. msg.sender_id.user_id) >=60 then
local hours = Redis:ttl(Thealhlfy.."yiioooo" .. msg.sender_id.user_id) / 60
return send(msg.chat_id,msg.id,"⇜ فرصة ايجاد كنز آخر بعد "..math.floor(hours).." دقيقة","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد اسم"
end
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
shkse = Redis:get(Thealhlfy.."shkse"..msg.sender_id.user_id)
if shkse == "طيبة" then
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قطعة اثرية 🗳\n⇜ سعره : 40000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : حجر الماسي 💎\n⇜ سعره : 35000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 10000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : لباس قديم 🥻\n⇜ سعره : 10000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : عصى سحرية 🪄\n⇜ سعره : 23000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 8000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : جوال نوكيا 📱\n⇜ سعره : 8000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : صدف 🏝\n⇜ سعره : 27000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : ابريق صدئ ⚗️\n⇜ سعره : 18000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 100000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قناع فرعوني 🗿\n⇜ سعره : 100000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 50000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : جرة ذهب 💰\n⇜ سعره : 50000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : مصباح فضي 🔦\n⇜ سعره : 36000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : لوحة نحاسية 🌇\n⇜ سعره : 29000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 1000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : جوارب قديمة 🧦\n⇜ سعره : 1000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 16000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : اناء فخاري ⚱️\n⇜ سعره : 16000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 12000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : خوذة محارب 🪖\n⇜ سعره : 12000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : سيف جدي مرزوق 🗡\n⇜ سعره : 19000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : مكنسة جدتي رقية 🧹\n⇜ سعره : 14000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : فأس ارطغرل 🪓\n⇜ سعره : 26000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 22000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : بندقية 🔫\n⇜ سعره : 22000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 11000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : كبريت ناري 🪔\n⇜ سعره : 11000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 33000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : فرو ثعلب 🦊\n⇜ سعره : 33000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : جلد تمساح 🐊\n⇜ سعره : 40000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : باقة ورود 💐\n⇜ سعره : 17000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "23" then
local Textinggtt = {"1", "2",}
local Descriptioontt = Textinggtt[math.random(#Textinggtt)]
if Descriptioontt == "1" then
local knez = ballancee + 17000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : باقة ورود 💐\n⇜ سعره : 17000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioontt == "2" then
local Textinggttt = {"1", "2",}
local Descriptioonttt = Textinggttt[math.random(#Textinggttt)]
if Descriptioonttt == "1" then
local knez = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : جلد تمساح 🐊\n⇜ سعره : 40000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioonttt == "2" then
local knez = ballancee + 10000000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : حقيبة محاسب البنك 💼\n⇜ سعره : 10000000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
end
end
end
else
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : كتاب سحر 📕\n⇜ سعره : 40000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : حقيبة ممنوعات 🎒\n⇜ سعره : 35000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 60000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : زئبق احمر 🩸\n⇜ سعره : 60000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : فيزا مسروقة 💳\n⇜ سعره : 23000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 20000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : ماريجوانا 🚬\n⇜ سعره : 20000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قطعة اثرية 🪨\n⇜ سعره : 27000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : سلا.ح ناري 🔫\n⇜ سعره : 18000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قطع فضة 🔗\n⇜ سعره : 40000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 20000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : سكين 🗡\n⇜ سعره : 20000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : مخطط عملية سطو 🧾\n⇜ سعره : 36000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : عملات مزورة 💴\n⇜ سعره : 29000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 200000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : سيارة مسروقة 🚙\n⇜ سعره : 200000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 80000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : سبيكة ذهب 🪙\n⇜ سعره : 80000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 75000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : الماس 💎\n⇜ سعره : 75000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : رشوة من تاجر 👥️️\n⇜ سعره : 19000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : علبة كبريت 🪔\n⇜ سعره : 14000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قفل 🔒\n⇜ سعره : 26000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 26000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قفل 🔒 \n⇜ سعره : 26000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 14000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : علبة كبريت 🪔\n⇜ سعره : 14000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 14000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : علبة كبريت 🪔\n⇜ سعره : 14000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 26000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : قفل 🔒 \n⇜ سعره : 26000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : صبار 🌵\n⇜ سعره : 17000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
elseif Descriptioont == "23" then
local knez = ballancee + 40000
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , knez)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,""..neews.." لقد وجدت كنز\n⇜ الكنز : جلد تمساح 🐊\n⇜ سعره : 40000 درهم 💵\n⇜ رصيدك الان : "..convert_mony.." درهم 💵\n✧","md",true)
Redis:setex(Thealhlfy.."yiioooo" .. msg.sender_id.user_id,1800, true)
end
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'كم فلوسي' and tonumber(msg.reply_to_message_id) == 0 then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return send(msg.chat_id,msg.id, "⇜ ماعندك فلوس \n✧","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
local inoi = tostring(convert_mony)
local intk = inoi:gsub(" ","-")
lan = "ar"
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg.chat_id,msg.id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@Y88F8")
sleep(1)
os.remove("intk"..rand..".mp3")
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end

---------------
if text == "الغشاشين زرف" then
if msg.ControllerBot then
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد اسم"
end
zrfee = Redis:get(Thealhlfy.."rrfff"..msg.sender_id.user_id) or 0
local ty_users = Redis:smembers(Thealhlfy.."rrfffid")
if #ty_users == 0 then
return send(chat_id,msg_id,"⇜ لا يوجد احد","md",true)
end
ty_anubis = "⇜ توب اعلى 20 شخص زرفوا فلوس :\n\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(Thealhlfy.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
ty_anubis = ty_anubis..emoo.." "..gflos.." 💵 l "..tt.." >> "..v[2].." \n"
gflous = string.format("%.0f", zrfee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,ty_anubis..gg,"md",false, false, false, false, reply_markup)
end
end
if text == "توب الغش" or text == "توب الغشاشين" then
if msg.ControllerBot then
local bank_users = Redis:smembers(Thealhlfy.."booob")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "⇜ توب اغنى 20 شخص :\n\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
top_mony = top_mony..emo.." "..convert_mony.." 💵 ꗝ "..tt.." >> `"..v[2].."`\n"
end
end
top_monyy = top_mony.."\n\n⇜ اي اسم مخالف او غش باللعب راح يتصفر وينحظر اللاعب"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_monyy,"md",false, false, false, false, reply_markup)
end
end
---------------
if text and text:match('^حظر حساب (.*)$') then
local UserName = text:match('^حظر حساب (.*)$')
local coniss = coin(UserName)
if msg.ControllerBot then
Redis:set(Thealhlfy.."bandid"..coniss,coniss)
send(msg.chat_id,msg.id, "⇜ تم حظر الحساب "..coniss.." من لعبة البنك\n✧","md",true)
end
end
if text and text:match('^الغاء حظر حساب (.*)$') then
local UserName = text:match('^الغاء حظر حساب (.*)$')
local coniss = coin(UserName)
if msg.ControllerBot then
Redis:del(Thealhlfy.."bandid"..coniss)
send(msg.chat_id,msg.id, "⇜ تم الغاء حظر الحساب "..coniss.." من لعبة البنك\n✧","md",true)
end
end
if text and text:match('^مراقبه (.*)$') or text and text:match('^مراقبة (.*)$') then
local UserName = text:match('^مراقبه (.*)$') or text:match('^مراقبة (.*)$')
local coniss = coin(UserName)
if msg.ControllerBot then
Redis:set(Thealhlfy.."morakba"..coniss,coniss)
local ban = bot.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
send(msg.chat_id,msg.id, "⌯ تم تشغيل وضع المراقبة \n\n⇜ اللاعب : "..news.."\n✧","md",true)
end
end
if text and text:match('^الغاء مراقبه (.*)$') or text and text:match('^الغاء مراقبة (.*)$') then
local UserName = text:match('^الغاء مراقبه (.*)$') or text:match('^الغاء مراقبة (.*)$')
local coniss = coin(UserName)
if msg.ControllerBot then
Redis:del(Thealhlfy.."morakba"..coniss)
local ban = bot.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
send(msg.chat_id,msg.id, "⌯ تم تعطيل وضع المراقبة \n\n⇜ اللاعب : "..news.."\n✧","md",true)
end
end
if text and text:match('^اضف كوبون (.*)$') then
local UserName = text:match('^اضف كوبون (.*)$')
local coniss = coin(UserName)
if msg.ControllerBot then
numcobo = math.random(1000000000000,9999999999999);
local convert_mony = string.format("%.0f",coniss)
Redis:set(Thealhlfy.."cobonum"..numcobo,numcobo)
Redis:set(Thealhlfy.."cobon"..numcobo,coniss)
send(msg.chat_id,msg.id, "⌯ وصل كوبون \n\n⇜ المبلغ : "..convert_mony.." درهم 💵\n⇜ رقم الكوبون : `"..numcobo.."`\n\n⇜ طريقة استخدام الكوبون :\n⇜ تكتب ( كوبون + رقمه )\n⇜ مثال : كوبون 4593875\n✧","md",true)
end
end
if text == "كوبون" or text == "الكوبون" then
send(msg.chat_id,msg.id, "⌯ طريقة استخدام الكوبون :\n⇜ تكتب ( كوبون + رقمه )\n⇜ مثال : كوبون 4593875\n\n⇜ ملاحظة : الكوبون يستخدم لمرة واحدة ولشخص واحد\n✧","md",true)
end
if text and text:match('^كوبون (.*)$') then

local UserName = text:match('^كوبون (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
cobnum = Redis:get(Thealhlfy.."cobonum"..coniss)
if coniss == tonumber(cobnum) then
cobblc = Redis:get(Thealhlfy.."cobon"..coniss)
ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
cobonplus = ballancee + cobblc
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , cobonplus)
local ballancee = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:del(Thealhlfy.."cobon"..coniss)
Redis:del(Thealhlfy.."cobonum"..coniss)
send(msg.chat_id,msg.id, "⌯ وصل كوبون \n\n⇜ المبلغ : "..cobblc.." درهم 💵\n⇜ رقم الكوبون : `"..coniss.."`\n⇜ رصيدك الان : `"..convert_mony.."` درهم 💵\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ لا يوجد كوبون بهذا الرقم `"..coniss.."`\n✧","md",true)
end
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ","md",true)
end
end
if text and text:match("^اضف فلوس (.*)$") and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^اضف فلوس (.*)$')
local coniss = coin(UserName)
if msg.ControllerBot then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعندها حساب بالبنك 🤣","md",true)  
return false
end
local ban = bot.getUser(Remsg.sender_id.user_id)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد اسم"
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
bajiop = ballanceed + coniss
Redis:set(Thealhlfy.."boob"..Remsg.sender_id.user_id , bajiop)
ccccc = Redis:get(Thealhlfy.."boobb"..Remsg.sender_id.user_id)
uuuuu = Redis:get(Thealhlfy.."bbobb"..Remsg.sender_id.user_id)
ppppp = Redis:get(Thealhlfy.."rrfff"..Remsg.sender_id.user_id) or 0
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
send(msg.chat_id,msg.id, "⇜ الاسم ↢ "..news.."\n⇜ الحساب ↢ "..ccccc.."\n⇜ بنك ↢ ( لويس )\n⇜ نوع ↢ ( "..uuuuu.." )\n⇜ الزرف ↢ ( "..ppppp.." دولار 💵 )\n⇜ صار رصيده ↢ ( "..convert_mony.." درهم 💵 )\n✧","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
end

if text and text:match('^اسحب (.*)$') or text and text:match('^سحب (.*)$') then

local UserName = text:match('^اسحب (.*)$') or text:match('^سحب (.*)$')
local coniss = coin(UserName)
cobnum = tonumber(Redis:get(Thealhlfy.."bandid"..msg.sender_id.user_id))
if cobnum == msg.sender_id.user_id then
return send(msg.chat_id,msg.id, "⇜ حسابك محظور من لعبة البنك","md",true)
end
if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if Redis:ttl(Thealhlfy.."iioood" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."iioood" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ من شوي عملت سحب استنى "..time.." ","md",true)
end
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "⇜ الحد الاعلى المسموح هو مليار درهم 💵\n✧","md",true)
end
if tonumber(coniss) < 999 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 1000 درهم 💵\n✧","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي","md",true)
end
Redis:set(Thealhlfy.."tdbelballance"..msg.sender_id.user_id , coniss)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '🤑', data = msg.sender_id.user_id.."/sahb"},{text = '🤑', data = msg.sender_id.user_id.."/sahb"},{text = '🤑', data = msg.sender_id.user_id.."/sahb"},
},
{text = 'Louis',url="t.me/Y88F8"}, 
}
}
return send(msg.chat_id,msg.id,"⇜ اختر الان :\n✧","md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
-----
if text == 'كم فلوسه' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
send(msg.chat_id,msg.id,"\n⇜ لويس ماعنده حساب بالبنك ","md",true)  
return false
end
if Redis:sismember(Thealhlfy.."booob",Remsg.sender_id.user_id) then
ballanceed = Redis:get(Thealhlfy.."boob"..Remsg.sender_id.user_id) or 0
local convert_mony = string.format("%.0f",ballanceed)
local inoi = tostring(convert_mony)
local intk = inoi:gsub(" ","-")
lan = "ar"
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg.chat_id,msg.id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@Y88F8")
sleep(1)
os.remove("intk"..rand..".mp3")
else
send(msg.chat_id,msg.id, "⇜ ماعنده حساب بنكي ","md",true)
end
end
if text and text:match("^انطق (.*)$") or text and text:match("^انطقي (.*)$") then
local inoi = text:match("^انطق (.*)$") or text:match("^انطقي (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg.chat_id,msg.id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@Y88F8")
os.remove("intk"..rand..".mp3")
end
if text == 'تبرع' then
if Redis:ttl(Thealhlfy.."tabrotime" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."tabrotime" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ يمديك تتبرع بعد "..time.." ","md",true)
end
send(msg.chat_id,msg.id, "⇜ استعمل الامر كذا :\n\n⇜ `تبرع` المبلغ","md",true)
end
if text and text:match('^تبرع (.*)$') then
local UserName = text:match('^تبرع (.*)$')
local coniss = coin(UserName)
if not Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
return send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
morakba = tonumber(Redis:get(Thealhlfy.."morakba"..msg.sender_id.user_id))
if morakba == msg.sender_id.user_id then
send("-1001737102093",0,"⇜ الايدي : "..msg.sender_id.user_id.."\n⇜ القروب : "..msg.chat_id.."\n⇜ الرسالة : "..text.."\n✧","md",true)
end
if tonumber(coniss) > 10001 then
return send(msg.chat_id,msg.id, "⇜ الحد الاعلى المسموح به هو 10000 درهم \n✧","md",true)
end
if tonumber(coniss) < 999 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح به هو 1000 درهم \n✧","md",true)
end
if Redis:ttl(Thealhlfy.."tabrotime" .. msg.sender_id.user_id) >=60 then
local time = ctime(Redis:ttl(Thealhlfy.."tabrotime" .. msg.sender_id.user_id))
return send(msg.chat_id,msg.id,"⇜ يمديك تتبرع بعد "..time.." ","md",true)
end
ballanceed = Redis:get(Thealhlfy.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) > tonumber(ballanceed) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي\n✧","md",true)
end
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم "
end
local bank_users = Redis:smembers(Thealhlfy.."booob")
monyyy_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."boob"..v)
table.insert(monyyy_list, {tonumber(mony) , v})
end
table.sort(monyyy_list, function(a, b) return a[1] < b[1] end)
tabr = math.random(1,200)
winner_id = monyyy_list[tabr][2]
local user_name = bot.getUser(winner_id).first_name or Redis:get(Thealhlfy..winner_id.."first_name:") or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
winner_mony = monyyy_list[tabr][1]
local convert_mony = string.format("%.0f",tonumber(coniss))
byre = tonumber(ballanceed) - tonumber(coniss)
Redis:set(Thealhlfy.."boob"..msg.sender_id.user_id , math.floor(byre))
taeswq = Redis:get(Thealhlfy.."tabbroat"..msg.sender_id.user_id) or 0
pokloo = tonumber(taeswq) + tonumber(coniss)
Redis:set(Thealhlfy.."tabbroat"..msg.sender_id.user_id , math.floor(pokloo))
ballanceeed = Redis:get(Thealhlfy.."boob"..winner_id) or 0
tekash = tonumber(ballanceeed) + tonumber(coniss)
Redis:set(Thealhlfy.."boob"..winner_id , tonumber(tekash))
ballanceeed = Redis:get(Thealhlfy.."boob"..winner_id) or 0
Redis:sadd(Thealhlfy.."taza",msg.sender_id.user_id)
Redis:setex(Thealhlfy.."tabrotime" .. msg.sender_id.user_id,600, true)
local convert_monyy = string.format("%.0f",tonumber(ballanceeed))
tttt = "⌯ وصل تبرع 📄\n\n⇜ من : "..news.."\n⇜ المستفيد : "..user_name.."\n⇜ المبلغ : "..convert_mony.." درهم 💵 \n⇜ فلوس المستفيد الان : "..convert_monyy.." درهم 💵\n✧"
send(msg.chat_id,msg.id, tttt,"md",true)  
send(winner_id,0, "⌯ وصلك تبرعات من : "..news.."\n⇜ المبلغ : "..convert_mony.." درهم 💵","md",true)
end
if text == 'تبرعاتي' and tonumber(msg.reply_to_message_id) == 0 then

if Redis:sismember(Thealhlfy.."booob",msg.sender_id.user_id) then
ballancee = Redis:get(Thealhlfy.."tabbroat"..msg.sender_id.user_id) or 0
if tonumber(ballancee) < 1 then
return send(msg.chat_id,msg.id, "⇜ ماعندك تبرعات \n✧","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id, "⇜ تبرعاتك : `"..convert_mony.."` درهم 💵","md",true)
else
send(msg.chat_id,msg.id, "⇜ ماعندك حساب بنكي ارسل ↢ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "توب التبرعات" or text == "توب المتبرعين" or text == "توب متبرعين" or text == "المتبرعين" or text == "متبرعين" then

local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
news = news:gsub("🇾🇪️",'')
news = news:gsub("🇹🇳",'')
news = news:gsub("🇸🇾",'')
news = news:gsub("🇸🇩",'')
news = news:gsub("🇸🇦",'')
news = news:gsub("🇶🇦",'')
news = news:gsub("🇵🇸",'')
news = news:gsub("🇴🇲",'')
news = news:gsub("🇲🇦",'')
news = news:gsub("🇱🇾",'')
news = news:gsub("🇱🇧",'')
news = news:gsub("🇰🇼️",'')
news = news:gsub("🇯🇴",'')
news = news:gsub("🇮🇶",'')
news = news:gsub("🇪🇬",'')
news = news:gsub("🇧🇭",'')
news = news:gsub("🇩🇿️",'')
news = news:gsub("🇦🇪",'')
else
news = " لا يوجد اسم"
end
ballancee = Redis:get(Thealhlfy.."tabbroat"..msg.sender_id.user_id) or 0
local bank_users = Redis:smembers(Thealhlfy.."taza")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"⇜ لا يوجد حسابات في البنك","md",true)
end
top_mony = "⇜ توب اعلى 20 شخص بالتبرعات :\n\n"
tabr_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Thealhlfy.."tabbroat"..v)
table.insert(tabr_list, {tonumber(mony) , v})
end
table.sort(tabr_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(tabr_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
tt = tt:gsub("🇾🇪️",'')
tt = tt:gsub("🇹🇳",'')
tt = tt:gsub("🇸🇾",'')
tt = tt:gsub("🇸🇩",'')
tt = tt:gsub("🇸🇦",'')
tt = tt:gsub("🇶🇦",'')
tt = tt:gsub("🇵🇸",'')
tt = tt:gsub("🇴🇲",'')
tt = tt:gsub("🇲🇦",'')
tt = tt:gsub("🇱🇾",'')
tt = tt:gsub("🇱🇧",'')
tt = tt:gsub("🇰🇼️",'')
tt = tt:gsub("🇯🇴",'')
tt = tt:gsub("🇮🇶",'')
tt = tt:gsub("🇪🇬",'')
tt = tt:gsub("🇧🇭",'')
tt = tt:gsub("🇩🇿️",'')
tt = tt:gsub("🇦🇪",'')
tt = tt:gsub("@[%a%d_]+",'')
tt = tt:gsub("#[%a%d_]+",'')
local doltebank = Redis:get(Thealhlfy.."doltebank"..v[2]) or " "
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." "..doltebank.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ━━━━━━━━━\n• you) "..gflous.." 💵 l "..news.." \n\n⇜ ملاحظة : اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'Louis', url="t.me/Y88F8"},
},
}
}
return send(msg.chat_id,msg.id,top_mony..gg,"md",false, false, false, false, reply_markup)
end
end
end
return {Thealhlfy = Runbank}