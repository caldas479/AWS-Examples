# Import the AWS S3 PowerShell module
Import-Module AWS.Tools.S3

# Set AWS region
$region = "eu-west-1"

# Prompt user for the S3 bucket name
$bucketName = Read-Host -Prompt "Enter the S3 bucket name"

# Output the AWS region and S3 bucket name
Write-Host "AWS Region: $region"
Write-Host "S3 Bucket: $bucketName"

# Function to check if the bucket exists
function BucketExists {
    try {
        Get-S3Bucket -BucketName $bucketName -Region $region -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

# Check if the bucket exists
if (BucketExists -bucketName $bucketName) {
    Write-Host "Bucket '$bucketName' already exists."
} else {
    # Create the S3 bucket
    New-S3Bucket -BucketName $bucketName -Region $region
    Write-Host "Bucket '$bucketName' created."
}

# Create a file
$fileName = 'myfile.txt'
$fileContent = 'HelloWorld'
Set-Content -Path $fileName -Value $fileContent

# Upload the file to the S3 bucket
Write-S3Object -BucketName $bucketName -File $fileName -Key $fileName

# Output success message
Write-Host "File '$fileName' created and uploaded to S3 bucket '$bucketName' in region '$region'."
