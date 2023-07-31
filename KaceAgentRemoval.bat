REM ==================================================================================================================================
REM Batched Script Model -- Remove and Install New QUEST KACE agent (8.0 and above)
REM ==================================================================================================================================
REM NOTE: Batched Script code provided as a courtesy by KACE to its customers.
REM       We make no promises as to workability or functionality under certain circumstances.
REM       In default situations under normal setup these work as designed. 
REM       KACE does not support modification nor usage. 
REM       We highly recommend you test all code no matter the source before using in a production environment. 
REM       If you are cut and pasting the code, paste in to a text editor then copy back out to remove any hidden characters or markup.
REM ==================================================================================================================================
REM == Which directories and executables do I need to white-list for the SMA agent?
REM == See the reference -- https://support.quest.com/kb/111785
REM ==================================================================================================================================

 


@echo off

 

REM ==================================================================================================================================
REM == Detect KACE Agent
REM ==================================================================================================================================

 

echo Detect System Architecture: 32-bit or 64-bit
if exist "%ProgramFiles%\Quest\KACE\AMPTools.exe" goto x86QuestAgentPath
if exist "%ProgramFiles(x86)%\Quest\KACE\AMPTools.exe" goto x64QuestAgentPath

 

echo K1000 Agent is not installed. Needs install the QUEST KACE Agent!
goto QUEST_Install

 

:x86QuestAgentPath
echo Quest KACE Agent is detected in 32-bit Windows path
cd /D "%ProgramFiles%\Quest\KACE"
goto QuestAgentPath_Run

 

:x64QuestAgentPath
echo Quest KACE Agent is detected in 64-bit Windows path
cd /D "%ProgramFiles(x86)%\Quest\KACE"

 

:QuestAgentPath_Run
cd ..
echo Remove the Quest KACE Agent. Wait...
    start /wait KACE\AMPTools.exe uninstall all-kuid
    echo K1000 Agent is removed!

 

