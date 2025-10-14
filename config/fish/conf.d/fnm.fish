set FNM_PATH "/home/nt-nabeel/.local/share/fnm"
if [ -d "$FNM_PATH" ]
    set PATH "$FNM_PATH" $PATH
    fnm env --use-on-cd --shell fish | source
end

function fnm_upgrade_default
    fnm install --lts
    fnm default lts-latest
end
