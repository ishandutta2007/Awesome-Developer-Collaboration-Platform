Set-Location "C:\Users\ishan\Documents\Projects\Awesome-Developer-Collaboration-Platform"

function Run-Git {
    param([string]$commitMsg)
    git add .
    git commit -m $commitMsg
    git -c http.sslVerify=false push
}

$readme = Get-Content -Path "README.md" -Raw

# Step 1: Open-source repos with stars badge
$os_section = @"

## Open-Source Repositories

| Repository | Stars |
|---|---|
| [microsoft/vscode](https://github.com/microsoft/vscode) | [![GitHub stars](https://img.shields.io/github/stars/microsoft/vscode?style=social&color=white)](https://github.com/microsoft/vscode/stargazers) |
| [facebook/react](https://github.com/facebook/react) | [![GitHub stars](https://img.shields.io/github/stars/facebook/react?style=social&color=white)](https://github.com/facebook/react/stargazers) |
| [vuejs/vue](https://github.com/vuejs/vue) | [![GitHub stars](https://img.shields.io/github/stars/vuejs/vue?style=social&color=white)](https://github.com/vuejs/vue/stargazers) |
"@
$readme += $os_section
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "Added github stars and sorted the opensource based on that"

# Step 2: Decorate with SVG banner
$banner = "![Banner](./assets/banner.svg)`n`n"
$readme = $banner + $readme
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "added banner"

# Step 3: Decorate with emojis
$readme = $readme.Replace("# Awesome-Developer-Collaboration-Platform", "# 🚀 Awesome-Developer-Collaboration-Platform")
$readme = $readme.Replace("A curated list", "🌟 A curated list")
$readme = $readme.Replace("## Open-Source Repositories", "## 🌐 Open-Source Repositories")
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "added emojis"

# Step 4: SEO Optimised
$seo_text = "An awesome list of the best developer collaboration tools, platforms, and open-source repositories to improve team productivity, code sharing, and project management.`n"
$readme = $readme.Replace("🌟 A curated list", $seo_text + "`n🌟 A curated list")
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "seo optimised"

# Step 5: Badges to left added
$badges_left = "<p align=`"center`">`n<a href=`"https://github.com/ishandutta2007/Awesome-Awesome-Awesome`"><img src=`"https://img.shields.io/badge/Awesome-%E2%9C%94-blueviolet?style=flat-square&logo=github`" alt=`"Awesome`"/></a><a href=`"https://discord.gg/jc4xtF58Ve`"><img src=`"https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white`" alt=`"Discord`" /></a>`n"
$readme = $readme.Replace("![Banner](./assets/banner.svg)`n`n", "![Banner](./assets/banner.svg)`n`n" + $badges_left)
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "badges to left added"

# Step 6: Badges to right added
$badges_right = "<a href=`"https://github.com/ishandutta2007`"><img alt=`"GitHub followers`" src=`"https://img.shields.io/github/followers/ishandutta2007?label=Follow`" /></a>`n</p>`n"
$readme = $readme.Replace("alt=`"Discord`" /></a>`n", "alt=`"Discord`" /></a>" + $badges_right)
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "badges to right added"

# Step 7: Star History
$folder_name = "Awesome-Developer-Collaboration-Platform"
$star_history = @"

##  Star History
<div align="center">
<a href="https://www.star-history.com/?repos=ishandutta2007%2F$folder_name&type=date&legend=bottom-right">
<picture>
<source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/chart?repos=ishandutta2007/$folder_name&type=date&theme=dark&legend=bottom-right" />
<source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/chart?repos=ishandutta2007/$folder_name&type=date&legend=bottom-right" />
<img alt="Star History Chart" src="https://api.star-history.com/chart?repos=ishandutta2007/$folder_name&type=date&legend=bottom-right" />
</picture>
</a>
</div>
"@
$readme += $star_history
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "star history added"

# Step 8: Replace chartrepos
$readme = $readme.Replace("chartrepos", "chart?repos")
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "fixed star plot"

# Step 9: Replace awesome link
$readme = $readme.Replace("https://github.com/sindresorhus/awesome", "https://github.com/ishandutta2007/Awesome-Awesome-Awesome")
Set-Content -Path "README.md" -Value $readme -Encoding utf8
Run-Git -commitMsg "invalid awesome link fixed"

Write-Host "All tasks completed."
