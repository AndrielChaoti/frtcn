# Training & Drill Case Announcer
mIRC script to help with announcing cases for Fuel Rats training and drills.

## What it does
This script creates a dialog that can be used to populate the necessary parameters for DrillSqueak's !announce command.

Using the main dialog is simple, input the details of your simulated case as appropriate.

⚠️There is currently only very limited sanity checking, make sure the information is correct **before** you click **Send Case**


![The main dialog](https://cdn.discordapp.com/attachments/694882572358123623/839984037128568892/unknown.png)

## Installing
Installing the script is a couple of steps:

### Copy & Paste
1. Open the Script Editor in mIRC by presing <kbd>ALT</kbd> + <kbd>R</kbd>
   * Make sure you are on the **Remote** tab.
3. **File** > **New** to create a new script.
4. Open the script file from this repo, and click "Raw" in the top right.
5. Select everything in the new window (<kbd>CTRL</kbd> + <kbd>A</kbd>)
6. Copy & Paste the file into the new empty script.
7. **File** > **Save As...** and call it whatever you want, make sure to select **Script file (\*.ini;\*.mrc)** in **Save as Type**

## Using
Navigate your client to your favourite training or drill channel and type `/cann` without any arguments to open the dialog.

### Advanced
`/cann [channel]` - open the annoucement dialog with optional `channel` as target.
