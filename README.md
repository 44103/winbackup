EN | [JA](/README.ja.md)

# Win Backup
Backup bat file for Windows

## How to Use
1. Put the `backup.bat` file in the folder that you want to backup
2. [optional] Specify files and folders that you want to ignore
   1. Put the `bakignore.txt` file in the same folder as the `backup.bat` file
   2. Write files and folders not to be backup
      - Write files until extension
      - Write `/` at the end of folders name
      ```
      ignore_file.xlsx
      ignore_folder/
      ```
3. Double click `backup.bat` file to launch
   - Create `bak` folder and rename backed up file

## Note
- To rename nested folders is not implemented

## Disclaimer
The operation of this batch file is not guaranteed.
Please note that we cannot be held responsible for any damage caused by the use of this batch file.
