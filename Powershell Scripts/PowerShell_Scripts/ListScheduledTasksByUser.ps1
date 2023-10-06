# Define the username for which you want to find the tasks
$userName = "UserName"

# Fetch all scheduled tasks
$scheduledTasks = Get-ScheduledTask | ForEach-Object {
    $taskInfo = $_ | Get-ScheduledTaskInfo
    [PSCustomObject]@{
        TaskName    = $_.TaskName
        TaskPath    = $_.TaskPath
        Author      = $_.Author
        State       = $taskInfo.State
        LastRunTime = $taskInfo.LastRunTime
        UserId      = $_.Principal.UserId
    }
}

# Filter tasks based on the username and display them
$filteredTasks = $scheduledTasks | Where-Object { $_.UserId -eq $userName }

$filteredTasks | Format-Table -AutoSize
