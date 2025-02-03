# Import the Active Directory module
Import-Module ActiveDirectory
# Define the path to the CSV file
$csvPath = "C:\Users\Administrador.WIN-GS9465L7VI7\Desktop\afe_usrs.csv"
# Read the CSV file
$users = Import-Csv $csvPath

# Loop through each user in the CSV and create them in Active Directory
foreach ($user in $users) {
    $firstName = $user."First Name"
    $lastName = $user."Last Name"
    $username = $user.Username
    $password = ConvertTo-SecureString -String $user.Password -AsPlainText -Force

    # Create the user in Active Directory
    New-ADUser -Name "$firstName $lastName" `
               -GivenName $firstName `
               -Surname $lastName `
               -SamAccountName $username `
               -UserPrincipalName "$username@merinit.local" `
               -AccountPassword $password `
               -Enabled $true
}