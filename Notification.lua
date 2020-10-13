getgenv().Notify = function(title, text, icon, time)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title; 
        Text = text;
        Icon = icon;
        Duration = time;
    })
end
