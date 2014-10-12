<#
    Renames files located in the provided -path parameter
   	Appends the -author and the -date parameters to the end of each file name in the -path
   	Preserves the extension of the original file
   	Useful for uploading images to the Simeone Foundation Automative Museum: http://simeonemuseum.org/upload
   	Provide a -simulation_mode:$false if you want to simulate the rename operation without actually executing it.
   	
   	Example of usage:
   	Rename_files_in_folder_in_bulk -path "D:\Kinan\Desktop\Racing Legends\" -author "Faham" -date "08_24_2014" -simulation_mode:$false
#>

param(
	[string]$path 	= $(throw "-path is required! How do you expect me to guess it for you?")
	,[string]$date 	= $(throw "-date is mandatory!!! Seriously!!!")
	,[string]$author = $(throw "-author is not to be forgotten :(") 
	,[switch]$simulation_mode = $true
)

Get-ChildItem($path) | foreach-object{
	$current_file_name = $_.fullName
    $new_file_name = $_.BaseName + "_"+ $author + "_"+ $date + $_.Extension      
    if($simulation_mode){
    	Rename-Item -path $current_file_name -NewName $new_file_name  -whatif
    }
    else{
    	Rename-Item -path $current_file_name -NewName $new_file_name 
    }    
}
