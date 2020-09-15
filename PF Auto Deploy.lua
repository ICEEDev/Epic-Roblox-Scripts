local _deploy;

for i,v in next, debug.getregistry() do
    if (typeof(v) == "function") then
        for a, b in next, debug.getupvalues(v) do
            if (typeof(b) == "table" and rawget(b, "deploy")) then
                _deploy = b;
            end;
        end;
    end;

    if (_deploy) then
        break;
    end;
end;

while wait(1) do
    if (not _deploy.isdeployed()) then
        _deploy:deploy();
    end;
end;
