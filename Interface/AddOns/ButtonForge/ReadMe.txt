Button Forge
Mod for World of Warcraft

Author: Massiner of Nathrezim
Version: 0.9.4

Description: Graphically create as many Action Bars and Buttons in the game as you choose

Usage:
- From the Button Forge Toolbar click the various buttons to enter into create/destroy bar mode
- Advanced options will display additional advanced options for each Bar created (such as key bindings)
- Drag the bars where you wish them to be placed
- When you are happy with your layout close the Button Forge Toolbar to hide the configuration gui either via the Key Binding, the Addon Configuration page, or the Red X on the Toolbar
- It is also possible to drag commands from the Button Forge Toolbar onto Button Forge bars, this is advisable for the Button Forge Configuration button


Restrictions:
- Most (but not all) configuration options will not function during combat


History:
02-September-2010	v0.9.4	- Fixed:
								Creating a macro with an empty body or deleting a macro could sometimes cause visual errors in Button Forge, this has been resolved
								Tooltips for companions were dissappearing very quickly after displaying, this has been resolved
								
26-August-2010		v0.9.3	- Fixed:
								Tooltips now refresh while being displayed
								In some cases (particularly macros) item display was not updating, this has been resolved
							- Features:
								Bonus Bars are now supported
								A Right Click Self Casting option is now available

10-August-2010		v0.9.2	- Fixed:
								Scale - The Double Click default sometimes wouldn't detect the settings of a bar if one was in the same position, this has been resolved
								Dragging Custom Actions (Button Forge Configuration options) - These would sometimes drop straight off the cursor, this has been resolved
								Key Bind dialog has been shifted to appear above other UI elements (it is also possible to drag this dialog)
							- Features:
								Updated the GUI appearance
								Bar labels will now organise themselves for so they can be clicked to allow tabbing between bars if bars are in the same position
								Bar controls will now rearrange themselves to better use the space around the Action buttons
							
05-August-2010		v0.9.1	- Fixed:
								Equipment Sets will now be placed on the cursor when picked up off a Button Forge Bar
								Resolved stack overflow when creating excessively large bars (e.g. over 1000 buttons)
								Resolved issues causing some newly allocated buttons to be hidden and the bar to sometimes dissappear when allocating buttons
							- Features:
								Set a limit of 1500 buttons per bar and 5000 buttons total
								Added button for configuration mode
								Added ability to drag Button Forge Toolbar buttons to Button Forge bars
								Updated tooltip information
							
31-July-2010		v0.9.0	- Beta version of Button Forge
