hs.loadSpoon('Ki')
spoon.Ki.workflowEvents = {...}    -- configure `spoon.Ki` here
spoon.Ki:start()

function reloadConfig(files)
doReload = false
for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
        doReload = true
    end
end
if doReload then
    hs.reload()
end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

-- hyper = hs.hotkey.modal.new({}, 'F17')
-- function enterHyperMode()
--   hyper.triggered = false
--   hyper:enter()
-- end

-- -- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- -- send ESCAPE if no other keys are pressed.
-- function exitHyperMode()
--   hyper:exit()
--   if not hyper.triggered then
--     hs.eventtap.keyStroke({}, 'ESCAPE')
--   end
-- end

-- -- Bind the Hyper key
-- f18 = hs.hotkey.bind({}, 'F17', enterHyperMode, exitHyperMode)
