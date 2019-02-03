$here = split-path -parent $MyInvocation.MyCommand.Definition

$scripts = Get-ChildItem -Path ./ -Filter *.ps1 -Exclude *.tests.* -Recurse -File -Name | ForEach-Object {
    [System.IO.Path]::GetFileName($_)
}

Describe "Validate Powershell code"{

   foreach($script in $scripts) {

        It "$script is valid PowerShell code" {
            $content = Get-Content -Path $script `
                                   -ErrorAction Stop
            $errors = $null
            $null = [System.Management.Automation.PSParser]::Tokenize($content, [ref]$errors)
            $errors.Count | Should Be 0
        }
   }
}
