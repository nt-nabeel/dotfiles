set FNM_PATH "/home/nt-nabeel/.local/share/fnm"
if [ -d "$FNM_PATH" ]
    set PATH "$FNM_PATH" $PATH
    fnm env --use-on-cd --shell fish | source
end

function fnm_upgrade_default
    echo "🔍 Checking for new LTS version..."

    # current Node version
    set current (node -v ^/dev/null 2>/dev/null | string trim)

    # latest LTS version (only version, no codename)
    set latest (fnm ls-remote --lts | tail -n 1 | awk '{print $1}' | string trim)

    if test -z "$latest"
        echo "❌ Failed to determine latest LTS version."
        return 1
    end

    if test -n "$current" -a "$current" = "$latest"
        echo "✅ Node $current is already the latest LTS ($latest). Nothing to do."
        return 0
    end

    echo "⬆️  Upgrading Node from $current → $latest"
    set tmpfile (mktemp)

    echo "📦 Collecting current global npm packages..."
    npm ls -g --depth=0 --json 2>/dev/null | jq -r '.dependencies // {} | keys[]' >$tmpfile

    # Properly read and clean the package list
    set pkgs (string trim (cat $tmpfile))
    rm -f $tmpfile

    if test (count $pkgs) -gt 0
        echo "Found packages: "(string join " " $pkgs)
    else
        echo "ℹ️  No global npm packages found."
    end
    echo

    echo "⬇️  Installing latest LTS Node version ($latest)..."
    fnm install $latest

    echo "🌟 Setting default Node to latest LTS..."
    fnm default $latest
    fnm use $latest

    if test (count $pkgs) -gt 0
        echo "📥 Reinstalling previous global npm packages..."
        npm i -g $pkgs
    else
        echo "ℹ️  Skipping reinstall (no global packages)."
    end

    echo "✅ Node upgraded successfully to $latest!"
end
