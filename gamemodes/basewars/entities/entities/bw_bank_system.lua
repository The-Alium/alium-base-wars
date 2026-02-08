--	This version of Bank System made by цвяточеГ
--	This addon needs FPP plugin!!!

local fontName = "BaseWars.MoneyPrinter"
ENT.Base = "bw_base_moneyprinter"

ENT.Model = "models/props_lab/partsbin01.mdl" -- Model
ENT.Skin = 0

ENT.Capacity 		= 1000000 -- Max money in the bank. Can be bugs if it is more than 2000000000 (2 bil)
ENT.Money 			= 0
ENT.MaxLevel 		= 10
ENT.UpgradeCost 	= 2000
ENT.PrintColor 		= Color(255,174,0) -- Color of the model
ENT.PrintName 		= "Bank" -- Title
ENT.IsPrinter 		= true
ENT.IsValidRaidable = true
ENT.DetectRadius = 1000 -- Detect radius for printers, leave -1 to make for the whole map
ENT.IsPublic 			= false -- Can other players take money from the bank?

local Clamp = math.Clamp
function ENT:GSAT(slot, name,  min, max)

	self:NetworkVar("Int", slot, name)
	
	local getVar = function(minMax)
	
		if self[minMax] and isfunction(self[minMax]) then return self[minMax](self) end
		if self[minMax] and isnumber(self[minMax]) then return self[minMax] end
		
		return minMax or 0
		
	end

	self["Add" .. name] = function(_, var)
	
			local Val = self["Get" .. name](self) + var
	
			if min and max then
				
				Val = Clamp(tonumber(Val) or 0, getVar(min), getVar(max))

			end

			self["Set" .. name](self, Val)

	end

	self["Take" .. name] = function(_, var)
	
		local Val = self["Get" .. name](self) - var
	
		if min and max then
			
			Val = Clamp(tonumber(Val) or 0, getVar(min), getVar(max))

		end

		self["Set" .. name](self, Val)

	end

end

function ENT:StableNetwork()

	self:GSAT(2, "Capacity")
	
	self:GSAT(3, "Money", 0, "GetCapacity")
	self:GSAT(4, "Paper", 0, "MaxPaper")
	self:GSAT(5, "Level", 0, "MaxLevel")
	self:GSAT(6, "UpgradeCost", 0, "UpgradeCost")

end

if SERVER then

	AddCSLuaFile()

	function ENT:Init()
		local an = self:GetAngles()
		
		self.time = CurTime()
		self.time_p = CurTime()

		self:SetCapacity(self.Capacity)
		self:SetUpgradeCost(tonumber(self.UpgradeCost))
		self:SetAngles(Angle( an.pitch, an.yaw + 180, an.roll))
		
		self:SetHealth(self.PresetMaxHealth or 100)

		self.rtb = 0
		
		self.FontColor = color_white
		self.BackColor = color_black
		self:SetColor(self.PrintColor)
		self:SetNWInt("UpgradeCost", tonumber(self.UpgradeCost))

		self:SetLevel(1)
	end
	
	function ENT:SetUpgradeCost(val)
	
		self.UpgradeCost = val
		self:SetNWInt("UpgradeCost", val)
		
	end

	function ENT:Upgrade(ply)
		
		if ply then
			
			local lvl = self:GetLevel()

			local plyM = ply:GetMoney()

			local calcM = self.UpgradeCost * lvl
			
			if plyM < calcM then
				
				ply:Notify(BaseWars.LANG.UpgradeNoMoney, BASEWARS_NOTIFICATION_ERROR)
			return end

			if lvl >= self.MaxLevel then
				
				ply:Notify(BaseWars.LANG.UpgradeMaxLevel, BASEWARS_NOTIFICATION_ERROR)

			return end

			ply:TakeMoney(calcM)
			self.CurrentValue = (self.CurrentValue or 0) + calcM
			self:SetCapacity(self:GetCapacity() * 2)
		end

		self:AddLevel(1)
		

	end

	function ENT:ThinkFunc()
	

		
		if self.Disabled or self:BadlyDamaged() then return end
		local added

		local level = self:GetLevel() ^ 1.3

		for k, v in pairs( ents.FindByClass( "bw_printer_*" ) ) do 
			if self.DetectRadius > -1 and self:GetPos():Distance(v:GetPos()) >= self.DetectRadius then continue end
			
			if v:CPPIGetOwner() == self:CPPIGetOwner() then
				if self:GetMoney() < self:GetCapacity() then
					local allmoney = v:GetMoney()
					v:TakeMoney(allmoney)
					self:AddMoney(allmoney)
				end
			end
		end		
		
		for k, v in pairs( ents.FindByClass( "bw_base_moneyprinter" ) ) do
			if self.DetectRadius > -1 and self:GetPos():Distance(v:GetPos()) >= self.DetectRadius then continue end
			
			if v:CPPIGetOwner() == self:CPPIGetOwner() then
				if self:GetMoney() < self:GetCapacity() then
					local allmoney = v:GetMoney()
					v:TakeMoney(allmoney)
					self:AddMoney(allmoney)
				end
			end
		end	
		
		if CurTime() >= self.PrintInterval * 2 + self.time_p and added then
			
			self.time_p = CurTime()
			
		end	

	end
	
	function ENT:ReturnPly(ply)
		return ply, ply:UniqueID()
	end
	
	function ENT:PlayerTakeMoney(ply)

		if self:CPPIGetOwner() != self:ReturnPly(ply) and self.IsPublic == false then ply:Notify("Money can take only the owner!", BASEWARS_NOTIFICATION_ERROR) return end
		
		local money = self:GetMoney()
		
		local Res, Msg = hook.Run("BaseWars_PlayerCanEmptyPrinter", ply, self, money)
		if Res == false then
		
			if Msg then
			
				ply:Notify(Msg, BASEWARS_NOTIFICATION_ERROR)
				
			end
		
		return end
		
		
		self:TakeMoney(money)

		ply:GiveMoney(money)


		hook.Run("BaseWars_PlayerEmptyPrinter", ply, self, money)
		
	end

	function ENT:UseFuncBypass(activator, caller, usetype, value)
		
		if self.Disabled then return end

		if activator:IsPlayer() and caller:IsPlayer() and self:GetMoney() > 0 then
			
			self:PlayerTakeMoney(activator)

		end

	end

	function ENT:SetDisabled(a)

		self.Disabled = a and true or false
		self:SetNWBool("printer_disabled", a and true or false)

	end
	
