--[[

 This Addon will provide a display of combo points and can be moved with 
 oUF_MovableFrames. Very simple, very basic.

--]]

local minalpha = 0
local maxalpha = 1
local height = 15
local width = 15
local font = "Fonts\\FRIZQT__.TTF"

local backdrop = {
	bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=],
	insets = {top = -1, bottom = -1, left = -1, right = -1}
}

local function updateCombo(self, event, unit)
    points = GetComboPoints("player", "target")
    --TODO Add size and color changing to the text here.
    if (points == 1) then
        --self.CPoints:SetTextColor(0,1,0,1)
        --self.CPoints:
    end
    --DEFAULT_CHAT_FRAME:AddMessage(GetComboPoints("player", "target"))
	if(unit == PlayerFrame.unit and unit ~= self.CPoints.unit) then
		self.CPoints.unit = unit
	end
end

local function style(self, unit)
    --self:SetScript('OnEnter', UnitFrame_OnEnter)
    --self:SetScript('OnLeave', UnitFrame_OnLeave)
    --self:SetBackdrop(backdrop)
    --The forth arg controls Alpha, thats handy to know.
    self:SetBackdropColor(0, 0, 0, 0)
    self:SetAttribute('initial-height', 10)
    self:SetAttribute('initial-width', 10)
    self:Show()
    local points = self:CreateFontString(nil, 'OVERLAY')
    points:SetFont(font, 18, "OUTLINE")
    points:SetTextColor(1,1,1,1)
    points:SetAllPoints(self)
    points.frequentUpdates = 0.25
    self:Tag(points, '[cpoints]')

    --self.CPoints = self:CreateFontString(nil, 'OVERLAY')
    --self.CPoints:SetFont(font, 18, "OUTLINE")
    --self.CPoints:SetTextColor(0,0,0,1)
    --self.CPoints:SetPoint('CENTER', self, 0,0)
    --self.CPoints:SetTextColor(1, 1, 1)
    --self.CPoints:SetJustifyH('RIGHT')
    --self.CPoints.unit = PlayerFrame.unit
    --self:RegisterEvent('UNIT_COMBO_POINTS', updateCombo)
end

oUF:RegisterStyle('ComboPoints', style)
oUF:SetActiveStyle('ComboPoints')
oUF:Spawn('target', "CP"):SetPoint('CENTER', UIParent, 0,0)
