# Import the required module for Active Directory
Import-Module ActiveDirectory

# Change the password policy
Set-ADDefaultDomainPasswordPolicy -Identity THEOFFICE.local -ComplexityEnabled $false -MinPasswordLength 0

# Create the Test organizational unit
New-ADOrganizationalUnit -Name "Test"

# Define the organizational units
$organizationalUnits = @{
    "Sales" = @("Pam.Beesly", "Erin.Hannon");
    "Marketing" = @("Angela.Martin", "Meredith.Palmer", "Phyllis.Vance");
    "Operations" = @("Andy.Bernard", "Holly.Flax", "Todd.Packer");
    "Production" = @("Darryl.Philbin", "Lonny.Collins", "Hank.Doyle");
    "Quality Assurance" = @("Gabe.Lewis");
    "Business Development" = @("Kelly.Kapoor", "Charles.Miner", "Jan.Levinson");
    "Finance" = @("Stanley.Hudson", "Kevin.Malone", "Oscar.Martinez", "David.Wallace");
    "Technical Support" = @("Jim.Halpert", "Ryan.Howard");
    "Engineering" = @("Creed.Bratton", "Roy.Anderson");
    "Legal" = @("Toby.Flenderson");
    "Management" = @("Michael.Scott", "Dwight.Schrute", "Robert.California", "Andy.Bernard", "Jan.Levinson", "Nellie.Bertram");
}

# Define the passwords
$passwords = @(
    "password1", "princess1", "anthony1", "fuckyou1", "fuckyou2", "sunshine1", "football1", "qwerty1", "password2", 
    "michelle1", "butterfly1", "bubbles1", "trustno1", "superman1", "beautiful1", "madison1", "babygurl1", "poohbear1", 
    "spongebob1", "angel123", "password123", "chicken1", "playboy1", "softball1", "chocolate1", "computer1", "jennifer1", 
    "1password", "richard1", "heather1", "newyork1", "mustang1", "rainbow1", "greenday1", "zoey101", "princess2", 
    "monkey2", "tiffany1", "soccer10", "mylove1", "babygirl2"
)

# Set the domain
$domain = "THEOFFICE.local"

# Create a list to store user objects
$userList = @()

# Create groups and users
foreach ($ou in $organizationalUnits.GetEnumerator()) {
    # Create the group
    New-ADGroup -Name $ou.Key -GroupScope Global -Path "OU=Test,DC=THEOFFICE,DC=local"

    foreach ($user in $ou.Value) {
        # Check if user exists
        $firstName = $user.Split(".")[0]
        $lastName = $user.Split(".")[1]
        $samAccountName = ($firstName[0] + $lastName).ToLower()

        if (-not (Get-ADUser -Filter "SamAccountName -eq '$samAccountName'")) {
            # Get a random password
            $password = Get-Random -InputObject $passwords

            # Create the user
            $newUser = New-ADUser -SamAccountName $samAccountName -UserPrincipalName "$samAccountName@$domain" -Name $user -GivenName $firstName -Surname $lastName -Enabled $true -ChangePasswordAtLogon $false -PasswordNeverExpires $true -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) -PassThru

            # Add the user to the group
            Add-ADGroupMember -Identity $ou.Key -Members $newUser

            # Add users "Jim.Halpert" and "Ryan.Howard" to the "Domain Admins" group
            if($user -eq "Jim.Halpert" -or $user -eq "Ryan.Howard") {
                Add-ADGroupMember -Identity "Domain Admins" -Members $newUser
            }

            # Create a custom object to hold the user information
            $userObj = New-Object -TypeName psobject
            $userObj | Add-Member -MemberType NoteProperty -Name "Username" -Value $samAccountName
            $userObj | Add-Member -MemberType NoteProperty -Name "Password" -Value $password

            # Add the user object to the list
            $userList += $userObj
        }
    }
}

# Create SQL Service account
$sqlPassword = "forget1=man/"
$sqlAccount = New-ADUser -SamAccountName "sqlservice" -UserPrincipalName "sqlservice@$domain" -Name "SQL Service" -GivenName "SQL" -Surname "Service" -Enabled $true -PasswordNeverExpires $true -Description "Incase you forget the password: forget1=man/" -AccountPassword (ConvertTo-SecureString -AsPlainText $sqlPassword -Force) -PassThru

# Set the SPN
setspn.exe -a DC/sqlservice.theoffice.local:1337 THEOFFICE\sqlservice

# Output the user list in table format
$userList | Format-Table -AutoSize