else

	function ENT:Initialize()
		
		self.FontColor = Color(255,174,0)
		if not self.FontColor then self.FontColor = Color(255,174,0) end
		if not self.BackColor then self.BackColor = color_black end
		
	end

	
	local WasPowered
	if CLIENT then
		function ENT:DrawDisplay(pos, ang, scale)

			local w, h = 216 * 2, 246 * 2
			local disabled = self:GetNWBool("printer_disabled")
			local Pw = self:IsPowered()
			local Lv = self:GetLevel()
			local Cp = self:GetCapacity()

			draw.RoundedBox(4, 0, 0, w, h, Pw and self.BackColor or color_black)

			if not Pw then return end

			if disabled then

				draw.DrawText("This bank has been", fontName, w / 2, h / 2 - 48, self.FontColor, TEXT_ALIGN_CENTER)
				draw.DrawText("DISABLED", fontName .. ".Huge", w / 2, h / 2 - 32, Color(255,0,0), TEXT_ALIGN_CENTER)

			return end
			draw.DrawText(self.PrintName, fontName, w / 2, 4, self.FontColor, TEXT_ALIGN_CENTER)

			if disabled then return end

			--Level
			surface.SetDrawColor(self.FontColor)
			surface.DrawLine(0, 30, w, 30)--draw.RoundedBox(0, 0, 30, w, 1, self.FontColor)
			draw.DrawText("LEVEL: " .. Lv, fontName .. ".Big", 4, 32, self.FontColor, TEXT_ALIGN_LEFT)
			surface.DrawLine(0, 68, w, 68)--draw.RoundedBox(0, 0, 68, w, 1, self.FontColor)

			draw.DrawText("STORED", fontName .. ".Big", 4, 72, self.FontColor, TEXT_ALIGN_LEFT)
--			draw.RoundedBox(0, 0, 72 + 32, w, 1, self.FontColor)

			local money = tonumber(self:GetMoney()) or 0
			local cap = tonumber(Cp) or 0

			local moneyPercentage = math.Round( money / cap * 100 ,1)
			--Percentage done
			draw.DrawText( moneyPercentage .."%" , fontName .. ".Big",	w - 4, 71, self.FontColor, TEXT_ALIGN_RIGHT)

			--Money/Maxmoney
			local currentMoney = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(money)
			local maxMoney = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(cap)
			local font = fontName .. ".Big"
			if #currentMoney > 16 then

				font = fontName .. ".MedBig"

			end
			if #currentMoney > 20 then

				font = fontName .. ".Med"

			end
			local fh = draw.GetFontHeight(font)

			local StrW,StrH = surface.GetTextSize(" / ")
			draw.DrawText(" / " , font,
				w/2 - StrW/2 , (font == fontName .. ".Big" and 106 or 105 + fh / 4), self.FontColor, TEXT_ALIGN_LEFT)

			local moneyW,moneyH = surface.GetTextSize(currentMoney)
			draw.DrawText(currentMoney , font,
				w/2 - StrW/2 - moneyW , (font == fontName .. ".Big" and 106 or 105 + fh / 4), self.FontColor, TEXT_ALIGN_LEFT)

			draw.DrawText( maxMoney, font,
				w/2 + StrW/2 , (font == fontName .. ".Big" and 106 or 105 + fh / 4), self.FontColor, TEXT_ALIGN_Right)

			surface.DrawLine(0, 102 + 37, w, 102 + 37)

			local NextCost = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(self:GetLevel() * self:GetNWInt("UpgradeCost"))

			if self:GetLevel() >= self.MaxLevel then

				NextCost = "!Max Level!"

			end

			surface.DrawLine(0, 142 + 25, w, 142 + 25)--draw.RoundedBox(0, 0, 142 + 25, w, 1, self.FontColor)
			draw.DrawText("NEXT UPGRADE: " .. NextCost, fontName .. ".MedBig", 4, 94 + 49, self.FontColor, TEXT_ALIGN_LEFT)
			surface.DrawLine(0, 142 + 25, w, 142 + 25)--draw.RoundedBox(0, 0, 142 + 55, w, 1, self.FontColor)

			--Time remaining counter
			local timeRemaining = 0
			local count_PrintAmount = 0
			local count_Lv = 0
			local count_PrintInterval = 0
			
			local printers_detected = 0
			
			for k, v in pairs( ents.FindByClass( "bw_printer_*" ) ) do 
				if self.DetectRadius > -1 and self:GetPos():Distance(v:GetPos()) >= self.DetectRadius then continue end
				
				local disabled = v:GetNWBool("printer_disabled")
				local Pw = v:IsPowered()
				
				if disabled then continue end -- DISABLED
				if not Pw then continue end -- NOT POWERED
				if self:GetPaper() > 0 then continue end -- NO SHEETS
				
				if v:CPPIGetOwner() == self:CPPIGetOwner() then
					printers_detected = printers_detected + 1
					local tmp_cap = tonumber(v:GetCapacity()) or 0
					local tmp_money = tonumber(v:GetMoney()) or 0
					local tmp_lvl = self:GetLevel() or 1
					
					count_PrintAmount = count_PrintAmount + v.PrintAmount
					count_Lv = count_Lv + v:GetLevel()
					count_PrintInterval = count_PrintInterval + v.PrintInterval
					timeRemaining = timeRemaining + math.Round( (cap - money) / (count_PrintAmount * count_Lv / count_PrintInterval) )
				end
			end		

			for k, v in pairs( ents.FindByClass( "bw_base_moneyprinter" ) ) do 
				if self.DetectRadius > -1 and self:GetPos():Distance(v:GetPos()) >= self.DetectRadius then continue end
				
				local disabled = v:GetNWBool("printer_disabled")
				local Pw = v:IsPowered()
				
				if disabled then continue end -- DISABLED
				if not Pw then continue end -- NOT POWERED
				if self:GetPaper() > 0 then continue end -- NO SHEETS
				
				if v:CPPIGetOwner() == self:CPPIGetOwner() then
					printers_detected = printers_detected + 1
					local tmp_cap = tonumber(v:GetCapacity()) or 0
					local tmp_money = tonumber(v:GetMoney()) or 0
					local tmp_lvl = self:GetLevel() or 1
					
					count_PrintAmount = count_PrintAmount + v.PrintAmount
					count_Lv = count_Lv + v:GetLevel()
					count_PrintInterval = count_PrintInterval + v.PrintInterval
					timeRemaining = timeRemaining + math.Round( (cap - money) / (count_PrintAmount * count_Lv / count_PrintInterval) )
				end
			end		

			
			if printers_detected == 0 then
				draw.DrawText("---", fontName .. ".Big", w-4 , 32, self.FontColor, TEXT_ALIGN_RIGHT)
			else
				if timeRemaining > 0 then

					local PrettyHours = math.floor(timeRemaining/3600)
					local PrettyMinutes = math.floor(timeRemaining/60) - PrettyHours*60
					local PrettySeconds = timeRemaining - PrettyMinutes*60 - PrettyHours*3600
					local PrettyTime = (PrettyHours > 0 and PrettyHours.."h" or "") .. (PrettyMinutes > 0 and PrettyMinutes.."m" or "") .. PrettySeconds .."s"

					draw.DrawText(PrettyTime .. " until full", fontName .. ".Big", w-4 , 32, self.FontColor, TEXT_ALIGN_RIGHT)
				else
					draw.DrawText("Full", fontName .. ".Big", w-4 , 32, self.FontColor, TEXT_ALIGN_RIGHT)
				end
			end

			--Money bar BG
			local BoxX = 110
			local BoxW = 220
			draw.RoundedBox(0, BoxX, 74, BoxW , 24, self.FontColor)

			--Money bar gap
			if cap > 0 and cap ~= math.huge then
				local moneyRatio = money / cap
				local maxWidth = math.floor(BoxW - 6)
				local curWidth = maxWidth * (1-moneyRatio)

				draw.RoundedBox(0, w - BoxX - curWidth + 6 , 76, curWidth , 24 - 4, self.BackColor)

			end
			
			
			-- Detected printers
			
			local printers_text = "" -- 13 lines only!
			local printers_found = 0
			
			for k, v in pairs( ents.FindByClass( "bw_printer_*" ) ) do 
				if self.DetectRadius > -1 and self:GetPos():Distance(v:GetPos()) >= self.DetectRadius then continue end
				
				if v:CPPIGetOwner() == self:CPPIGetOwner() then
					local tmp_cap = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(math.Round(v.PrintAmount * (v:GetLevel() ^ 1.3)))
					
					local disabled = v:GetNWBool("printer_disabled")
					local Pw = v:IsPowered()
					
					printers_found = printers_found + 1
					if printers_found < 11 then
						printers_text = printers_text..">"..printers_found..": "..v.PrintName.." ("..tmp_cap.." per "..v.PrintInterval.."s)"
						if disabled then printers_text = printers_text.." [D!]" end -- DISABLED
						if not Pw then printers_text = printers_text.." [P!]" end -- NOT POWERED
						if self:GetPaper() > 0 then printers_text = printers_text.." [S!]" end -- NO SHEETS
						printers_text = printers_text .. "\n"
					end

				end
			end		

			for k, v in pairs( ents.FindByClass( "bw_base_moneyprinter" ) ) do 
				if self.DetectRadius > -1 and self:GetPos():Distance(v:GetPos()) >= self.DetectRadius then continue end
				
				if v:CPPIGetOwner() == self:CPPIGetOwner() then	
					local tmp_cap = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(math.Round(v.PrintAmount * (v:GetLevel() ^ 1.3)))
					
					local disabled = v:GetNWBool("printer_disabled")
					local Pw = v:IsPowered()
					
					printers_found = printers_found + 1
					if printers_found < 11 then
						printers_text = printers_text..">"..printers_found..": "..v.PrintName.." ("..tmp_cap.." per "..v.PrintInterval.."s)"
						if disabled then printers_text = printers_text.." [D!]" end -- DISABLED
						if not Pw then printers_text = printers_text.." [P!]" end -- NOT POWERED
						if self:GetPaper() > 0 then printers_text = printers_text.." [S!]" end -- NO SHEETS
						printers_text = printers_text .. "\n"
					end
				end
			end
			
			if printers_found > 11 then
				printers_text = printers_text.."and "..(printers_found - 11).." more"
			end
			if printers_found == 0 then printers_text = "No printers found!" end
			draw.DrawText("Detected printers ("..printers_found.."): \n"..printers_text, fontName .. ".MedBig", 4, 94 + 75, self.FontColor, TEXT_ALIGN_LEFT)

			
		end

		function ENT:Calc3D2DParams()

			local pos = self:GetPos()
			local ang = self:GetAngles()

			pos = pos + ang:Up() * 12.09
			pos = pos + ang:Forward() * 2.40
			pos = pos + ang:Right() * -10.82

			ang:RotateAroundAxis(ang:Up(), 90)
			ang:RotateAroundAxis(ang:Forward(), 90)
			ang:RotateAroundAxis(ang:Right(), 180)

			return pos, ang, 0.1 / 2

		end

	end

	function ENT:Draw()

		self:DrawModel()

		local pos, ang, scale = self:Calc3D2DParams()

		cam.Start3D2D( pos, ang, scale )
			self:DrawDisplay( pos, ang, scale )
		cam.End3D2D()

	end

end